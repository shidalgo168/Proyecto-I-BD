USE [proyectoBases]
GO

/****** Object:  StoredProcedure [dbo].[agregarTipoEmpleado]    Script Date: 11/08/2020 07:30:40 p.m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[agregarTipoEmpleado](@id int,@nom varchar(50),@salar decimal(12,2))
as
begin
	SET NOCOUNT ON;

	IF EXISTS (SELECT idTipoEmpleado FROM TipoEmpleado WHERE idTipoEmpleado=@id)
		RAISERROR('Ya existe este tipo empleado en el sistema', 3,1);
	ELSE
	BEGIN
	BEGIN TRY
		BEGIN TRAN
			insert into TipoEmpleado (idTipoEmpleado,nombre,salario)
			values (@id,@nom, @salar)
		COMMIT TRAN
		END TRY

		BEGIN CATCH
			ROLLBACK TRAN
			RAISERROR('Error al agregar los datos de tipo empleado', 3,1);
		END CATCH
	END
end
GO


