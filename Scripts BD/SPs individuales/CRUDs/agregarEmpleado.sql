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
-- Description:	CRUD Empleados. Agrega un nuevo empleado al sistema
-- =============================================
CREATE PROCEDURE agregarEmpleado
	@idEmpleado int, @fk_idSucursal int, @fk_idTipoEmpleado int, @fk_idTelefono int,
	@nombre varchar(50), @apellido1 varchar(50), @apellido2 varchar(50), @cedula varchar(60),
	@correo varchar(60), @fechaContratacion date, @foto image, @contrasenha varchar(50)
AS
BEGIN
	SET NOCOUNT ON;

    BEGIN TRY
	BEGIN TRAN
		INSERT INTO Empleado(idEmpleado, fk_idSucursal, fk_idTipoEmpleado, fk_idTelefono, nombre,
						apellido1, apellido2, cedula, correo, fechaContratacion, foto, contrasenha)
		VALUES(@idEmpleado, @fk_idSucursal, @fk_idTipoEmpleado, @fk_idTelefono, @nombre,
					@apellido1, @apellido2, @cedula, @correo, @fechaContratacion, @foto, @contrasenha)
	COMMIT TRAN
	END TRY

	BEGIN CATCH
		ROLLBACK TRAN
		RAISERROR('Error al agregar un empleado al sistema', 3,1);
	END CATCH
END
GO
