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
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE modificarEmpleado
	@idEmpleado int, @fk_idSucursal int, @fk_idTipoEmpleado int, @fk_idTelefono int,
	@nombre varchar(50), @apellido1 varchar(50), @apellido2 varchar(50), @cedula varchar(60),
	@correo varchar(60), @fechaContratacion date, @foto image, @contrasenha varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
	BEGIN TRAN
		UPDATE Empleado
		SET fk_idSucursal=ISNULL(@fk_idSucursal, fk_idSucursal), fk_idTipoEmpleado=ISNULL(@fk_idTipoEmpleado, fk_idTipoEmpleado), 
			fk_idTelefono=ISNULL(@fk_idTelefono, fk_idTelefono), nombre=ISNULL(@nombre, nombre), apellido1=ISNULL(@apellido1, apellido1),
			apellido2=ISNULL(@apellido2, apellido2), cedula=ISNULL(@cedula, cedula), correo=ISNULL(@correo, correo), foto=ISNULL(@foto, foto),
			fechaContratacion=ISNULL(@fechaContratacion, fechaContratacion), contrasenha=ISNULL(@contrasenha, contrasenha)
		WHERE idEmpleado=@idEmpleado;
	COMMIT TRAN
	END TRY

	BEGIN CATCH
		ROLLBACK TRAN
		RAISERROR('Error al modificar los datos del empleado', 3,1);
	END CATCH
END
GO
