USE [proyectoBases]
GO
/****** Object:  StoredProcedure [dbo].[leerCliente]    Script Date: 8/9/2020 5:37:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Description:	CRUD Empleados. Lee los datos de un empleado según su ID (no cedula)
-- =============================================
CREATE PROCEDURE leerEmpleado
	@idEmpleado int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT idEmpleado, fk_idSucursal, fk_idTipoEmpleado, fk_idTelefono, nombre, apellido1, apellido2, cedula, correo, fechaContratacion, foto, contrasenha
	FROM Empleado
	WHERE @idEmpleado=idEmpleado;
END
