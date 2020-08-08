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
-- Description:	CRUD Productos. Agregar un nuevo producto a la lista ya existente
-- =============================================
CREATE PROCEDURE agregarProducto
	@idProducto int, @nombre varchar(50), @descripcion varchar(150),
	@foto image, @precio int
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
	BEGIN TRAN
		INSERT INTO Producto(idProducto, nombre, descripcion, foto, precio)
		VALUES(@idProducto, @nombre, @descripcion, @foto, @precio)
	COMMIT TRAN
	END TRY

	BEGIN CATCH
		ROLLBACK TRAN
		RAISERROR('Error al agregar los datos de un cliente', 3,1);
	END CATCH
END
GO
