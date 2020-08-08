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
-- Description:	CRUD Clientes. Agrega un nuevo cliente al sistema
-- =============================================
CREATE PROCEDURE agregarCliente
	@idCliente int, @fk_idTelefono int, @nombre varchar(50), @apellido1 varchar(50),
	@apellido2 varchar(50), @correo varchar(60), @fechaCumpleanhos date,
	@direccion geography, @foto image, @contrasenha varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRY
	BEGIN TRAN
		INSERT INTO Cliente(idCliente, fk_idTelefono, nombre, apellido1, apellido2, correo, fechaCumpleanhos, direccion, foto, contrasenha)
		VALUES(@idCliente, @fk_idTelefono, @nombre, @apellido1,	@apellido2, @correo, @fechaCumpleanhos, @direccion, @foto, @contrasenha)
	COMMIT TRAN
	END TRY

	BEGIN CATCH
		ROLLBACK TRAN
		RAISERROR('Error al agregar los datos de un cliente', 3,1);
	END CATCH


		
END
GO
