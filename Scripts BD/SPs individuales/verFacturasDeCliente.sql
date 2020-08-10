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
CREATE PROCEDURE verFacturasDeCliente
	@clCliente int
AS
BEGIN
	SET NOCOUNT ON;

    SELECT idFactura, fk_idSucursal, fk_idTipoEntrega, fechaVenta
	FROM Factura
	WHERE fk_idCliente=@clCliente
END
GO
