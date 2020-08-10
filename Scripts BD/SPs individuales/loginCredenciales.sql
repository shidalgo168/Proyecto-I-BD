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
CREATE PROCEDURE loginCredenciales
	@correo varchar(60), @pwd varchar(50)
AS
BEGIN
	SET NOCOUNT ON;

    IF EXISTS (SELECT idCliente FROM Cliente WHERE @correo=correo AND @pwd=contrasenha)
		SELECT idCliente, fk_idTelefono, nombre, apellido1, apellido2, correo, fechaCumpleanhos, direccion, foto, contrasenha
		FROM Cliente
		WHERE @correo=correo AND @pwd=contrasenha;
	ELSE
		SELECT E.idEmpleado, E.fk_idSucursal, T.nombre, E.fk_idTelefono, E.nombre, E.apellido1, E.apellido2, E.correo, E.fechaContratacion, E.foto, E.contrasenha
		FROM Empleado E
		INNER JOIN TipoEmpleado T ON T.idTipoEmpleado=E.fk_idTipoEmpleado
		WHERE @correo=correo AND @pwd=contrasenha AND T.nombre='Gerente';
END
GO
