USE [proyectoBases]
GO

/****** Object:  StoredProcedure [dbo].[cambiarStatusTicket]    Script Date: 09/08/2020 08:12:13 p.m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[cambiarStatusTicket] (@idT int, @status varchar(100))
as
begin 
	if exists (select idTicket from openquery (MYSQL, 'select * from serviciocliente.Ticket') where idTicket= @idT)
	begin
		UPDATE OPENQUERY(MYSQL, 'SELECT * FROM serviciocliente.Ticket')
			SET statusTicket = @status
			where idTicket = @idT;
	end
	else
		print('Ticket no existe')
end
GO


