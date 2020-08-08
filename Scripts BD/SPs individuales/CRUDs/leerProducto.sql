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
-- Description:	CRUD Productos. Leer los datos de un producto
-- =============================================
CREATE PROCEDURE leerProducto
	@idProducto int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT idProducto, nombre, descripcion, foto, precio
	FROM Producto
	WHERE @idProducto=idProducto;
END
GO
