USE [proyectoBases]
GO
/****** Object:  StoredProcedure [dbo].[realizarCompra]    Script Date: 8/9/2020 10:21:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sergio Hidalgo
-- Create date: 7/8/2020
-- Description:	Genera la factura dado un pedido en linea. Entradas: tabla del Pedido, tipo de la venta, cedula del cliente
-- =============================================
CREATE PROCEDURE [dbo].[realizarCompra]
	@pedido dbo.CarritoPedidoTABLE READONLY, @tipoVenta int,
	@clcedula int, @idEmpleado int, @idCupon int
AS
BEGIN
	SET NOCOUNT ON;

	-- Si el cliente no existe, almacena los datos del usuario
	IF (SELECT COUNT(idCliente) FROM Cliente WHERE idCliente=@clcedula)<>1
	BEGIN
		RAISERROR('Cedula del cliente no conocido por el sistema', 3,1);
	END;

	DECLARE @idFactura int, @idSucursal int, @idLineaFactura int,
			@idComision int, @cldir geography, @descuentoCupon float;

	SELECT @cldir = direccion FROM Cliente WHERE @clcedula=idCliente
	
	-- Obtiene la sucursal más cercana dado un punto geography (usa el SRID=4326)
	CREATE TABLE #SucursalCercana (distancia float, idSucursal int);
	INSERT INTO #SucursalCercana SELECT TOP(1) S.direccion.STDistance(@cldir) as Distancia, S.idSucursal
									FROM Sucursal S 
									ORDER BY Distancia ASC;
	SELECT @idSucursal=idSucursal FROM #SucursalCercana;
	DROP TABLE #SucursalCercana;

	-- Obtiene el siguiente ID que llevara la factura
	SELECT TOP(1) @idFactura=idFactura
	FROM Factura
	ORDER BY idFactura DESC;
	SET @idFactura = @idFactura+1;

	-- Obtiene el siguiente ID en las lineas de factura
	SELECT TOP(1) @idLineaFactura=idLineaFactura
	FROM LineaFactura
	ORDER BY idLineaFactura DESC;
	SET @idLineaFactura = @idLineaFactura+1;

	-- Obtiene el siguiente ID de las comisiones de ser necesarias
	SELECT TOP(1) @idComision=idComision
	FROM ComisionEmpleado
	ORDER BY idComision DESC;
	SET @idComision = @idComision+1;

	IF @idCupon IS NOT NULL
		SET @descuentoCupon = (select porcentaje from openquery (MYSQL, 'select * from serviciocliente.Cupon') where idCupon=@idCupon);
	ELSE
		SET @descuentoCupon = 1;


	DECLARE @totalProductosPedido int, @productoActual int = 1, @idProdTmp int, @cantProdTmp int, @precioTmp int;
	-- Obtiene la cantidad total de productos en el pedido
	SELECT @totalProductosPedido=COUNT(p.idPedido) FROM @pedido p;

	BEGIN TRAN
	BEGIN TRY
		INSERT INTO Factura (idFactura, fk_idCliente, fk_idSucursal, fk_idTipoEntrega, fechaVenta)
		VALUES(@idFactura, @clcedula, @idSucursal, @tipoVenta, GETDATE());

		WHILE @productoActual <= @totalProductosPedido
		BEGIN
			-- Obtiene los valores de un producto en el pedido a la vez
			SELECT @idProdTmp=PE.idProd, @cantProdTmp=PE.cantidad, @precioTmp=PROD.precio
			FROM @pedido PE INNER JOIN Producto PROD ON PROD.idProducto=PE.idProd
			WHERE PE.idPedido = @productoActual;

			-- Revisa que hayan productos disponibles en el inventario de la sucursal
			IF (SELECT cantidadDisponible-@cantProdTmp
				FROM Producto_X_Sucursal
				WHERE fk_idSucursal=@idSucursal AND fk_idProducto=@idProdTmp) >= 0
			BEGIN
				UPDATE Producto_X_Sucursal
				SET cantidadDisponible = cantidadDisponible-@cantProdTmp
				WHERE fk_idSucursal=@idSucursal AND fk_idProducto=@idProdTmp;

				INSERT INTO LineaFactura (idLineaFactura, fk_idFactura, fk_idProducto, cantidad, subtotal)
				VALUES(@idLineaFactura, @idFactura, @idProdTmp, @cantProdTmp, (@precioTmp*@cantProdTmp) - (@precioTmp*@cantProdTmp)*@descuentoCupon);
			END
			ELSE
				RAISERROR('No hay suficientes productos en la sucursal mas cercana', 20,1);

			SET @idLineaFactura = @idLineaFactura + 1;
			SET @productoActual = @productoActual + 1;
		END;

		IF @idCupon IS NOT NULL
			EXEC dbo.cambiarEstadoCupon @idC=@idCupon;

		-- Si a la compra le entra un valor en @idEmpleado, significa que ese vendedor deber tener cierta comisión de la venta
		IF @idEmpleado IS NOT NULL
		BEGIN
			INSERT INTO ComisionEmpleado(idComision, fk_idEmpleado, fk_idFactura)
			VALUES(@idComision, @idEmpleado, @idFactura);
		END;
	COMMIT TRAN
		PRINT 'Stored Procedure ha finalizado satisfactoriamente';
	END TRY

	BEGIN CATCH
		ROLLBACK TRAN
		RAISERROR('Error inesperado al agregar la informacion de las facturas', 3,1);
	END CATCH
END
