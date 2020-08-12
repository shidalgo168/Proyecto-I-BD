USE [proyectoBases]
GO

/****** Object:  StoredProcedure [dbo].[leerTipoEmpleado]    Script Date: 11/08/2020 07:36:50 p.m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[leerTipoEmpleado]
	@idTipoEmpleado int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT idTipoEmpleado,nombre,salario
	FROM TipoEmpleado
	WHERE @idTipoEmpleado=idTipoEmpleado;
END
GO


