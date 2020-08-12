USE [proyectoBases]
GO

/****** Object:  StoredProcedure [dbo].[modificarTipoEmpleado]    Script Date: 11/08/2020 07:41:48 p.m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[modificarTipoEmpleado]
@idTipoEmpleado int,
@nombre varchar(50),
@salario decimal(12,2)
as
begin 
	SET NOCOUNT ON;

    BEGIN TRY
	BEGIN TRAN
		UPDATE TipoEmpleado
		SET  nombre=ISNULL(@nombre, nombre),
		salario=ISNULL(@salario, salario)
		WHERE idTipoEmpleado=@idTipoEmpleado;
	COMMIT TRAN
	END TRY

	BEGIN CATCH
		ROLLBACK TRAN
		RAISERROR('Error al modificar los datos del tipo empleado', 3,1);
	END CATCH
end
GO


