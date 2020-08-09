USE [proyectoBases]
GO

/****** Object:  StoredProcedure [dbo].[cambiarEstadoCupon]    Script Date: 09/08/2020 02:56:42 p.m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[cambiarEstadoCupon] (@idC int)
as
begin
	if exists (select idCupon from openquery (MYSQL, 'select * from serviciocliente.Cupon') where idCupon= @idC)
	begin
			UPDATE OPENQUERY(MYSQL, 'SELECT * FROM serviciocliente.Cupon')
			SET estado = 0
			where idCupon = @idC;
	end
	else
		print ('No existe cupon')
end
GO


