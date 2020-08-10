USE [proyectoBases]
GO

/****** Object:  StoredProcedure [dbo].[crearTicket]    Script Date: 09/08/2020 08:11:39 p.m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[crearTicket] (@idC int, @idE int, @problema varchar(100), @subject varchar(100))
as
begin
	if exists (select idEncargadoAtencionCliente from openquery (MYSQL, 'select * from serviciocliente.EncargadoAtencionCliente') where idEncargadoAtencionCliente= @idE)
	begin
		if exists(select idCliente from Cliente where @idC = idCliente)
		begin
				INSERT INTO OPENQUERY(MYSQL, 
			  'SELECT issue, subjectTicket, idEncargadoAtencionCliente, idCliente, statusTicket
			   FROM serviciocliente.Ticket'
			)
			SELECT @problema as issue, 
				@subject as subjectTicket, 
				@idE as idEncargadoAtenciocliente, 
				@idC as idCliente, 
				'recibido' AS statusTicket

				print('Ticket creado')
		end
		else
			print('Cliente no existe')
	end
	else
		print ('No existe empleado')
end
GO


