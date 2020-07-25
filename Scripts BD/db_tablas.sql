USE [master]
GO
/****** Object:  Database [proyectoBases]    Script Date: 7/25/2020 12:23:01 PM ******/
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
/****** Object:  Table [dbo].[Carrito_X_Producto]    Script Date: 7/25/2020 12:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carrito_X_Producto](
	[idCarritoXProducto] [int] NOT NULL,
	[fk_idCarritoCompra] [int] NOT NULL,
	[fk_idProducto] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[subtotal] [int] NOT NULL,
 CONSTRAINT [PK_Carrito_X_Producto] PRIMARY KEY CLUSTERED 
(
	[idCarritoXProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarritoCompra]    Script Date: 7/25/2020 12:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarritoCompra](
	[idCarritoCompra] [int] NOT NULL,
	[fk_idCliente] [int] NOT NULL,
	[fk_idSucursal] [int] NOT NULL,
 CONSTRAINT [PK_CarritoCompra] PRIMARY KEY CLUSTERED 
(
	[idCarritoCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 7/25/2020 12:23:02 PM ******/
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
	[fechaCumpleaños] [date] NOT NULL,
	[direccion] [geography] NOT NULL,
	[foto] [image] NULL,
	[contrasenha] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ComisionEmpleado]    Script Date: 7/25/2020 12:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComisionEmpleado](
	[idComision] [int] NOT NULL,
	[fk_idEmpleado] [int] NOT NULL,
	[fk_idFactura] [int] NOT NULL,
	[montoComision] [decimal](12, 2) NOT NULL,
 CONSTRAINT [PK_ComisionEmpleado] PRIMARY KEY CLUSTERED 
(
	[idComision] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 7/25/2020 12:23:02 PM ******/
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
/****** Object:  Table [dbo].[Factura]    Script Date: 7/25/2020 12:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factura](
	[idFactura] [int] NOT NULL,
	[fk_idCarritoCompra] [int] NOT NULL,
	[fk_idTipoEntrega] [int] NOT NULL,
	[fechaVenta] [datetime] NOT NULL,
	[montoTotal] [int] NOT NULL,
 CONSTRAINT [PK_Factura] PRIMARY KEY CLUSTERED 
(
	[idFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 7/25/2020 12:23:02 PM ******/
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
/****** Object:  Table [dbo].[Producto_X_Sucursal]    Script Date: 7/25/2020 12:23:02 PM ******/
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
/****** Object:  Table [dbo].[Sucursal]    Script Date: 7/25/2020 12:23:02 PM ******/
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
/****** Object:  Table [dbo].[Telefono]    Script Date: 7/25/2020 12:23:02 PM ******/
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
/****** Object:  Table [dbo].[TipoEmpleado]    Script Date: 7/25/2020 12:23:02 PM ******/
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
/****** Object:  Table [dbo].[TipoEntrega]    Script Date: 7/25/2020 12:23:02 PM ******/
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
/****** Object:  Table [dbo].[TipoTelefono]    Script Date: 7/25/2020 12:23:02 PM ******/
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
ALTER TABLE [dbo].[Carrito_X_Producto]  WITH CHECK ADD  CONSTRAINT [FK_Carrito_X_Producto_CarritoCompra] FOREIGN KEY([fk_idCarritoCompra])
REFERENCES [dbo].[CarritoCompra] ([idCarritoCompra])
GO
ALTER TABLE [dbo].[Carrito_X_Producto] CHECK CONSTRAINT [FK_Carrito_X_Producto_CarritoCompra]
GO
ALTER TABLE [dbo].[Carrito_X_Producto]  WITH CHECK ADD  CONSTRAINT [FK_Carrito_X_Producto_Producto] FOREIGN KEY([fk_idProducto])
REFERENCES [dbo].[Producto] ([idProducto])
GO
ALTER TABLE [dbo].[Carrito_X_Producto] CHECK CONSTRAINT [FK_Carrito_X_Producto_Producto]
GO
ALTER TABLE [dbo].[CarritoCompra]  WITH CHECK ADD  CONSTRAINT [FK_CarritoCompra_Cliente] FOREIGN KEY([fk_idCliente])
REFERENCES [dbo].[Cliente] ([idCliente])
GO
ALTER TABLE [dbo].[CarritoCompra] CHECK CONSTRAINT [FK_CarritoCompra_Cliente]
GO
ALTER TABLE [dbo].[CarritoCompra]  WITH CHECK ADD  CONSTRAINT [FK_CarritoCompra_Sucursal] FOREIGN KEY([fk_idSucursal])
REFERENCES [dbo].[Sucursal] ([idSucursal])
GO
ALTER TABLE [dbo].[CarritoCompra] CHECK CONSTRAINT [FK_CarritoCompra_Sucursal]
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
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_CarritoCompra] FOREIGN KEY([fk_idCarritoCompra])
REFERENCES [dbo].[CarritoCompra] ([idCarritoCompra])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_Factura_CarritoCompra]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_TipoEntrega] FOREIGN KEY([fk_idTipoEntrega])
REFERENCES [dbo].[TipoEntrega] ([idTipoEntrega])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_Factura_TipoEntrega]
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
USE [master]
GO
ALTER DATABASE [proyectoBases] SET  READ_WRITE 
GO
