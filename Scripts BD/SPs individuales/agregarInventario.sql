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
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	Agregar productos a 
-- =============================================
CREATE PROCEDURE agregarInventario
	@idProducto int, @idSucursal int, @cant int
AS
BEGIN
	SET NOCOUNT ON;

	-- página debe validar que @cant sea un entero positivo
	DECLARE @idProdXSucursal int;
	SELECT TOP(1) @idProdXSucursal=idProductoXSucursal
	FROM Producto_X_Sucursal
	ORDER BY idProductoXSucursal DESC;
	SET @idProdXSucursal = @idProdXSucursal+1;

    BEGIN TRY
	BEGIN TRAN
		IF EXISTS (SELECT fk_idProducto FROM Producto_X_Sucursal WHERE fk_idProducto=@idProducto AND fk_idSucursal=@idSucursal)
		BEGIN
			UPDATE Producto_X_Sucursal
			SET cantidadDisponible = cantidadDisponible+@cant
			WHERE fk_idProducto=@idProducto AND fk_idSucursal=@idSucursal;
		END
		ELSE
		BEGIN
			INSERT INTO Producto_X_Sucursal(idProductoXSucursal, fk_idProducto, fk_idSucursal, cantidadDisponible)
			VALUES(@idProdXSucursal, @idProducto, @idSucursal, @cant)
		END
	COMMIT TRAN
	END TRY

	BEGIN CATCH
		ROLLBACK TRAN
		RAISERROR('Error al modificar los datos del producto', 3,1);
	END CATCH
END
GO
