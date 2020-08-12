-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ============================================= 
-- Description:	Un gerente general puede obtener reportes/información respecto a ventas por sucursal o generales, montos y
--				cantidad de productos vendidos por sucursal o generales, en rangos de tiempo, por vendedor.
--				Ganancias por sucursal, por fechas, productos y/o generales. 
-- =============================================
 
CREATE PROCEDURE verReporte
	@idSucursal int = NULL, @idProducto int = NULL, @rangoInicial date = NULL,
	@rangoFinal date = NULL, @idVendedor int = NULL
AS
BEGIN
	SET NOCOUNT ON;

	-- Ambos selects son casi iguales, sólo se agrega un filtro en el WHERE cuando se tienen ambas fechas
	IF @rangoInicial IS NOT NULL AND @rangoFinal IS NOT NULL
		SELECT Fac.idFactura, Lin.fk_idProducto AS 'ID Producto', sum(Lin.cantidad) AS 'CantidadProdVendidos', sum(Lin.subtotal) AS 'GananciaVentas',
				Fac.fechaVenta, Com.fk_idEmpleado AS 'ID Vendedor'
		FROM Factura Fac
		INNER JOIN LineaFactura Lin ON Lin.fk_idFactura=Fac.idFactura
		INNER JOIN Producto Prod ON Prod.idProducto=Lin.fk_idProducto
		INNER JOIN ComisionEmpleado Com ON Com.fk_idFactura=Fac.idFactura
		WHERE Fac.fk_idSucursal=ISNULL(@idSucursal, Fac.fk_idSucursal)
			AND Lin.fk_idProducto=ISNULL(@idProducto, Lin.fk_idProducto)
			AND Com.fk_idEmpleado=ISNULL(@idVendedor, Com.fk_idEmpleado)
			AND (Fac.fechaVenta >= @rangoInicial AND Fac.fechaVenta <= @rangoFinal)
		GROUP BY
			Fac.fk_idCliente, Com.fk_idEmpleado, CUBE(Lin.fk_idProducto, Fac.idFactura), Fac.fechaVenta;
	ELSE
		SELECT Fac.idFactura, Lin.fk_idProducto AS 'ID Producto', sum(Lin.cantidad) AS 'CantidadProdVendidos', sum(Lin.subtotal) AS 'GananciaVentas',
				Fac.fechaVenta, Com.fk_idEmpleado AS 'ID Vendedor'
		FROM Factura Fac
		INNER JOIN LineaFactura Lin ON Lin.fk_idFactura=Fac.idFactura
		INNER JOIN Producto Prod ON Prod.idProducto=Lin.fk_idProducto
		INNER JOIN ComisionEmpleado Com ON Com.fk_idFactura=Fac.idFactura
		WHERE Fac.fk_idSucursal=ISNULL(@idSucursal, Fac.fk_idSucursal)
			AND Lin.fk_idProducto=ISNULL(@idProducto, Lin.fk_idProducto)
			AND Com.fk_idEmpleado=ISNULL(@idVendedor, Com.fk_idEmpleado)
		GROUP BY
			Fac.fk_idCliente, Com.fk_idEmpleado, CUBE(Lin.fk_idProducto, Fac.idFactura), Fac.fechaVenta;
END
GO
