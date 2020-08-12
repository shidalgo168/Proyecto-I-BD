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
-- Description:	CRUD Clientes. Modificar todos los posibles valores de un cliente
-- =============================================
CREATE PROCEDURE modificarCliente
	@idCliente int , @fk_idTelefono int =NULL, @nombre varchar(50) =NULL, @apellido1 varchar(50) =NULL,
	@apellido2 varchar(50) =NULL, @correo varchar(60) =NULL, @fechaCumpleanhos date =NULL,
	@direccion geography =NULL, @foto image =NULL, @contrasenha varchar(50) =NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
	BEGIN TRAN
		UPDATE Cliente
		SET fk_idTelefono=ISNULL(@fk_idTelefono, fk_idTelefono), nombre=ISNULL(@nombre, nombre),
		apellido1=ISNULL(@apellido1, apellido1), apellido2=ISNULL(@apellido2, apellido2),
			correo=ISNULL(@correo, correo), fechaCumpleanhos=ISNULL(@fechaCumpleanhos, fechaCumpleanhos),
			direccion=ISNULL(@direccion, direccion), foto=ISNULL(@foto, foto), contrasenha=ISNULL(@contrasenha, contrasenha)
		WHERE idCliente=@idCliente;
	COMMIT TRAN
	END TRY

	BEGIN CATCH
		ROLLBACK TRAN
		RAISERROR('Error al modificar los datos del usuario', 3,1);
	END CATCH
END
GO
