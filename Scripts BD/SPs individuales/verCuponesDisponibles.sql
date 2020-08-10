USE [proyectoBases]
GO

/****** Object:  StoredProcedure [dbo].[verCuponesDisponibles]    Script Date: 09/08/2020 02:38:05 p.m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[verCuponesDisponibles] (@idC int)
as
begin 
	if exists(select idCliente from Cliente where @idC = idCliente)
		begin
			
			select idCupon, porcentaje, fechaExpiracion
			from openquery (MYSQL, 'select * from serviciocliente.Cupon') where idCliente = @idC and estado = 1 and fechaExpiracion >= GETDATE()
		end
	else
		print('Cliente no existe')

end
GO


