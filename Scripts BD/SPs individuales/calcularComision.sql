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
-- Description:	Calcula la comisión que tuvo un empleado con una venta realizada (idFactura)
-- =============================================
CREATE PROCEDURE calcularComision
	@idEmpleado int, @idFactura int
AS
BEGIN
	SET NOCOUNT ON;

    -- %5 de comisión por venta
	select SUM(LF.subtotal)*0.05
	FROM ComisionEmpleado Com
	INNER JOIN LineaFactura LF ON LF.fk_idFactura=Com.fk_idFactura
	WHERE Com.fk_idEmpleado=5 AND LF.fk_idFactura=1
END
GO
