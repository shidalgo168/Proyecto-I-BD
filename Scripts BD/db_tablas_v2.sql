USE [master]
GO
/****** Object:  Database [proyectoBases]    Script Date: 8/11/2020 6:31:51 PM ******/
CREATE DATABASE [proyectoBases]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'proyectoBases', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\proyectoBases.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'proyectoBases_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\proyectoBases_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [proyectoBases] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [proyectoBases].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [proyectoBases] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [proyectoBases] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [proyectoBases] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [proyectoBases] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [proyectoBases] SET ARITHABORT OFF 
GO
ALTER DATABASE [proyectoBases] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [proyectoBases] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [proyectoBases] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [proyectoBases] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [proyectoBases] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [proyectoBases] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [proyectoBases] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [proyectoBases] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [proyectoBases] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [proyectoBases] SET  DISABLE_BROKER 
GO
ALTER DATABASE [proyectoBases] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [proyectoBases] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [proyectoBases] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [proyectoBases] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [proyectoBases] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [proyectoBases] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [proyectoBases] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [proyectoBases] SET RECOVERY FULL 
GO
ALTER DATABASE [proyectoBases] SET  MULTI_USER 
GO
ALTER DATABASE [proyectoBases] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [proyectoBases] SET DB_CHAINING OFF 
GO
ALTER DATABASE [proyectoBases] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [proyectoBases] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [proyectoBases] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'proyectoBases', N'ON'
GO
ALTER DATABASE [proyectoBases] SET QUERY_STORE = OFF
GO
USE [proyectoBases]
GO
/****** Object:  UserDefinedTableType [dbo].[CarritoPedidoTABLE]    Script Date: 8/11/2020 6:31:51 PM ******/
CREATE TYPE [dbo].[CarritoPedidoTABLE] AS TABLE(
	[idPedido] [int] IDENTITY(1,1) NOT NULL,
	[idProd] [int] NULL,
	[cantidad] [int] NULL
)
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 8/11/2020 6:31:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[idCliente] [int] NOT NULL,
	[fk_idTelefono] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido1] [varchar](50) NOT NULL,
	[apellido2] [varchar](50) NOT NULL,
	[correo] [varchar](60) NOT NULL,
	[fechaCumpleanhos] [date] NOT NULL,
	[direccion] [geography] NOT NULL,
	[foto] [image] NULL,
	[contrasenha] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ComisionEmpleado]    Script Date: 8/11/2020 6:31:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComisionEmpleado](
	[idComision] [int] NOT NULL,
	[fk_idEmpleado] [int] NOT NULL,
	[fk_idFactura] [int] NOT NULL,
 CONSTRAINT [PK_ComisionEmpleado] PRIMARY KEY CLUSTERED 
(
	[idComision] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 8/11/2020 6:31:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[idEmpleado] [int] NOT NULL,
	[fk_idSucursal] [int] NOT NULL,
	[fk_idTipoEmpleado] [int] NOT NULL,
	[fk_idTelefono] [int] NOT NULL,
	[nombre] [varchar](50) NULL,
	[apellido1] [varchar](50) NULL,
	[apellido2] [varchar](50) NULL,
	[cedula] [int] NOT NULL,
	[correo] [varchar](60) NULL,
	[fechaContratacion] [date] NOT NULL,
	[foto] [image] NULL,
	[contrasenha] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Empleado] PRIMARY KEY CLUSTERED 
(
	[idEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Factura]    Script Date: 8/11/2020 6:31:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factura](
	[idFactura] [int] NOT NULL,
	[fk_idCliente] [int] NOT NULL,
	[fk_idSucursal] [int] NOT NULL,
	[fk_idTipoEntrega] [int] NOT NULL,
	[fechaVenta] [datetime] NOT NULL,
 CONSTRAINT [PK_Factura] PRIMARY KEY CLUSTERED 
(
	[idFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LineaFactura]    Script Date: 8/11/2020 6:31:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LineaFactura](
	[idLineaFactura] [int] NOT NULL,
	[fk_idFactura] [int] NOT NULL,
	[fk_idProducto] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[subtotal] [int] NOT NULL,
 CONSTRAINT [PK_LineaFactura] PRIMARY KEY CLUSTERED 
(
	[idLineaFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 8/11/2020 6:31:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[idProducto] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [varchar](150) NOT NULL,
	[foto] [image] NULL,
	[precio] [int] NOT NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[idProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto_X_Sucursal]    Script Date: 8/11/2020 6:31:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto_X_Sucursal](
	[idProductoXSucursal] [int] NOT NULL,
	[fk_idSucursal] [int] NOT NULL,
	[fk_idProducto] [int] NOT NULL,
	[cantidadDisponible] [int] NOT NULL,
 CONSTRAINT [PK_Producto_X_Sucursal] PRIMARY KEY CLUSTERED 
(
	[idProductoXSucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sucursal]    Script Date: 8/11/2020 6:31:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sucursal](
	[idSucursal] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[fk_idTelefono] [int] NOT NULL,
	[direccion] [geography] NOT NULL,
 CONSTRAINT [PK_Sucursal] PRIMARY KEY CLUSTERED 
(
	[idSucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Telefono]    Script Date: 8/11/2020 6:31:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Telefono](
	[idTelefono] [int] NOT NULL,
	[fk_idTipoTelefono] [int] NOT NULL,
 CONSTRAINT [PK_Telefono] PRIMARY KEY CLUSTERED 
(
	[idTelefono] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoEmpleado]    Script Date: 8/11/2020 6:31:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoEmpleado](
	[idTipoEmpleado] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[salario] [decimal](12, 2) NOT NULL,
 CONSTRAINT [PK_TipoEmpleado] PRIMARY KEY CLUSTERED 
(
	[idTipoEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoEntrega]    Script Date: 8/11/2020 6:31:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoEntrega](
	[idTipoEntrega] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TipoEntrega] PRIMARY KEY CLUSTERED 
(
	[idTipoEntrega] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoTelefono]    Script Date: 8/11/2020 6:31:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoTelefono](
	[idTipoTelefono] [int] NOT NULL,
	[nombre] [varchar](20) NOT NULL,
 CONSTRAINT [PK_TipoTelefono] PRIMARY KEY CLUSTERED 
(
	[idTipoTelefono] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_Telefono] FOREIGN KEY([fk_idTelefono])
REFERENCES [dbo].[Telefono] ([idTelefono])
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [FK_Cliente_Telefono]
GO
ALTER TABLE [dbo].[ComisionEmpleado]  WITH CHECK ADD  CONSTRAINT [FK_ComisionEmpleado_Empleado] FOREIGN KEY([fk_idEmpleado])
REFERENCES [dbo].[Empleado] ([idEmpleado])
GO
ALTER TABLE [dbo].[ComisionEmpleado] CHECK CONSTRAINT [FK_ComisionEmpleado_Empleado]
GO
ALTER TABLE [dbo].[ComisionEmpleado]  WITH CHECK ADD  CONSTRAINT [FK_ComisionEmpleado_Factura] FOREIGN KEY([fk_idFactura])
REFERENCES [dbo].[Factura] ([idFactura])
GO
ALTER TABLE [dbo].[ComisionEmpleado] CHECK CONSTRAINT [FK_ComisionEmpleado_Factura]
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK_Empleado_Sucursal] FOREIGN KEY([fk_idSucursal])
REFERENCES [dbo].[Sucursal] ([idSucursal])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_Empleado_Sucursal]
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK_Empleado_Telefono] FOREIGN KEY([fk_idTelefono])
REFERENCES [dbo].[Telefono] ([idTelefono])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_Empleado_Telefono]
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK_Empleado_TipoEmpleado] FOREIGN KEY([fk_idTipoEmpleado])
REFERENCES [dbo].[TipoEmpleado] ([idTipoEmpleado])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_Empleado_TipoEmpleado]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Cliente] FOREIGN KEY([fk_idCliente])
REFERENCES [dbo].[Cliente] ([idCliente])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_Factura_Cliente]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Sucursal] FOREIGN KEY([fk_idSucursal])
REFERENCES [dbo].[Sucursal] ([idSucursal])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_Factura_Sucursal]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_TipoEntrega] FOREIGN KEY([fk_idTipoEntrega])
REFERENCES [dbo].[TipoEntrega] ([idTipoEntrega])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_Factura_TipoEntrega]
GO
ALTER TABLE [dbo].[LineaFactura]  WITH CHECK ADD  CONSTRAINT [FK_Carrito_X_Producto_Producto] FOREIGN KEY([fk_idProducto])
REFERENCES [dbo].[Producto] ([idProducto])
GO
ALTER TABLE [dbo].[LineaFactura] CHECK CONSTRAINT [FK_Carrito_X_Producto_Producto]
GO
ALTER TABLE [dbo].[LineaFactura]  WITH CHECK ADD  CONSTRAINT [FK_LineaFactura_Factura] FOREIGN KEY([fk_idFactura])
REFERENCES [dbo].[Factura] ([idFactura])
GO
ALTER TABLE [dbo].[LineaFactura] CHECK CONSTRAINT [FK_LineaFactura_Factura]
GO
ALTER TABLE [dbo].[Producto_X_Sucursal]  WITH CHECK ADD  CONSTRAINT [FK_Producto_X_Sucursal_Producto] FOREIGN KEY([fk_idProducto])
REFERENCES [dbo].[Producto] ([idProducto])
GO
ALTER TABLE [dbo].[Producto_X_Sucursal] CHECK CONSTRAINT [FK_Producto_X_Sucursal_Producto]
GO
ALTER TABLE [dbo].[Producto_X_Sucursal]  WITH CHECK ADD  CONSTRAINT [FK_Producto_X_Sucursal_Sucursal] FOREIGN KEY([fk_idSucursal])
REFERENCES [dbo].[Sucursal] ([idSucursal])
GO
ALTER TABLE [dbo].[Producto_X_Sucursal] CHECK CONSTRAINT [FK_Producto_X_Sucursal_Sucursal]
GO
ALTER TABLE [dbo].[Sucursal]  WITH CHECK ADD  CONSTRAINT [FK_Sucursal_Telefono] FOREIGN KEY([fk_idTelefono])
REFERENCES [dbo].[Telefono] ([idTelefono])
GO
ALTER TABLE [dbo].[Sucursal] CHECK CONSTRAINT [FK_Sucursal_Telefono]
GO
ALTER TABLE [dbo].[Telefono]  WITH CHECK ADD  CONSTRAINT [FK_Telefono_TipoTelefono] FOREIGN KEY([fk_idTipoTelefono])
REFERENCES [dbo].[TipoTelefono] ([idTipoTelefono])
GO
ALTER TABLE [dbo].[Telefono] CHECK CONSTRAINT [FK_Telefono_TipoTelefono]
GO
/****** Object:  StoredProcedure [dbo].[agregarCliente]    Script Date: 8/11/2020 6:31:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Description:	CRUD Clientes. Agrega un nuevo cliente al sistema
-- =============================================
CREATE PROCEDURE [dbo].[agregarCliente]
	@idCliente int, @fk_idTelefono int, @nombre varchar(50), @apellido1 varchar(50),
	@apellido2 varchar(50), @correo varchar(60), @fechaCumpleanhos date,
	@direccion geography, @foto image, @contrasenha varchar(50)
AS
BEGIN
	SET NOCOUNT ON;
	IF EXISTS (SELECT correo FROM Cliente WHERE correo=@correo UNION SELECT correo FROM Empleado WHERE correo=@correo)
		RAISERROR('Ya existe este correo en el sistema', 3,1);
	ELSE
	BEGIN
		BEGIN TRY
		BEGIN TRAN
			INSERT INTO Cliente(idCliente, fk_idTelefono, nombre, apellido1, apellido2, correo, fechaCumpleanhos, direccion, foto, contrasenha)
			VALUES(@idCliente, @fk_idTelefono, @nombre, @apellido1,	@apellido2, @correo, @fechaCumpleanhos, @direccion, @foto, @contrasenha);
		COMMIT TRAN
		END TRY

		BEGIN CATCH
			ROLLBACK TRAN
			RAISERROR('Error al agregar los datos de un cliente', 3,1);
		END CATCH
	END
END
GO
/****** Object:  StoredProcedure [dbo].[agregarEmpleado]    Script Date: 8/11/2020 6:31:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Description:	CRUD Empleados. Agrega un nuevo empleado al sistema
-- =============================================
CREATE PROCEDURE [dbo].[agregarEmpleado]
	@idEmpleado int, @fk_idSucursal int, @fk_idTipoEmpleado int, @fk_idTelefono int,
	@nombre varchar(50), @apellido1 varchar(50), @apellido2 varchar(50), @cedula varchar(60),
	@correo varchar(60), @fechaContratacion date, @foto image, @contrasenha varchar(50)
AS
BEGIN
	SET NOCOUNT ON;

	IF EXISTS (SELECT correo FROM Cliente WHERE correo=@correo UNION SELECT correo FROM Empleado WHERE correo=@correo)
		RAISERROR('Ya existe este correo en el sistema', 3,1);
	ELSE
	BEGIN
		BEGIN TRY
		BEGIN TRAN
			INSERT INTO Empleado(idEmpleado, fk_idSucursal, fk_idTipoEmpleado, fk_idTelefono, nombre,
							apellido1, apellido2, cedula, correo, fechaContratacion, foto, contrasenha)
			VALUES(@idEmpleado, @fk_idSucursal, @fk_idTipoEmpleado, @fk_idTelefono, @nombre,
						@apellido1, @apellido2, @cedula, @correo, @fechaContratacion, @foto, @contrasenha)
		COMMIT TRAN
		END TRY

		BEGIN CATCH
			ROLLBACK TRAN
			RAISERROR('Error al agregar un empleado al sistema', 3,1);
		END CATCH
	END
END
GO
/****** Object:  StoredProcedure [dbo].[agregarInventario]    Script Date: 8/11/2020 6:31:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	Agregar productos a 
-- =============================================
CREATE PROCEDURE [dbo].[agregarInventario]
	@idProducto int, @idSucursal int, @cant int
AS
BEGIN
	SET NOCOUNT ON;

	-- página debe validar que @cant sea un entero positivo
	DECLARE @idProdXSucursal int;
	SELECT TOP(1) @idProdXSucursal=idProductoXSucursal
	FROM Producto_X_Sucursal
	ORDER BY idProductoXSucursal DESC;
	SET @idProdXSucursal = @idProdXSucursal+1;

    BEGIN TRY
	BEGIN TRAN
		IF EXISTS (SELECT fk_idProducto FROM Producto_X_Sucursal WHERE fk_idProducto=@idProducto AND fk_idSucursal=@idSucursal)
		BEGIN
			UPDATE Producto_X_Sucursal
			SET cantidadDisponible = cantidadDisponible+@cant
			WHERE fk_idProducto=@idProducto AND fk_idSucursal=@idSucursal;
		END
		ELSE
		BEGIN
			INSERT INTO Producto_X_Sucursal(idProductoXSucursal, fk_idProducto, fk_idSucursal, cantidadDisponible)
			VALUES(@idProdXSucursal, @idProducto, @idSucursal, @cant)
		END
	COMMIT TRAN
	END TRY

	BEGIN CATCH
		ROLLBACK TRAN
		RAISERROR('Error al modificar los datos del producto', 3,1);
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[agregarProducto]    Script Date: 8/11/2020 6:31:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Description:	CRUD Productos. Agregar un nuevo producto a la lista ya existente
-- =============================================
CREATE PROCEDURE [dbo].[agregarProducto]
	@idProducto int, @nombre varchar(50), @descripcion varchar(150),
	@foto image, @precio int
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
	BEGIN TRAN
		INSERT INTO Producto(idProducto, nombre, descripcion, foto, precio)
		VALUES(@idProducto, @nombre, @descripcion, @foto, @precio)
	COMMIT TRAN
	END TRY

	BEGIN CATCH
		ROLLBACK TRAN
		RAISERROR('Error al agregar los datos de un cliente', 3,1);
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[calcularComision]    Script Date: 8/11/2020 6:31:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Description:	Calcula la comisión que tuvo un empleado con una venta realizada (idFactura)
-- =============================================
CREATE PROCEDURE [dbo].[calcularComision]
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
/****** Object:  StoredProcedure [dbo].[cambiarEstadoCupon]    Script Date: 8/11/2020 6:31:51 PM ******/
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
/****** Object:  StoredProcedure [dbo].[cambiarStatusTicket]    Script Date: 8/11/2020 6:31:51 PM ******/
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
/****** Object:  StoredProcedure [dbo].[crearTicket]    Script Date: 8/11/2020 6:31:51 PM ******/
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
/****** Object:  StoredProcedure [dbo].[leerCliente]    Script Date: 8/11/2020 6:31:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Description:	CRUD Clientes. Leer cliente según la cédula de entrada
-- =============================================
CREATE PROCEDURE [dbo].[leerCliente]
	@idCliente int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT idCliente, fk_idTelefono, nombre, apellido1, apellido2, correo, fechaCumpleanhos, direccion, foto, contrasenha
	FROM Cliente
	WHERE @idCliente=idCliente;
END
GO
/****** Object:  StoredProcedure [dbo].[leerEmpleado]    Script Date: 8/11/2020 6:31:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Description:	CRUD Empleados. Lee los datos de un empleado según su ID (no cedula)
-- =============================================
CREATE PROCEDURE [dbo].[leerEmpleado]
	@idEmpleado int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT idEmpleado, fk_idSucursal, fk_idTipoEmpleado, fk_idTelefono, nombre, apellido1, apellido2, cedula, correo, fechaContratacion, foto, contrasenha
	FROM Empleado
	WHERE @idEmpleado=idEmpleado;
END
GO
/****** Object:  StoredProcedure [dbo].[leerProducto]    Script Date: 8/11/2020 6:31:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Description:	CRUD Productos. Leer los datos de un producto
-- =============================================
CREATE PROCEDURE [dbo].[leerProducto]
	@idProducto int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT idProducto, nombre, descripcion, foto, precio
	FROM Producto
	WHERE @idProducto=idProducto;
END
GO
/****** Object:  StoredProcedure [dbo].[loginCredenciales]    Script Date: 8/11/2020 6:31:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[loginCredenciales]
	@correo varchar(60), @pwd varchar(50)
AS
BEGIN
	SET NOCOUNT ON;

    IF EXISTS (SELECT idCliente FROM Cliente WHERE @correo=correo AND @pwd=contrasenha)
		SELECT idCliente, fk_idTelefono, nombre, apellido1, apellido2, correo, fechaCumpleanhos, direccion, foto, contrasenha
		FROM Cliente
		WHERE @correo=correo AND @pwd=contrasenha;
	ELSE
		SELECT E.idEmpleado, E.fk_idSucursal, T.nombre, E.fk_idTelefono, E.nombre, E.apellido1, E.apellido2, E.correo, E.fechaContratacion, E.foto, E.contrasenha
		FROM Empleado E
		INNER JOIN TipoEmpleado T ON T.idTipoEmpleado=E.fk_idTipoEmpleado
		WHERE @correo=correo AND @pwd=contrasenha AND T.nombre='Gerente';
END
GO
/****** Object:  StoredProcedure [dbo].[modificarCliente]    Script Date: 8/11/2020 6:31:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Description:	CRUD Clientes. Modificar todos los posibles valores de un cliente
-- =============================================
CREATE PROCEDURE [dbo].[modificarCliente]
	@idCliente int, @fk_idTelefono int, @nombre varchar(50), @apellido1 varchar(50),
	@apellido2 varchar(50), @correo varchar(60), @fechaCumpleanhos date,
	@direccion geography, @foto image, @contrasenha varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
	BEGIN TRAN
		UPDATE Cliente
		SET fk_idTelefono=ISNULL(@fk_idTelefono, fk_idTelefono), nombre=ISNULL(@nombre, nombre),
		apellido1=ISNULL(@apellido1, apellido1), apellido2=ISNULL(@apellido2, apellido2),
			correo=ISNULL(@correo, correo), fechaCumpleanhos=ISNULL(@fechaCumpleanhos, fechaCumpleanhos),
			direccion=ISNULL(@direccion, direccion), foto=ISNULL(@foto, foto), contrasenha=ISNULL(@contrasenha, contrasenha)
		WHERE idCliente=@idCliente;
	COMMIT TRAN
	END TRY

	BEGIN CATCH
		ROLLBACK TRAN
		RAISERROR('Error al modificar los datos del usuario', 3,1);
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[modificarEmpleado]    Script Date: 8/11/2020 6:31:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[modificarEmpleado]
	@idEmpleado int, @fk_idSucursal int, @fk_idTipoEmpleado int, @fk_idTelefono int,
	@nombre varchar(50), @apellido1 varchar(50), @apellido2 varchar(50), @cedula varchar(60),
	@correo varchar(60), @fechaContratacion date, @foto image, @contrasenha varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
	BEGIN TRAN
		UPDATE Empleado
		SET fk_idSucursal=ISNULL(@fk_idSucursal, fk_idSucursal), fk_idTipoEmpleado=ISNULL(@fk_idTipoEmpleado, fk_idTipoEmpleado), 
			fk_idTelefono=ISNULL(@fk_idTelefono, fk_idTelefono), nombre=ISNULL(@nombre, nombre), apellido1=ISNULL(@apellido1, apellido1),
			apellido2=ISNULL(@apellido2, apellido2), cedula=ISNULL(@cedula, cedula), correo=ISNULL(@correo, correo), foto=ISNULL(@foto, foto),
			fechaContratacion=ISNULL(@fechaContratacion, fechaContratacion), contrasenha=ISNULL(@contrasenha, contrasenha)
		WHERE idEmpleado=@idEmpleado;
	COMMIT TRAN
	END TRY

	BEGIN CATCH
		ROLLBACK TRAN
		RAISERROR('Error al modificar los datos del empleado', 3,1);
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[modificarProducto]    Script Date: 8/11/2020 6:31:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Description:	CRUD Productos. Modificar los atributos de un producto especifico
-- =============================================
CREATE PROCEDURE [dbo].[modificarProducto]
	@idProducto int, @nombre varchar(50), @descripcion varchar(150),
	@foto image, @precio int
AS
BEGIN
	SET NOCOUNT ON;

    BEGIN TRY
	BEGIN TRAN
		UPDATE Producto
		SET nombre=ISNULL(@nombre, nombre), descripcion=ISNULL(@descripcion, descripcion),
		foto=ISNULL(@foto, foto), precio=ISNULL(@precio, precio)
		WHERE idProducto=@idProducto;
	COMMIT TRAN
	END TRY

	BEGIN CATCH
		ROLLBACK TRAN
		RAISERROR('Error al modificar los datos del producto', 3,1);
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[realizarCompra]    Script Date: 8/11/2020 6:31:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sergio Hidalgo
-- Create date: 7/8/2020
-- Description:	Genera la factura dado un pedido en linea. Entradas: tabla del Pedido, tipo de la venta, cedula del cliente
-- =============================================
CREATE PROCEDURE [dbo].[realizarCompra]
	@pedido dbo.CarritoPedidoTABLE READONLY, @tipoVenta int,
	@clcedula int, @idEmpleado int, @idCupon int
AS
BEGIN
	SET NOCOUNT ON;

	-- Si el cliente no existe, almacena los datos del usuario
	IF (SELECT COUNT(idCliente) FROM Cliente WHERE idCliente=@clcedula)<>1
	BEGIN
		RAISERROR('Cedula del cliente no conocido por el sistema', 3,1);
	END;

	DECLARE @idFactura int, @idSucursal int, @idLineaFactura int,
			@idComision int, @cldir geography, @descuentoCupon float;

	SELECT @cldir = direccion FROM Cliente WHERE @clcedula=idCliente
	
	-- Obtiene la sucursal más cercana dado un punto geography (usa el SRID=4326)
	CREATE TABLE #SucursalCercana (distancia float, idSucursal int);
	INSERT INTO #SucursalCercana SELECT TOP(1) S.direccion.STDistance(@cldir) as Distancia, S.idSucursal
									FROM Sucursal S 
									ORDER BY Distancia ASC;
	SELECT @idSucursal=idSucursal FROM #SucursalCercana;
	DROP TABLE #SucursalCercana;

	-- Obtiene el siguiente ID que llevara la factura
	SELECT TOP(1) @idFactura=idFactura
	FROM Factura
	ORDER BY idFactura DESC;
	SET @idFactura = @idFactura+1;

	-- Obtiene el siguiente ID en las lineas de factura
	SELECT TOP(1) @idLineaFactura=idLineaFactura
	FROM LineaFactura
	ORDER BY idLineaFactura DESC;
	SET @idLineaFactura = @idLineaFactura+1;

	-- Obtiene el siguiente ID de las comisiones de ser necesarias
	SELECT TOP(1) @idComision=idComision
	FROM ComisionEmpleado
	ORDER BY idComision DESC;
	SET @idComision = @idComision+1;

	IF @idCupon IS NOT NULL
		SET @descuentoCupon = (select porcentaje from openquery (MYSQL, 'select * from serviciocliente.Cupon') where idCupon=@idCupon);
	ELSE
		SET @descuentoCupon = 1;


	DECLARE @totalProductosPedido int, @productoActual int = 1, @idProdTmp int, @cantProdTmp int, @precioTmp int;
	-- Obtiene la cantidad total de productos en el pedido
	SELECT @totalProductosPedido=COUNT(p.idPedido) FROM @pedido p;

	BEGIN TRAN
	BEGIN TRY
		INSERT INTO Factura (idFactura, fk_idCliente, fk_idSucursal, fk_idTipoEntrega, fechaVenta)
		VALUES(@idFactura, @clcedula, @idSucursal, @tipoVenta, GETDATE());

		WHILE @productoActual <= @totalProductosPedido
		BEGIN
			-- Obtiene los valores de un producto en el pedido a la vez
			SELECT @idProdTmp=PE.idProd, @cantProdTmp=PE.cantidad, @precioTmp=PROD.precio
			FROM @pedido PE INNER JOIN Producto PROD ON PROD.idProducto=PE.idProd
			WHERE PE.idPedido = @productoActual;

			-- Revisa que hayan productos disponibles en el inventario de la sucursal
			IF (SELECT cantidadDisponible-@cantProdTmp
				FROM Producto_X_Sucursal
				WHERE fk_idSucursal=@idSucursal AND fk_idProducto=@idProdTmp) >= 0
			BEGIN
				UPDATE Producto_X_Sucursal
				SET cantidadDisponible = cantidadDisponible-@cantProdTmp
				WHERE fk_idSucursal=@idSucursal AND fk_idProducto=@idProdTmp;

				INSERT INTO LineaFactura (idLineaFactura, fk_idFactura, fk_idProducto, cantidad, subtotal)
				VALUES(@idLineaFactura, @idFactura, @idProdTmp, @cantProdTmp, (@precioTmp*@cantProdTmp) - (@precioTmp*@cantProdTmp)*@descuentoCupon);
			END
			ELSE
				RAISERROR('No hay suficientes productos en la sucursal mas cercana', 20,1);

			SET @idLineaFactura = @idLineaFactura + 1;
			SET @productoActual = @productoActual + 1;
		END;

		IF @idCupon IS NOT NULL
			EXEC dbo.cambiarEstadoCupon @idC=@idCupon;

		-- Si a la compra le entra un valor en @idEmpleado, significa que ese vendedor deber tener cierta comisión de la venta
		IF @idEmpleado IS NOT NULL
		BEGIN
			INSERT INTO ComisionEmpleado(idComision, fk_idEmpleado, fk_idFactura)
			VALUES(@idComision, @idEmpleado, @idFactura);
		END;
	COMMIT TRAN
		PRINT 'Stored Procedure ha finalizado satisfactoriamente';
	END TRY

	BEGIN CATCH
		ROLLBACK TRAN
		RAISERROR('Error inesperado al agregar la informacion de las facturas', 3,1);
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[verCatalogo]    Script Date: 8/11/2020 6:31:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[verCatalogo]
AS
BEGIN
	SET NOCOUNT ON;

    SELECT idProducto, nombre, descripcion, foto, precio
	FROM Producto
END
GO
/****** Object:  StoredProcedure [dbo].[verCuponesDisponibles]    Script Date: 8/11/2020 6:31:51 PM ******/
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
/****** Object:  StoredProcedure [dbo].[verDetallesFactura]    Script Date: 8/11/2020 6:31:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[verDetallesFactura]
	@idFactura int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT F.idFactura, P.idProducto, P.nombre, LN.cantidad, LN.subtotal
	FROM Factura F
	INNER JOIN LineaFactura LN ON LN.fk_idFactura=F.idFactura
	INNER JOIN Producto P ON P.idProducto=LN.fk_idProducto
	WHERE @idFactura=F.idFactura
END
GO
/****** Object:  StoredProcedure [dbo].[verFacturasDeCliente]    Script Date: 8/11/2020 6:31:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[verFacturasDeCliente]
	@clCliente int
AS
BEGIN
	SET NOCOUNT ON;

    SELECT idFactura, fk_idSucursal, fk_idTipoEntrega, fechaVenta
	FROM Factura
	WHERE fk_idCliente=@clCliente
END
GO
/****** Object:  StoredProcedure [dbo].[verReporte]    Script Date: 8/11/2020 6:31:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ============================================= 
-- Description:	Un gerente general puede obtener reportes/información respecto a ventas por sucursal o generales, montos y
--				cantidad de productos vendidos por sucursal o generales, en rangos de tiempo, por vendedor.
--				Ganancias por sucursal, por fechas, productos y/o generales. 
-- =============================================
 
create PROCEDURE [dbo].[verReporte]
	@idSucursal int = NULL, @idProducto int = NULL, @rangoInicial date = NULL,
	@rangoFinal date = NULL, @idVendedor int = NULL
AS
BEGIN
	SET NOCOUNT ON;

	-- Ambos selects son casi iguales, sólo se agrega un filtro en el WHERE cuando se tienen ambas fechas
	IF @rangoInicial IS NOT NULL AND @rangoFinal IS NOT NULL
		SELECT Fac.idFactura, Lin.fk_idProducto AS 'ID Producto', sum(Lin.cantidad) AS 'CantidadProdVendidos', sum(Lin.subtotal) AS 'GananciaVentas',
				Fac.fechaVenta, Com.fk_idEmpleado AS 'ID Vendedor'
		FROM Factura Fac
		INNER JOIN LineaFactura Lin ON Lin.fk_idFactura=Fac.idFactura
		INNER JOIN Producto Prod ON Prod.idProducto=Lin.fk_idProducto
		INNER JOIN ComisionEmpleado Com ON Com.fk_idFactura=Fac.idFactura
		WHERE Fac.fk_idSucursal=ISNULL(@idSucursal, Fac.fk_idSucursal)
			AND Lin.fk_idProducto=ISNULL(@idProducto, Lin.fk_idProducto)
			AND Com.fk_idEmpleado=ISNULL(@idVendedor, Com.fk_idEmpleado)
			AND (Fac.fechaVenta >= @rangoInicial AND Fac.fechaVenta <= @rangoFinal)
		GROUP BY
			Fac.fk_idCliente, Com.fk_idEmpleado, CUBE(Lin.fk_idProducto, Fac.idFactura), Fac.fechaVenta;
	ELSE
		SELECT Fac.idFactura, Lin.fk_idProducto AS 'ID Producto', sum(Lin.cantidad) AS 'CantidadProdVendidos', sum(Lin.subtotal) AS 'GananciaVentas',
				Fac.fechaVenta, Com.fk_idEmpleado AS 'ID Vendedor'
		FROM Factura Fac
		INNER JOIN LineaFactura Lin ON Lin.fk_idFactura=Fac.idFactura
		INNER JOIN Producto Prod ON Prod.idProducto=Lin.fk_idProducto
		INNER JOIN ComisionEmpleado Com ON Com.fk_idFactura=Fac.idFactura
		WHERE Fac.fk_idSucursal=ISNULL(@idSucursal, Fac.fk_idSucursal)
			AND Lin.fk_idProducto=ISNULL(@idProducto, Lin.fk_idProducto)
			AND Com.fk_idEmpleado=ISNULL(@idVendedor, Com.fk_idEmpleado)
		GROUP BY
			Fac.fk_idCliente, Com.fk_idEmpleado, CUBE(Lin.fk_idProducto, Fac.idFactura), Fac.fechaVenta;
END
GO
USE [master]
GO
ALTER DATABASE [proyectoBases] SET  READ_WRITE 
GO
