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
-- Description:	CRUD Clientes. Leer cliente según la cédula de entrada
-- =============================================
CREATE PROCEDURE leerCliente
	@idCliente int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT idCliente, fk_idTelefono, nombre, apellido1, apellido2, correo, fechaCumpleanhos, direccion, foto, contrasenha
	FROM Cliente
	WHERE @idCliente=idCliente;
END
GO
