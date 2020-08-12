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
-- Description:	CRUD Productos. Modificar los atributos de un producto especifico
-- =============================================
CREATE PROCEDURE modificarProducto
	@idProducto int, @nombre varchar(50)  = NULL, @descripcion varchar(150)  = NULL, 
	@foto image  = NULL, @precio int  = NULL
AS
BEGIN
	SET NOCOUNT ON;

    BEGIN TRY
	BEGIN TRAN
		UPDATE Producto
		SET nombre=ISNULL(@nombre, nombre), descripcion=ISNULL(@descripcion, descripcion),
		foto=ISNULL(@foto, foto), precio=ISNULL(@precio, precio)
		WHERE idProducto=@idProducto;
	COMMIT TRAN
	END TRY

	BEGIN CATCH
		ROLLBACK TRAN
		RAISERROR('Error al modificar los datos del producto', 3,1);
	END CATCH
END
GO
