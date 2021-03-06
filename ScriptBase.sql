USE [master]
GO
/****** Object:  Database [LC-IF]    Script Date: 5/22/2022 8:52:13 PM ******/
CREATE DATABASE [LC-IF]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LC-IF', FILENAME = N'C:\Users\Jaime A&B\LC-IF.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LC-IF_log', FILENAME = N'C:\Users\Jaime A&B\LC-IF_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [LC-IF] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LC-IF].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LC-IF] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LC-IF] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LC-IF] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LC-IF] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LC-IF] SET ARITHABORT OFF 
GO
ALTER DATABASE [LC-IF] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LC-IF] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LC-IF] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LC-IF] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LC-IF] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LC-IF] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LC-IF] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LC-IF] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LC-IF] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LC-IF] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LC-IF] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LC-IF] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LC-IF] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LC-IF] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LC-IF] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LC-IF] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LC-IF] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LC-IF] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LC-IF] SET  MULTI_USER 
GO
ALTER DATABASE [LC-IF] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LC-IF] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LC-IF] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LC-IF] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LC-IF] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LC-IF] SET QUERY_STORE = OFF
GO
USE [LC-IF]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [LC-IF]
GO
/****** Object:  Table [dbo].[Bebidas]    Script Date: 5/22/2022 8:52:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bebidas](
	[Id_Bebidas] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Bebida] [varchar](50) NOT NULL,
	[Id_Proovedores(N/A)] [int] NULL,
	[Id_Tipo_de_Bebida] [int] NULL,
	[Cantidad] [int] NULL,
	[Stock] [int] NULL,
 CONSTRAINT [PK_Bebidas] PRIMARY KEY CLUSTERED 
(
	[Id_Bebidas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Catalogo]    Script Date: 5/22/2022 8:52:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catalogo](
	[Id_Catalogo] [int] IDENTITY(1,1) NOT NULL,
	[Producto_En_Venta] [varchar](50) NULL,
	[Precio] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Catalogo] PRIMARY KEY CLUSTERED 
(
	[Id_Catalogo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 5/22/2022 8:52:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[Id_Categorias] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Categoria] [varchar](50) NOT NULL,
	[Descripcion_Categoria] [varchar](150) NULL,
 CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED 
(
	[Id_Categorias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Compras]    Script Date: 5/22/2022 8:52:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Compras](
	[Id_Compras] [int] IDENTITY(1,1) NOT NULL,
	[Id_Proveedor] [int] NULL,
	[Descripcion_Compra] [varchar](150) NULL,
	[NumeroFact] [int] NULL,
	[Total] [decimal](18, 2) NULL,
	[CreditoFiscal(S/N)] [varchar](50) NULL,
	[Fecha_Compra] [date] NULL,
 CONSTRAINT [PK_Compras] PRIMARY KEY CLUSTERED 
(
	[Id_Compras] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleCompras]    Script Date: 5/22/2022 8:52:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleCompras](
	[Id_DetalleCompra] [int] IDENTITY(1,1) NOT NULL,
	[Id_Compras] [int] NULL,
	[Id_Productos] [int] NULL,
	[Precio_Unitario] [decimal](18, 2) NULL,
	[UnidadMedida] [decimal](18, 2) NULL,
	[Cantidad] [int] NULL,
	[SubTotal] [decimal](18, 2) NULL,
	[FechaCaducidad] [date] NULL,
	[Estado] [bit] NULL,
 CONSTRAINT [PK_DetalleCompras] PRIMARY KEY CLUSTERED 
(
	[Id_DetalleCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleReceta]    Script Date: 5/22/2022 8:52:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleReceta](
	[Id_DetalleReceta] [int] IDENTITY(1,1) NOT NULL,
	[Id_Receta] [int] NULL,
	[Id_Producto] [int] NULL,
	[Cantidad] [int] NULL,
	[Para_Cuantas_Porciones] [int] NULL,
 CONSTRAINT [PK_DetalleReceta] PRIMARY KEY CLUSTERED 
(
	[Id_DetalleReceta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Facturas]    Script Date: 5/22/2022 8:52:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Facturas](
	[Id_Fatura] [int] IDENTITY(1,1) NOT NULL,
	[Item1] [varchar](50) NULL,
	[Item2] [varchar](50) NULL,
	[Item3] [varchar](50) NULL,
	[Item4] [varchar](50) NULL,
	[Item5] [varchar](50) NULL,
	[Item6] [varchar](50) NULL,
	[Cancelar(Dinero)] [decimal](18, 2) NULL,
	[Total] [decimal](18, 2) NULL,
	[Vuelto] [decimal](18, 2) NULL,
	[FechaFactura] [date] NULL,
 CONSTRAINT [PK_Facturas] PRIMARY KEY CLUSTERED 
(
	[Id_Fatura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inter_Recetas]    Script Date: 5/22/2022 8:52:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inter_Recetas](
	[Id_Intermediaria] [int] IDENTITY(1,1) NOT NULL,
	[Id_Recetas] [int] NULL,
	[Cantidad] [int] NULL,
	[Cantidad_Porciones_Salientes] [int] NULL,
 CONSTRAINT [PK_Inter_Recetas] PRIMARY KEY CLUSTERED 
(
	[Id_Intermediaria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nuevo_Producto]    Script Date: 5/22/2022 8:52:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nuevo_Producto](
	[Id_NuevoProducto] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_New_Producto] [varchar](50) NULL,
	[Id_Categoria] [int] NULL,
	[Id_Proovedores] [int] NULL,
	[Unidad_de_Medida] [varchar](50) NULL,
	[Cantidad_Producto] [int] NULL,
	[CreditoFiscalY/N] [varchar](50) NULL,
	[Costo_por_Unidad_new] [decimal](18, 2) NULL,
	[Total_new] [decimal](18, 2) NULL,
	[Fecha_de_Vencimiento] [date] NULL,
	[Fecha_de_Compra] [date] NULL,
	[Tipo] [bit] NULL,
 CONSTRAINT [PK_Nuevo_Producto] PRIMARY KEY CLUSTERED 
(
	[Id_NuevoProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 5/22/2022 8:52:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[Id_Productos] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Productos] [varchar](150) NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Id_Categoria] [int] NULL,
	[Fecha_de_Caducidad] [date] NULL,
	[Stock(Habilitado)] [int] NULL,
	[Unidad_de_Medida] [varchar](50) NULL,
	[Id_Proveedores] [int] NULL,
	[Tipo] [bit] NULL,
	[Fecha_de_Ingreso] [date] NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[Id_Productos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos_Proovedores]    Script Date: 5/22/2022 8:52:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos_Proovedores](
	[Id_Productos_Proovedores] [int] IDENTITY(1,1) NOT NULL,
	[Id_Productos] [int] NULL,
	[Id_Proovedores] [int] NULL,
 CONSTRAINT [PK_Productos_Proovedores] PRIMARY KEY CLUSTERED 
(
	[Id_Productos_Proovedores] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proovedores]    Script Date: 5/22/2022 8:52:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proovedores](
	[Id_Proveedores] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Proovedor] [varchar](150) NOT NULL,
	[Telefono] [varchar](50) NULL,
	[Correo] [varchar](50) NULL,
	[Descripcion] [varchar](50) NULL,
	[Direccion] [varchar](50) NULL,
 CONSTRAINT [PK_Proovedores] PRIMARY KEY CLUSTERED 
(
	[Id_Proveedores] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Receta]    Script Date: 5/22/2022 8:52:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receta](
	[Id_Receta] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Receta] [varchar](150) NULL,
 CONSTRAINT [PK_Recetas] PRIMARY KEY CLUSTERED 
(
	[Id_Receta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Regalias]    Script Date: 5/22/2022 8:52:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Regalias](
	[Id_Regalias] [int] NOT NULL,
	[Nombre_Regalias] [varchar](50) NULL,
	[Cantidad] [int] NULL,
	[Descripcion_Regalias] [varchar](50) NULL,
	[Id_Compra] [int] NULL,
 CONSTRAINT [PK_Regalias] PRIMARY KEY CLUSTERED 
(
	[Id_Regalias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Regalias_Local]    Script Date: 5/22/2022 8:52:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Regalias_Local](
	[Id_Regalias_Local] [int] IDENTITY(1,1) NOT NULL,
	[Id_Producto] [int] NULL,
	[Cantidad_Regalias] [int] NULL,
	[Id_Compra] [int] NULL,
 CONSTRAINT [PK_Regalias_Local] PRIMARY KEY CLUSTERED 
(
	[Id_Regalias_Local] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 5/22/2022 8:52:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id_Roles] [int] IDENTITY(1,1) NOT NULL,
	[Tipo_Rol] [int] NULL,
	[Descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id_Roles] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tamaño_de_Porcion]    Script Date: 5/22/2022 8:52:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tamaño_de_Porcion](
	[Id_Tamaño_de_Porcion] [int] IDENTITY(1,1) NOT NULL,
	[Tamaño_de_Porcion] [int] NULL,
 CONSTRAINT [PK_Tamaño_de_Porcion] PRIMARY KEY CLUSTERED 
(
	[Id_Tamaño_de_Porcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo_de_Bedidas]    Script Date: 5/22/2022 8:52:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo_de_Bedidas](
	[Id_Tipo_de_Bebida] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
 CONSTRAINT [PK_Tipo_de_Bedidas] PRIMARY KEY CLUSTERED 
(
	[Id_Tipo_de_Bebida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 5/22/2022 8:52:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Id_Usuarios] [int] IDENTITY(1,1) NOT NULL,
	[Nombres_Usuario] [varchar](50) NULL,
	[Apellidos_Usuario] [varchar](50) NULL,
	[Usuario] [varchar](50) NULL,
	[Contraseña] [varchar](50) NULL,
	[Estado] [bit] NULL,
	[Id_Roles] [int] NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[Id_Usuarios] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ventas]    Script Date: 5/22/2022 8:52:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ventas](
	[Id_Ventas] [int] IDENTITY(1,1) NOT NULL,
	[Id_Catalogo] [int] NULL,
	[Id_Tamaño_de_Porcion] [int] NULL,
	[Utencilios(SI/NO)] [varchar](20) NULL,
	[Id_Bebidas] [int] NULL,
	[Cantidad_de_Bebidas] [int] NULL,
	[Vaso(Desechable)(N/A)] [varchar](20) NULL,
	[Total] [decimal](18, 0) NULL,
	[Cancelacion] [decimal](18, 0) NULL,
	[Vuelto] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Ventas] PRIMARY KEY CLUSTERED 
(
	[Id_Ventas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categorias] ON 

INSERT [dbo].[Categorias] ([Id_Categorias], [Nombre_Categoria], [Descripcion_Categoria]) VALUES (2004, N'Carnes', NULL)
INSERT [dbo].[Categorias] ([Id_Categorias], [Nombre_Categoria], [Descripcion_Categoria]) VALUES (2005, N'Bebidas', NULL)
INSERT [dbo].[Categorias] ([Id_Categorias], [Nombre_Categoria], [Descripcion_Categoria]) VALUES (2006, N'Golosinas', NULL)
INSERT [dbo].[Categorias] ([Id_Categorias], [Nombre_Categoria], [Descripcion_Categoria]) VALUES (2007, N'Verduras', NULL)
INSERT [dbo].[Categorias] ([Id_Categorias], [Nombre_Categoria], [Descripcion_Categoria]) VALUES (2008, N'Arinas y Huevos', NULL)
INSERT [dbo].[Categorias] ([Id_Categorias], [Nombre_Categoria], [Descripcion_Categoria]) VALUES (3004, N'Extras', NULL)
INSERT [dbo].[Categorias] ([Id_Categorias], [Nombre_Categoria], [Descripcion_Categoria]) VALUES (3005, N'Pan', NULL)
INSERT [dbo].[Categorias] ([Id_Categorias], [Nombre_Categoria], [Descripcion_Categoria]) VALUES (3006, N'Condimentos', NULL)
INSERT [dbo].[Categorias] ([Id_Categorias], [Nombre_Categoria], [Descripcion_Categoria]) VALUES (3007, N'Salsas', NULL)
INSERT [dbo].[Categorias] ([Id_Categorias], [Nombre_Categoria], [Descripcion_Categoria]) VALUES (3008, N'Desechables', NULL)
INSERT [dbo].[Categorias] ([Id_Categorias], [Nombre_Categoria], [Descripcion_Categoria]) VALUES (3009, N'Sales y Azucar', NULL)
INSERT [dbo].[Categorias] ([Id_Categorias], [Nombre_Categoria], [Descripcion_Categoria]) VALUES (3010, N'Limpieza', NULL)
INSERT [dbo].[Categorias] ([Id_Categorias], [Nombre_Categoria], [Descripcion_Categoria]) VALUES (3011, N'Granos', NULL)
INSERT [dbo].[Categorias] ([Id_Categorias], [Nombre_Categoria], [Descripcion_Categoria]) VALUES (3012, N'Cafe y Chocolate', NULL)
INSERT [dbo].[Categorias] ([Id_Categorias], [Nombre_Categoria], [Descripcion_Categoria]) VALUES (3013, N'Lacteos', NULL)
INSERT [dbo].[Categorias] ([Id_Categorias], [Nombre_Categoria], [Descripcion_Categoria]) VALUES (3014, N'Frescos', NULL)
INSERT [dbo].[Categorias] ([Id_Categorias], [Nombre_Categoria], [Descripcion_Categoria]) VALUES (3015, N'Condimentos', NULL)
INSERT [dbo].[Categorias] ([Id_Categorias], [Nombre_Categoria], [Descripcion_Categoria]) VALUES (3016, N'Pastas', NULL)
INSERT [dbo].[Categorias] ([Id_Categorias], [Nombre_Categoria], [Descripcion_Categoria]) VALUES (3017, N'Cremas', NULL)
INSERT [dbo].[Categorias] ([Id_Categorias], [Nombre_Categoria], [Descripcion_Categoria]) VALUES (3018, N'Enlatados', NULL)
INSERT [dbo].[Categorias] ([Id_Categorias], [Nombre_Categoria], [Descripcion_Categoria]) VALUES (3019, N'Galletas', NULL)
INSERT [dbo].[Categorias] ([Id_Categorias], [Nombre_Categoria], [Descripcion_Categoria]) VALUES (3020, N'Dulces', NULL)
INSERT [dbo].[Categorias] ([Id_Categorias], [Nombre_Categoria], [Descripcion_Categoria]) VALUES (3021, N'Cereales', NULL)
INSERT [dbo].[Categorias] ([Id_Categorias], [Nombre_Categoria], [Descripcion_Categoria]) VALUES (3022, N'Frutas', NULL)
INSERT [dbo].[Categorias] ([Id_Categorias], [Nombre_Categoria], [Descripcion_Categoria]) VALUES (3023, N'Vinagres', NULL)
INSERT [dbo].[Categorias] ([Id_Categorias], [Nombre_Categoria], [Descripcion_Categoria]) VALUES (3024, N'Aceites', NULL)
INSERT [dbo].[Categorias] ([Id_Categorias], [Nombre_Categoria], [Descripcion_Categoria]) VALUES (3025, N'Otros', NULL)
SET IDENTITY_INSERT [dbo].[Categorias] OFF
GO
SET IDENTITY_INSERT [dbo].[Compras] ON 

INSERT [dbo].[Compras] ([Id_Compras], [Id_Proveedor], [Descripcion_Compra], [NumeroFact], [Total], [CreditoFiscal(S/N)], [Fecha_Compra]) VALUES (6007, 1004, N'PETIT DURAZNO - LATA', 123, CAST(6.00 AS Decimal(18, 2)), N'Consumidor', CAST(N'2019-03-30' AS Date))
INSERT [dbo].[Compras] ([Id_Compras], [Id_Proveedor], [Descripcion_Compra], [NumeroFact], [Total], [CreditoFiscal(S/N)], [Fecha_Compra]) VALUES (6008, 1004, N'PETIT DURAZNO - LATA', 12, CAST(5.00 AS Decimal(18, 2)), N'Consumidor', CAST(N'2019-03-13' AS Date))
INSERT [dbo].[Compras] ([Id_Compras], [Id_Proveedor], [Descripcion_Compra], [NumeroFact], [Total], [CreditoFiscal(S/N)], [Fecha_Compra]) VALUES (6009, 1005, N'SALUTARIS LIMON - LATA', 123, CAST(6.00 AS Decimal(18, 2)), N'Consumidor', CAST(N'2019-03-30' AS Date))
INSERT [dbo].[Compras] ([Id_Compras], [Id_Proveedor], [Descripcion_Compra], [NumeroFact], [Total], [CreditoFiscal(S/N)], [Fecha_Compra]) VALUES (7007, 1004, N'PETIT DURAZNO - LATA', 425, CAST(40.00 AS Decimal(18, 2)), N'Consumidor', CAST(N'2019-03-31' AS Date))
INSERT [dbo].[Compras] ([Id_Compras], [Id_Proveedor], [Descripcion_Compra], [NumeroFact], [Total], [CreditoFiscal(S/N)], [Fecha_Compra]) VALUES (7008, 1004, N'DEL VALLE NARANJA - BOTELLA', 231, CAST(12.00 AS Decimal(18, 2)), N'Ticket', CAST(N'2019-03-31' AS Date))
INSERT [dbo].[Compras] ([Id_Compras], [Id_Proveedor], [Descripcion_Compra], [NumeroFact], [Total], [CreditoFiscal(S/N)], [Fecha_Compra]) VALUES (8007, 1005, NULL, 341, NULL, N'Ticket', CAST(N'2019-03-31' AS Date))
INSERT [dbo].[Compras] ([Id_Compras], [Id_Proveedor], [Descripcion_Compra], [NumeroFact], [Total], [CreditoFiscal(S/N)], [Fecha_Compra]) VALUES (8008, 1004, NULL, 234, NULL, N'Credito', CAST(N'2019-03-31' AS Date))
INSERT [dbo].[Compras] ([Id_Compras], [Id_Proveedor], [Descripcion_Compra], [NumeroFact], [Total], [CreditoFiscal(S/N)], [Fecha_Compra]) VALUES (8009, 1004, NULL, 123, NULL, N'Consumidor', CAST(N'2019-03-31' AS Date))
INSERT [dbo].[Compras] ([Id_Compras], [Id_Proveedor], [Descripcion_Compra], [NumeroFact], [Total], [CreditoFiscal(S/N)], [Fecha_Compra]) VALUES (8010, 1004, NULL, 1213, NULL, N'Consumidor', CAST(N'2019-03-31' AS Date))
INSERT [dbo].[Compras] ([Id_Compras], [Id_Proveedor], [Descripcion_Compra], [NumeroFact], [Total], [CreditoFiscal(S/N)], [Fecha_Compra]) VALUES (8011, 1005, NULL, 324, NULL, N'Credito', CAST(N'2019-03-31' AS Date))
INSERT [dbo].[Compras] ([Id_Compras], [Id_Proveedor], [Descripcion_Compra], [NumeroFact], [Total], [CreditoFiscal(S/N)], [Fecha_Compra]) VALUES (8012, 1005, NULL, 123, NULL, N'Ticket', CAST(N'2019-03-06' AS Date))
INSERT [dbo].[Compras] ([Id_Compras], [Id_Proveedor], [Descripcion_Compra], [NumeroFact], [Total], [CreditoFiscal(S/N)], [Fecha_Compra]) VALUES (8013, 1004, NULL, 3, NULL, N'Ticket', CAST(N'2019-03-13' AS Date))
INSERT [dbo].[Compras] ([Id_Compras], [Id_Proveedor], [Descripcion_Compra], [NumeroFact], [Total], [CreditoFiscal(S/N)], [Fecha_Compra]) VALUES (8014, 1005, NULL, 231, NULL, N'Ticket', CAST(N'2019-03-31' AS Date))
INSERT [dbo].[Compras] ([Id_Compras], [Id_Proveedor], [Descripcion_Compra], [NumeroFact], [Total], [CreditoFiscal(S/N)], [Fecha_Compra]) VALUES (9007, 1008, NULL, 123, NULL, N'', CAST(N'2019-03-31' AS Date))
INSERT [dbo].[Compras] ([Id_Compras], [Id_Proveedor], [Descripcion_Compra], [NumeroFact], [Total], [CreditoFiscal(S/N)], [Fecha_Compra]) VALUES (10007, 1006, NULL, 453, NULL, N'Consumidor', CAST(N'2019-03-31' AS Date))
INSERT [dbo].[Compras] ([Id_Compras], [Id_Proveedor], [Descripcion_Compra], [NumeroFact], [Total], [CreditoFiscal(S/N)], [Fecha_Compra]) VALUES (10008, 1007, NULL, 876, NULL, N'Ticket', CAST(N'2019-03-31' AS Date))
SET IDENTITY_INSERT [dbo].[Compras] OFF
GO
SET IDENTITY_INSERT [dbo].[DetalleCompras] ON 

INSERT [dbo].[DetalleCompras] ([Id_DetalleCompra], [Id_Compras], [Id_Productos], [Precio_Unitario], [UnidadMedida], [Cantidad], [SubTotal], [FechaCaducidad], [Estado]) VALUES (2002, 6007, 8012, CAST(2.00 AS Decimal(18, 2)), NULL, 3, CAST(6.00 AS Decimal(18, 2)), NULL, 0)
INSERT [dbo].[DetalleCompras] ([Id_DetalleCompra], [Id_Compras], [Id_Productos], [Precio_Unitario], [UnidadMedida], [Cantidad], [SubTotal], [FechaCaducidad], [Estado]) VALUES (2003, 6008, 8012, CAST(1.00 AS Decimal(18, 2)), NULL, 5, CAST(5.00 AS Decimal(18, 2)), NULL, 0)
INSERT [dbo].[DetalleCompras] ([Id_DetalleCompra], [Id_Compras], [Id_Productos], [Precio_Unitario], [UnidadMedida], [Cantidad], [SubTotal], [FechaCaducidad], [Estado]) VALUES (2004, 6009, 8025, CAST(2.00 AS Decimal(18, 2)), NULL, 3, CAST(6.00 AS Decimal(18, 2)), NULL, 0)
INSERT [dbo].[DetalleCompras] ([Id_DetalleCompra], [Id_Compras], [Id_Productos], [Precio_Unitario], [UnidadMedida], [Cantidad], [SubTotal], [FechaCaducidad], [Estado]) VALUES (3002, 7007, 8012, CAST(8.00 AS Decimal(18, 2)), NULL, 5, CAST(40.00 AS Decimal(18, 2)), NULL, 0)
INSERT [dbo].[DetalleCompras] ([Id_DetalleCompra], [Id_Compras], [Id_Productos], [Precio_Unitario], [UnidadMedida], [Cantidad], [SubTotal], [FechaCaducidad], [Estado]) VALUES (3003, 7008, 8012, CAST(5.00 AS Decimal(18, 2)), NULL, 4, CAST(20.00 AS Decimal(18, 2)), NULL, 0)
INSERT [dbo].[DetalleCompras] ([Id_DetalleCompra], [Id_Compras], [Id_Productos], [Precio_Unitario], [UnidadMedida], [Cantidad], [SubTotal], [FechaCaducidad], [Estado]) VALUES (3004, 7008, 8037, CAST(4.00 AS Decimal(18, 2)), NULL, 3, CAST(12.00 AS Decimal(18, 2)), NULL, 0)
INSERT [dbo].[DetalleCompras] ([Id_DetalleCompra], [Id_Compras], [Id_Productos], [Precio_Unitario], [UnidadMedida], [Cantidad], [SubTotal], [FechaCaducidad], [Estado]) VALUES (4002, 8007, 8011, CAST(4.00 AS Decimal(18, 2)), NULL, 3, CAST(12.00 AS Decimal(18, 2)), NULL, 0)
INSERT [dbo].[DetalleCompras] ([Id_DetalleCompra], [Id_Compras], [Id_Productos], [Precio_Unitario], [UnidadMedida], [Cantidad], [SubTotal], [FechaCaducidad], [Estado]) VALUES (4003, 8008, 8027, CAST(3.00 AS Decimal(18, 2)), NULL, 32, CAST(96.00 AS Decimal(18, 2)), NULL, 0)
INSERT [dbo].[DetalleCompras] ([Id_DetalleCompra], [Id_Compras], [Id_Productos], [Precio_Unitario], [UnidadMedida], [Cantidad], [SubTotal], [FechaCaducidad], [Estado]) VALUES (4004, 8009, 8026, CAST(3.00 AS Decimal(18, 2)), NULL, 2, CAST(6.00 AS Decimal(18, 2)), NULL, 0)
INSERT [dbo].[DetalleCompras] ([Id_DetalleCompra], [Id_Compras], [Id_Productos], [Precio_Unitario], [UnidadMedida], [Cantidad], [SubTotal], [FechaCaducidad], [Estado]) VALUES (4005, 8010, 8028, CAST(2.00 AS Decimal(18, 2)), NULL, 3, CAST(6.00 AS Decimal(18, 2)), NULL, 0)
INSERT [dbo].[DetalleCompras] ([Id_DetalleCompra], [Id_Compras], [Id_Productos], [Precio_Unitario], [UnidadMedida], [Cantidad], [SubTotal], [FechaCaducidad], [Estado]) VALUES (4006, 8010, 8045, CAST(4.00 AS Decimal(18, 2)), NULL, 3, CAST(12.00 AS Decimal(18, 2)), NULL, 0)
INSERT [dbo].[DetalleCompras] ([Id_DetalleCompra], [Id_Compras], [Id_Productos], [Precio_Unitario], [UnidadMedida], [Cantidad], [SubTotal], [FechaCaducidad], [Estado]) VALUES (4007, 8011, 8012, CAST(4.00 AS Decimal(18, 2)), NULL, 3, CAST(12.00 AS Decimal(18, 2)), NULL, 0)
INSERT [dbo].[DetalleCompras] ([Id_DetalleCompra], [Id_Compras], [Id_Productos], [Precio_Unitario], [UnidadMedida], [Cantidad], [SubTotal], [FechaCaducidad], [Estado]) VALUES (4008, 8011, 8024, CAST(4.00 AS Decimal(18, 2)), NULL, 2, CAST(8.00 AS Decimal(18, 2)), NULL, 0)
INSERT [dbo].[DetalleCompras] ([Id_DetalleCompra], [Id_Compras], [Id_Productos], [Precio_Unitario], [UnidadMedida], [Cantidad], [SubTotal], [FechaCaducidad], [Estado]) VALUES (4009, 8012, 8012, CAST(3.00 AS Decimal(18, 2)), NULL, 2, CAST(6.00 AS Decimal(18, 2)), NULL, 0)
INSERT [dbo].[DetalleCompras] ([Id_DetalleCompra], [Id_Compras], [Id_Productos], [Precio_Unitario], [UnidadMedida], [Cantidad], [SubTotal], [FechaCaducidad], [Estado]) VALUES (4010, 8012, 8024, CAST(3.00 AS Decimal(18, 2)), NULL, 2, CAST(6.00 AS Decimal(18, 2)), NULL, 0)
INSERT [dbo].[DetalleCompras] ([Id_DetalleCompra], [Id_Compras], [Id_Productos], [Precio_Unitario], [UnidadMedida], [Cantidad], [SubTotal], [FechaCaducidad], [Estado]) VALUES (4011, 8013, 8012, CAST(4.00 AS Decimal(18, 2)), NULL, 3, CAST(12.00 AS Decimal(18, 2)), NULL, 0)
INSERT [dbo].[DetalleCompras] ([Id_DetalleCompra], [Id_Compras], [Id_Productos], [Precio_Unitario], [UnidadMedida], [Cantidad], [SubTotal], [FechaCaducidad], [Estado]) VALUES (4012, 8013, 8011, CAST(2.00 AS Decimal(18, 2)), NULL, 3, CAST(6.00 AS Decimal(18, 2)), NULL, 0)
INSERT [dbo].[DetalleCompras] ([Id_DetalleCompra], [Id_Compras], [Id_Productos], [Precio_Unitario], [UnidadMedida], [Cantidad], [SubTotal], [FechaCaducidad], [Estado]) VALUES (4013, 8013, 8012, CAST(3.00 AS Decimal(18, 2)), NULL, 4, CAST(12.00 AS Decimal(18, 2)), NULL, 0)
INSERT [dbo].[DetalleCompras] ([Id_DetalleCompra], [Id_Compras], [Id_Productos], [Precio_Unitario], [UnidadMedida], [Cantidad], [SubTotal], [FechaCaducidad], [Estado]) VALUES (4014, 8013, 8032, CAST(2.00 AS Decimal(18, 2)), NULL, 3, CAST(6.00 AS Decimal(18, 2)), NULL, 0)
INSERT [dbo].[DetalleCompras] ([Id_DetalleCompra], [Id_Compras], [Id_Productos], [Precio_Unitario], [UnidadMedida], [Cantidad], [SubTotal], [FechaCaducidad], [Estado]) VALUES (4015, 8014, 8025, CAST(4.00 AS Decimal(18, 2)), NULL, 3, CAST(12.00 AS Decimal(18, 2)), NULL, 0)
INSERT [dbo].[DetalleCompras] ([Id_DetalleCompra], [Id_Compras], [Id_Productos], [Precio_Unitario], [UnidadMedida], [Cantidad], [SubTotal], [FechaCaducidad], [Estado]) VALUES (4016, 8014, 8028, CAST(4.00 AS Decimal(18, 2)), NULL, 3, CAST(12.00 AS Decimal(18, 2)), NULL, 0)
INSERT [dbo].[DetalleCompras] ([Id_DetalleCompra], [Id_Compras], [Id_Productos], [Precio_Unitario], [UnidadMedida], [Cantidad], [SubTotal], [FechaCaducidad], [Estado]) VALUES (4017, 8014, 8027, CAST(4.00 AS Decimal(18, 2)), NULL, 3, CAST(12.00 AS Decimal(18, 2)), NULL, 0)
INSERT [dbo].[DetalleCompras] ([Id_DetalleCompra], [Id_Compras], [Id_Productos], [Precio_Unitario], [UnidadMedida], [Cantidad], [SubTotal], [FechaCaducidad], [Estado]) VALUES (5002, 9007, 8024, CAST(3.00 AS Decimal(18, 2)), NULL, 2, CAST(6.00 AS Decimal(18, 2)), NULL, 0)
INSERT [dbo].[DetalleCompras] ([Id_DetalleCompra], [Id_Compras], [Id_Productos], [Precio_Unitario], [UnidadMedida], [Cantidad], [SubTotal], [FechaCaducidad], [Estado]) VALUES (5003, 9007, 8025, CAST(2.00 AS Decimal(18, 2)), NULL, 3, CAST(6.00 AS Decimal(18, 2)), NULL, 0)
INSERT [dbo].[DetalleCompras] ([Id_DetalleCompra], [Id_Compras], [Id_Productos], [Precio_Unitario], [UnidadMedida], [Cantidad], [SubTotal], [FechaCaducidad], [Estado]) VALUES (5004, 9007, 8070, CAST(12.00 AS Decimal(18, 2)), NULL, 34, CAST(408.00 AS Decimal(18, 2)), NULL, 0)
INSERT [dbo].[DetalleCompras] ([Id_DetalleCompra], [Id_Compras], [Id_Productos], [Precio_Unitario], [UnidadMedida], [Cantidad], [SubTotal], [FechaCaducidad], [Estado]) VALUES (6002, 10007, 8024, CAST(4.00 AS Decimal(18, 2)), NULL, 2, CAST(8.00 AS Decimal(18, 2)), NULL, 0)
INSERT [dbo].[DetalleCompras] ([Id_DetalleCompra], [Id_Compras], [Id_Productos], [Precio_Unitario], [UnidadMedida], [Cantidad], [SubTotal], [FechaCaducidad], [Estado]) VALUES (6003, 10007, 8029, CAST(4.00 AS Decimal(18, 2)), NULL, 3, CAST(12.00 AS Decimal(18, 2)), NULL, 0)
INSERT [dbo].[DetalleCompras] ([Id_DetalleCompra], [Id_Compras], [Id_Productos], [Precio_Unitario], [UnidadMedida], [Cantidad], [SubTotal], [FechaCaducidad], [Estado]) VALUES (6004, 10008, 8012, CAST(12.00 AS Decimal(18, 2)), NULL, 6, CAST(72.00 AS Decimal(18, 2)), NULL, 1)
INSERT [dbo].[DetalleCompras] ([Id_DetalleCompra], [Id_Compras], [Id_Productos], [Precio_Unitario], [UnidadMedida], [Cantidad], [SubTotal], [FechaCaducidad], [Estado]) VALUES (6005, 10008, 8027, CAST(6.00 AS Decimal(18, 2)), NULL, 5, CAST(30.00 AS Decimal(18, 2)), NULL, 1)
SET IDENTITY_INSERT [dbo].[DetalleCompras] OFF
GO
SET IDENTITY_INSERT [dbo].[Inter_Recetas] ON 

INSERT [dbo].[Inter_Recetas] ([Id_Intermediaria], [Id_Recetas], [Cantidad], [Cantidad_Porciones_Salientes]) VALUES (5, 3, 10, 50)
SET IDENTITY_INSERT [dbo].[Inter_Recetas] OFF
GO
SET IDENTITY_INSERT [dbo].[Productos] ON 

INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (7011, N'Petit Manzana - LATA', 0, 2005, CAST(N'2030-02-20' AS Date), 5, N'UND', 1004, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8011, N'PETIT PIÑA - LATA', 0, 2005, CAST(N'2030-02-20' AS Date), 0, N'UND', 1004, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8012, N'PETIT DURAZNO - LATA', 0, 2005, CAST(N'2030-02-20' AS Date), 17, N'UND', 1004, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8023, N'PETIT DURAZNO - LATA', 0, 2005, CAST(N'2030-02-20' AS Date), 0, N'UND', 1004, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8024, N'SALUTARIS NARANJA - LATA', 0, 2005, CAST(N'2030-02-20' AS Date), 0, N'UND', 1004, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8025, N'SALUTARIS LIMON - LATA', 0, 2005, CAST(N'2030-02-20' AS Date), 3, N'UND', 1004, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8026, N'SALUTARIS AGUA MINERAL - LATA''', 0, 2005, CAST(N'2030-02-20' AS Date), 0, N'UND', 1004, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8027, N'LIPTON LIMON - LATA', 0, 2005, CAST(N'2030-02-20' AS Date), 0, N'UND', 1004, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8028, N'LIPTON DURAZNO - LATA', 0, 2005, CAST(N'2030-02-20' AS Date), 0, N'UND', 1004, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8029, N'LIPTON FRANBUESA - BOTELLA''', 0, 2005, CAST(N'2030-02-20' AS Date), 0, N'UND', 1004, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8030, N'GAYTORADE - BOTELLA', 0, 2005, CAST(N'2030-02-20' AS Date), 0, N'UND', 1004, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8031, N'AMP - BOTELLA', 0, 2005, CAST(N'2030-02-20' AS Date), 0, N'UND', 1004, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8032, N'COCA - LATA', 0, 2005, CAST(N'2030-02-20' AS Date), 0, N'UND', 1005, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8033, N'DEL VALLE MANDARINA - BOTELLA', 0, 2005, CAST(N'2030-02-20' AS Date), 0, N'UND', 1005, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8034, N'DEL VALLE LIMON - BOTELLA', 0, 2005, CAST(N'2030-02-20' AS Date), 0, N'UND', 1005, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8035, N'DEL VALLE PONCHE - BOTELLA', 0, 2005, CAST(N'2030-02-20' AS Date), 0, N'UND', 1005, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8036, N'DEL VALLE MARACUYA - BOTELLA', 0, 2005, CAST(N'2030-02-20' AS Date), 0, N'UND', 1005, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8037, N'DEL VALLE NARANJA - BOTELLA', 0, 2005, CAST(N'2030-02-20' AS Date), 3, N'UND', 1005, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8038, N'FRESCA - LATA', 0, 2005, CAST(N'2030-02-20' AS Date), 0, N'UND', 1005, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8039, N'CREMASODA - LATA', 0, 2005, CAST(N'2030-02-20' AS Date), 0, N'UND', 1005, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8040, N'SPRITE - LATA', 0, 2005, CAST(N'2030-02-20' AS Date), 0, N'UND', 1005, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8041, N'UVA - LATA', 0, 2005, CAST(N'2030-02-20' AS Date), 0, N'UND', 1005, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8042, N'FANTA - LATA', 0, 2005, CAST(N'2030-02-20' AS Date), 0, N'UND', 1005, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8043, N'POWER AZUL - BOTELLA', 0, 2005, CAST(N'2030-02-20' AS Date), 0, N'UND', 1005, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8044, N'POWER ROJO - BOTELLA', 0, 2005, CAST(N'2030-02-20' AS Date), 0, N'UND', 1005, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8045, N'YOGURT - BOTELLA PEQUEÑA', 0, 2005, CAST(N'2030-02-20' AS Date), 0, N'UND', 1006, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8046, N'CHOCOLATINA - BOTELLA', 0, 2005, CAST(N'2030-02-20' AS Date), 0, N'UND', 1006, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8047, N'LECHE', 0, 2005, CAST(N'2030-02-20' AS Date), 0, N'UND', 1006, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8048, N'AGUA BOTELLA', 0, 2005, CAST(N'2030-02-20' AS Date), 0, N'UND', 1007, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8049, N'HAMBURGESA', 0, 2004, CAST(N'2030-02-20' AS Date), 0, N'UND', 1008, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8050, N'RECORTE DE PECHUGA', 0, 2004, CAST(N'2030-02-20' AS Date), 0, N'LB', 1009, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8051, N'PECHUGA CON HUESO', 0, 2004, CAST(N'2030-02-20' AS Date), 0, N'LB', 1009, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8052, N'MUSLO PIERNA', 0, 2004, CAST(N'2030-02-20' AS Date), 0, N'LB', 1009, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8053, N'TORTA PARA HAMBURGESA DE POLLO', 0, 2004, CAST(N'2030-02-20' AS Date), 0, N'UND', 1009, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8054, N'ALITAS EMPANIZADAS', 0, 2004, CAST(N'2030-02-20' AS Date), 0, N'UND', 1009, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8055, N'PAPAS FRITAS', 0, 3004, CAST(N'2030-02-20' AS Date), 0, N'LB', 1009, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8056, N'PAN DE HAMBURGESA', 0, 3005, CAST(N'2030-02-20' AS Date), 0, N'UND', 1010, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8057, N'PAN DE HOT DOG', 0, 3005, CAST(N'2030-02-20' AS Date), 0, N'UND', 1010, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8058, N'PAN DE BARRA', 0, 3005, CAST(N'2030-02-20' AS Date), 0, N'UND', 1010, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8059, N'CARNE - CHOCOSUELA', 0, 2004, CAST(N'2030-02-20' AS Date), 0, N'LB', 1011, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8060, N'PAPRIKA', 0, 3006, CAST(N'2030-02-20' AS Date), 0, N'UND', 1011, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8061, N'JAMON FAMILIAR', 0, 2004, CAST(N'2030-02-20' AS Date), 0, N'LB', 1011, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8062, N'CHILE CHIPOTLE', 0, 3004, CAST(N'2030-02-20' AS Date), 0, N'LB', 1011, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8063, N'MAYONESA', 0, 3007, CAST(N'2030-02-20' AS Date), 0, N'UND', 1012, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8064, N'KETCHUP', 0, 3007, CAST(N'2030-02-20' AS Date), 0, N'UND', 1012, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8065, N'SALSA NEGRITA', 0, 3007, CAST(N'2030-02-20' AS Date), 0, N'UND', 1012, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8066, N'CHILE DON JULIO', 0, 3007, CAST(N'2030-02-20' AS Date), 0, N'UND', 1012, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8067, N'SALSA VERDE DON JULIO', 0, 3007, CAST(N'2030-02-20' AS Date), 0, N'UND', 1012, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8068, N'PLATO NUMERO 9', 0, 3008, CAST(N'2030-02-20' AS Date), 0, N'UND', 1012, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8069, N'BANDEJA 2P', 0, 3008, CAST(N'2030-02-20' AS Date), 0, N'UND', 1012, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8070, N'VASO NUMERO 12', 0, 3008, CAST(N'2030-02-20' AS Date), 0, N'UND', 1012, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8071, N'PLATO PASTELERO', 0, 3008, CAST(N'2030-02-20' AS Date), 0, N'UND', 1012, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8072, N'PLATO PARA PAPAS', 0, 3008, CAST(N'2030-02-20' AS Date), 0, N'UND', 1012, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8073, N'TENEDORES', 0, 3008, CAST(N'2030-02-20' AS Date), 0, N'UND', 1012, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8074, N'CUCHARAS', 0, 3008, CAST(N'2030-02-20' AS Date), 0, N'UND', 1012, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8075, N'CUCHILLOS', 0, 3008, CAST(N'2030-02-20' AS Date), 0, N'UND', 1012, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8076, N'REMOVEDORES', 0, 3008, CAST(N'2030-02-20' AS Date), 0, N'UND', 1012, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8077, N'POLIPEL', 0, 3008, CAST(N'2030-02-20' AS Date), 0, N'UND', 1012, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8078, N'VASO DE CRISTAL 16 ONZAS', 0, 3008, CAST(N'2030-02-20' AS Date), 0, N'UND', 1012, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8079, N'PAPEL ALUMINIO', 0, 3008, CAST(N'2030-02-20' AS Date), 0, N'UND', 1012, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8080, N'AZUCAR', 0, 3009, CAST(N'2030-02-20' AS Date), 0, N'LB', 1012, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8081, N'RINZO', 0, 3010, CAST(N'2030-02-20' AS Date), 0, N'UND', 1012, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8082, N'DETERGENTE', 0, 3010, CAST(N'2030-02-20' AS Date), 0, N'UND', 1012, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8083, N'MASCONES', 0, 3010, CAST(N'2030-02-20' AS Date), 0, N'UND', 1012, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8084, N'PALILLOS', 0, 3008, CAST(N'2030-02-20' AS Date), 0, N'UND', 1012, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8085, N'BOLSA DE BASURA JARDINERA', 0, 3008, CAST(N'2030-02-20' AS Date), 0, N'UND', 1012, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8086, N'BOLSA DE UNA LIBRA', 0, 3008, CAST(N'2030-02-20' AS Date), 0, N'UND', 1012, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8087, N'BOLSA DE 2 LIBRAS', 0, 3008, CAST(N'2030-02-20' AS Date), 0, N'UND', 1012, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8088, N'BOLSA DE 5 LIBRAS', 0, 3008, CAST(N'2030-02-20' AS Date), 0, N'UND', 1012, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8089, N'BOLSA DE 10 LIBRAS', 0, 3008, CAST(N'2030-02-20' AS Date), 0, N'UND', 1012, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8090, N'SOBRES DE AZUCAR', 0, 3004, CAST(N'2030-02-20' AS Date), 0, N'UND', 1012, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8091, N'SAL FINA', 0, 3009, CAST(N'2030-02-20' AS Date), 0, N'LB', 1012, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8092, N'SAL GRUESA', 0, 3009, CAST(N'2030-02-20' AS Date), 0, N'LB', 1012, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8093, N'JABON PARA TRASTE', 0, 3010, CAST(N'2030-02-20' AS Date), 0, N'UND', 1012, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8094, N'FRIJOLES', 0, 3011, CAST(N'2030-02-20' AS Date), 0, N'LB', 1012, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8095, N'SALSA RANCHERA', 0, 3007, CAST(N'2030-02-20' AS Date), 0, N'UND', 1012, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8096, N'ARROZ', 0, 3011, CAST(N'2030-02-20' AS Date), 0, N'LB', 1012, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8097, N'CAFÉ DISPENSADOR', 0, 3012, CAST(N'2030-02-20' AS Date), 0, N'UND', 1012, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8098, N'PASTA DE TOMATE', 0, 3016, CAST(N'2030-02-20' AS Date), 0, N'UND', 1012, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8099, N'BOLSA DE GABACHA NUMERO 1', 0, 3008, CAST(N'2030-02-20' AS Date), 0, N'UND', 1012, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8100, N'QUESO DURO BLANDO', 0, 3013, CAST(N'2030-02-20' AS Date), 0, N'LB', 1012, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8101, N'CREMA', 0, 3013, CAST(N'2030-02-20' AS Date), 0, N'LB', 1012, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8102, N'MARGARINA', 0, 3013, CAST(N'2030-02-20' AS Date), 0, N'UND', 1012, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8103, N'CREMORA', 0, 3012, CAST(N'2030-02-20' AS Date), 0, N'UND', 1012, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8104, N'HORCHATA', 0, 3014, CAST(N'2030-02-20' AS Date), 0, N'UND', 1012, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8105, N'SEBADA', 0, 3014, CAST(N'2030-02-20' AS Date), 0, N'UND', 1012, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8106, N'MASCON DE ALAMBRE', 0, 3010, CAST(N'2030-02-20' AS Date), 0, N'UND', 1012, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8107, N'CHOCOLATE TABILLA', 0, 3012, CAST(N'2030-02-20' AS Date), 0, N'UND', 1012, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8108, N'CONSOME DE POLLO', 0, 3015, CAST(N'2030-02-20' AS Date), 0, N'UND', 1012, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8109, N'CONSOME DE RES', 0, 3015, CAST(N'2030-02-20' AS Date), 0, N'UND', 1012, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8110, N'CHAOMING', 0, 3016, CAST(N'2030-02-20' AS Date), 0, N'UND', 1012, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8111, N'CREMA DE HONGOS', 0, 3017, CAST(N'2030-02-20' AS Date), 0, N'UND', 1012, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8112, N'SOBRES DE SAL', 0, 3004, CAST(N'2030-02-20' AS Date), 0, N'UND', 1012, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8113, N'FORSFOROS', 0, 3004, CAST(N'2030-02-20' AS Date), 0, N'UND', 1012, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8114, N'SALSA BARBACOA', 0, 3007, CAST(N'2030-02-20' AS Date), 0, N'UND', 1012, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8115, N'CHOCOLATE NESSTLE', 0, 3012, CAST(N'2030-02-20' AS Date), 0, N'UND', 1012, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8116, N'LASAÑA', 0, 3016, CAST(N'2030-02-20' AS Date), 0, N'UND', 1013, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8117, N'ESPAGUETI', 0, 3016, CAST(N'2030-02-20' AS Date), 0, N'UND', 1013, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8118, N'SALSA DE SOYA', 0, 3007, CAST(N'2030-02-20' AS Date), 0, N'UND', 1013, 0, CAST(N'2019-03-27' AS Date))
GO
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8119, N'SALSA INGLESA', 0, 3007, CAST(N'2030-02-20' AS Date), 0, N'UND', 1013, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8120, N'GUANTES DESECHABLES', 0, 3008, CAST(N'2030-02-20' AS Date), 0, N'UND', 1013, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8121, N'TE DE LIMON', 0, 3014, CAST(N'2030-02-20' AS Date), 0, N'UND', 1013, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8122, N'PONCHES DE FRUTAS', 0, 3014, CAST(N'2030-02-20' AS Date), 0, N'UND', 1013, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8123, N'QUESO CHEDAR', 0, 3013, CAST(N'2030-02-20' AS Date), 0, N'UND', 1013, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8124, N'EMPANIZADO', 0, 3015, CAST(N'2030-02-20' AS Date), 0, N'UND', 1013, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8125, N'ELOTITOS LATA GRANDE', 0, 3018, CAST(N'2030-02-20' AS Date), 0, N'UND', 1013, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8126, N'ALCOHOL GEL', 0, 3010, CAST(N'2030-02-20' AS Date), 0, N'UND', 1013, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8127, N'TIRAS ACIDAS', 0, 3020, CAST(N'2030-02-20' AS Date), 0, N'UND', 1013, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8128, N'JOLIE RANCHER', 0, 3020, CAST(N'2030-02-20' AS Date), 0, N'UND', 1013, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8129, N'CHOCOKRISPIES', 0, 3021, CAST(N'2030-02-20' AS Date), 0, N'UND', 1013, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8130, N'ZUCARITAS', 0, 3021, CAST(N'2030-02-20' AS Date), 0, N'UND', 1013, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8131, N'FRUIT LOOPS', 0, 3021, CAST(N'2030-02-20' AS Date), 0, N'UND', 1013, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8132, N'REPOLLO', 0, 2007, CAST(N'2030-02-20' AS Date), 0, N'LB', 1014, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8133, N'TOMATE', 0, 2007, CAST(N'2030-02-20' AS Date), 0, N'LB', 1014, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8134, N'PAPA', 0, 2007, CAST(N'2030-02-20' AS Date), 0, N'LB', 1014, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8135, N'ZANAHORIA', 0, 2007, CAST(N'2030-02-20' AS Date), 0, N'LB', 1014, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8136, N'GUISQUIL', 0, 2007, CAST(N'2030-02-20' AS Date), 0, N'LB', 1014, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8137, N'LIMON', 0, 2007, CAST(N'2030-02-20' AS Date), 0, N'LB', 1014, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8138, N'CILANTRO', 0, 2007, CAST(N'2030-02-20' AS Date), 0, N'LB', 1014, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8139, N'OREGANO', 0, 2007, CAST(N'2030-02-20' AS Date), 0, N'LB', 1014, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8140, N'LECHUGA', 0, 2007, CAST(N'2030-02-20' AS Date), 0, N'LB', 1014, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8141, N'JALAPEÑO', 0, 2007, CAST(N'2030-02-20' AS Date), 0, N'LB', 1014, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8142, N'CHILE VERDE', 0, 2007, CAST(N'2030-02-20' AS Date), 0, N'LB', 1014, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8143, N'YUCA', 0, 2007, CAST(N'2030-02-20' AS Date), 0, N'LB', 1014, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8144, N'PEPINO', 0, 2007, CAST(N'2030-02-20' AS Date), 0, N'LB', 1014, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8145, N'CEBOLLA BLANCA', 0, 2007, CAST(N'2030-02-20' AS Date), 0, N'LB', 1014, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8146, N'CEBOLLA MORADA', 0, 2007, CAST(N'2030-02-20' AS Date), 0, N'LB', 1014, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8147, N'CEBOLLA AMARILLA', 0, 2007, CAST(N'2030-02-20' AS Date), 0, N'LB', 1014, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8148, N'PLATANO', 0, 3022, CAST(N'2030-02-20' AS Date), 0, N'LB', 1014, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8149, N'EJOTE', 0, 2007, CAST(N'2030-02-20' AS Date), 0, N'LB', 1014, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8150, N'BROCOLIE', 0, 2007, CAST(N'2030-02-20' AS Date), 0, N'LB', 1014, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8151, N'MARACUYA', 0, 3022, CAST(N'2030-02-20' AS Date), 0, N'LB', 1014, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8152, N'TAMARINDO', 0, 3022, CAST(N'2030-02-20' AS Date), 0, N'LB', 1014, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8153, N'MELON', 0, 3022, CAST(N'2030-02-20' AS Date), 0, N'UND', 1014, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8154, N'JAMAICA', 0, 3022, CAST(N'2030-02-20' AS Date), 0, N'LB', 1014, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8155, N'SANDIA', 0, 3022, CAST(N'2030-02-20' AS Date), 0, N'LB', 1014, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8156, N'APIO', 0, 2007, CAST(N'2030-02-20' AS Date), 0, N'LB', 1014, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8157, N'RABANO', 0, 2007, CAST(N'2030-02-20' AS Date), 0, N'LB', 1014, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8158, N'PIPIANES', 0, 2007, CAST(N'2030-02-20' AS Date), 0, N'LB', 1014, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8159, N'PIÑA', 0, 3022, CAST(N'2030-02-20' AS Date), 0, N'LB', 1014, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8160, N'CARAO', 0, 3022, CAST(N'2030-02-20' AS Date), 0, N'LB', 1014, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8161, N'MORA', 0, 3022, CAST(N'2030-02-20' AS Date), 0, N'LB', 1014, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8162, N'REMOLACHA', 0, 2007, CAST(N'2030-02-20' AS Date), 0, N'LB', 1014, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8163, N'ESPINACA', 0, 2007, CAST(N'2030-02-20' AS Date), 0, N'LB', 1014, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8164, N'VINAGRE DE PIÑA', 0, 3023, CAST(N'2030-02-20' AS Date), 0, N'UND', 1014, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8165, N'SERBILLETAS', 0, 3008, CAST(N'2030-02-20' AS Date), 0, N'UND', 1015, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8166, N'TOALLAS', 0, 3008, CAST(N'2030-02-20' AS Date), 0, N'UND', 1015, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8167, N'QUESILLO', 0, 3013, CAST(N'2030-02-20' AS Date), 0, N'LB', 1016, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8168, N'QUESO DURO BLANDO', 0, 3013, CAST(N'2030-02-20' AS Date), 0, N'LB', 1016, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8169, N'CREMA', 0, 3013, CAST(N'2030-02-20' AS Date), 0, N'LB', 1016, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8170, N'ARINA', 0, 2008, CAST(N'2030-02-20' AS Date), 0, N'LB', 1021, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8171, N'ACEITE', 0, 3024, CAST(N'2030-02-20' AS Date), 0, N'GALON', 1021, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8172, N'HUEVOS', 0, 2008, CAST(N'2030-02-20' AS Date), 0, N'UND', 1021, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8173, N'GAS', 0, 2008, CAST(N'2030-02-20' AS Date), 0, N'UND', 1017, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8174, N'RAPIDITAS', 0, 3005, CAST(N'2030-02-20' AS Date), 0, N'UND', 1018, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8175, N'PANES', 0, 3005, CAST(N'2030-02-20' AS Date), 0, N'UND', 1019, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8176, N'TAMALES', 0, 3025, CAST(N'2030-02-20' AS Date), 0, N'UND', 1019, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8177, N'LOMO DE CERDO', 0, 2004, CAST(N'2030-02-20' AS Date), 0, N'LB', 1020, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8178, N'CARNE MOLIDA', 0, 2004, CAST(N'2030-02-20' AS Date), 0, N'LB', 1020, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8179, N'BRAZUELO DE CERDO', 0, 2004, CAST(N'2030-02-20' AS Date), 0, N'LB', 1020, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8180, N'CHULETA AHUMADA', 0, 2004, CAST(N'2030-02-20' AS Date), 0, N'LB', 1020, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8181, N'CHULETA DE RES', 0, 2004, CAST(N'2030-02-20' AS Date), 0, N'LB', 1020, 0, CAST(N'2019-03-27' AS Date))
INSERT [dbo].[Productos] ([Id_Productos], [Nombre_Productos], [Cantidad], [Id_Categoria], [Fecha_de_Caducidad], [Stock(Habilitado)], [Unidad_de_Medida], [Id_Proveedores], [Tipo], [Fecha_de_Ingreso]) VALUES (8182, N'COSTILLA', 0, 2004, CAST(N'2030-02-20' AS Date), 0, N'LB', 1020, 0, CAST(N'2019-03-27' AS Date))
SET IDENTITY_INSERT [dbo].[Productos] OFF
GO
SET IDENTITY_INSERT [dbo].[Proovedores] ON 

INSERT [dbo].[Proovedores] ([Id_Proveedores], [Nombre_Proovedor], [Telefono], [Correo], [Descripcion], [Direccion]) VALUES (1004, N'PEPSI', NULL, NULL, NULL, NULL)
INSERT [dbo].[Proovedores] ([Id_Proveedores], [Nombre_Proovedor], [Telefono], [Correo], [Descripcion], [Direccion]) VALUES (1005, N'COCA-COLA', NULL, NULL, NULL, NULL)
INSERT [dbo].[Proovedores] ([Id_Proveedores], [Nombre_Proovedor], [Telefono], [Correo], [Descripcion], [Direccion]) VALUES (1006, N'SALUD', NULL, NULL, NULL, NULL)
INSERT [dbo].[Proovedores] ([Id_Proveedores], [Nombre_Proovedor], [Telefono], [Correo], [Descripcion], [Direccion]) VALUES (1007, N'PERLITAS', NULL, NULL, NULL, NULL)
INSERT [dbo].[Proovedores] ([Id_Proveedores], [Nombre_Proovedor], [Telefono], [Correo], [Descripcion], [Direccion]) VALUES (1008, N'MULTICONGELADOS', NULL, NULL, NULL, NULL)
INSERT [dbo].[Proovedores] ([Id_Proveedores], [Nombre_Proovedor], [Telefono], [Correo], [Descripcion], [Direccion]) VALUES (1009, N'POLLO INDIO', NULL, NULL, NULL, NULL)
INSERT [dbo].[Proovedores] ([Id_Proveedores], [Nombre_Proovedor], [Telefono], [Correo], [Descripcion], [Direccion]) VALUES (1010, N'LIDO', NULL, NULL, NULL, NULL)
INSERT [dbo].[Proovedores] ([Id_Proveedores], [Nombre_Proovedor], [Telefono], [Correo], [Descripcion], [Direccion]) VALUES (1011, N'SELECTOS', NULL, NULL, NULL, NULL)
INSERT [dbo].[Proovedores] ([Id_Proveedores], [Nombre_Proovedor], [Telefono], [Correo], [Descripcion], [Direccion]) VALUES (1012, N'COMERCIAL MARVIN', NULL, NULL, NULL, NULL)
INSERT [dbo].[Proovedores] ([Id_Proveedores], [Nombre_Proovedor], [Telefono], [Correo], [Descripcion], [Direccion]) VALUES (1013, N'PRICE MART', NULL, NULL, NULL, NULL)
INSERT [dbo].[Proovedores] ([Id_Proveedores], [Nombre_Proovedor], [Telefono], [Correo], [Descripcion], [Direccion]) VALUES (1014, N'MERCADO', NULL, NULL, NULL, NULL)
INSERT [dbo].[Proovedores] ([Id_Proveedores], [Nombre_Proovedor], [Telefono], [Correo], [Descripcion], [Direccion]) VALUES (1015, N'FROSCA S.A KIMBERLY KLARK', NULL, NULL, NULL, NULL)
INSERT [dbo].[Proovedores] ([Id_Proveedores], [Nombre_Proovedor], [Telefono], [Correo], [Descripcion], [Direccion]) VALUES (1016, N'LACTEOS RODRIGUEZ', NULL, NULL, NULL, NULL)
INSERT [dbo].[Proovedores] ([Id_Proveedores], [Nombre_Proovedor], [Telefono], [Correo], [Descripcion], [Direccion]) VALUES (1017, N'TROPIGAS', NULL, NULL, NULL, NULL)
INSERT [dbo].[Proovedores] ([Id_Proveedores], [Nombre_Proovedor], [Telefono], [Correo], [Descripcion], [Direccion]) VALUES (1018, N'BIMBO', NULL, NULL, NULL, NULL)
INSERT [dbo].[Proovedores] ([Id_Proveedores], [Nombre_Proovedor], [Telefono], [Correo], [Descripcion], [Direccion]) VALUES (1019, N'OTROS', NULL, NULL, NULL, NULL)
INSERT [dbo].[Proovedores] ([Id_Proveedores], [Nombre_Proovedor], [Telefono], [Correo], [Descripcion], [Direccion]) VALUES (1020, N'DISPROEMPA', NULL, NULL, NULL, NULL)
INSERT [dbo].[Proovedores] ([Id_Proveedores], [Nombre_Proovedor], [Telefono], [Correo], [Descripcion], [Direccion]) VALUES (1021, N'CASA DEL PANADERO', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Proovedores] OFF
GO
SET IDENTITY_INSERT [dbo].[Receta] ON 

INSERT [dbo].[Receta] ([Id_Receta], [Nombre_Receta]) VALUES (3, N'Receta 1')
INSERT [dbo].[Receta] ([Id_Receta], [Nombre_Receta]) VALUES (1003, N'Z')
SET IDENTITY_INSERT [dbo].[Receta] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id_Roles], [Tipo_Rol], [Descripcion]) VALUES (1, 1, N'Admin')
INSERT [dbo].[Roles] ([Id_Roles], [Tipo_Rol], [Descripcion]) VALUES (2, 2, N'Empleado')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([Id_Usuarios], [Nombres_Usuario], [Apellidos_Usuario], [Usuario], [Contraseña], [Estado], [Id_Roles]) VALUES (1, N'Luis', N'Flores', N'Administrador', N'btWDPPNShuv4Zit7WUnw10K77D8=', NULL, 1)
INSERT [dbo].[Usuarios] ([Id_Usuarios], [Nombres_Usuario], [Apellidos_Usuario], [Usuario], [Contraseña], [Estado], [Id_Roles]) VALUES (2, N'Alejandro', N'Flores', N'Vendedor', N'btWDPPNShuv4Zit7WUnw10K77D8=', NULL, 2)
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
ALTER TABLE [dbo].[Bebidas]  WITH CHECK ADD  CONSTRAINT [FK_Bebidas_Proovedores] FOREIGN KEY([Id_Proovedores(N/A)])
REFERENCES [dbo].[Proovedores] ([Id_Proveedores])
GO
ALTER TABLE [dbo].[Bebidas] CHECK CONSTRAINT [FK_Bebidas_Proovedores]
GO
ALTER TABLE [dbo].[Bebidas]  WITH CHECK ADD  CONSTRAINT [FK_Bebidas_Tipo_de_Bedidas] FOREIGN KEY([Id_Tipo_de_Bebida])
REFERENCES [dbo].[Tipo_de_Bedidas] ([Id_Tipo_de_Bebida])
GO
ALTER TABLE [dbo].[Bebidas] CHECK CONSTRAINT [FK_Bebidas_Tipo_de_Bedidas]
GO
ALTER TABLE [dbo].[Compras]  WITH CHECK ADD  CONSTRAINT [FK_Compras_Proovedores] FOREIGN KEY([Id_Proveedor])
REFERENCES [dbo].[Proovedores] ([Id_Proveedores])
GO
ALTER TABLE [dbo].[Compras] CHECK CONSTRAINT [FK_Compras_Proovedores]
GO
ALTER TABLE [dbo].[Compras]  WITH CHECK ADD  CONSTRAINT [FK_Compras_Proovedores1] FOREIGN KEY([Id_Proveedor])
REFERENCES [dbo].[Proovedores] ([Id_Proveedores])
GO
ALTER TABLE [dbo].[Compras] CHECK CONSTRAINT [FK_Compras_Proovedores1]
GO
ALTER TABLE [dbo].[DetalleCompras]  WITH CHECK ADD  CONSTRAINT [FK_DetalleCompras_Compras] FOREIGN KEY([Id_Compras])
REFERENCES [dbo].[Compras] ([Id_Compras])
GO
ALTER TABLE [dbo].[DetalleCompras] CHECK CONSTRAINT [FK_DetalleCompras_Compras]
GO
ALTER TABLE [dbo].[DetalleCompras]  WITH CHECK ADD  CONSTRAINT [FK_DetalleCompras_Productos] FOREIGN KEY([Id_Productos])
REFERENCES [dbo].[Productos] ([Id_Productos])
GO
ALTER TABLE [dbo].[DetalleCompras] CHECK CONSTRAINT [FK_DetalleCompras_Productos]
GO
ALTER TABLE [dbo].[DetalleReceta]  WITH CHECK ADD  CONSTRAINT [FK_DetalleReceta_Productos1] FOREIGN KEY([Id_Producto])
REFERENCES [dbo].[Productos] ([Id_Productos])
GO
ALTER TABLE [dbo].[DetalleReceta] CHECK CONSTRAINT [FK_DetalleReceta_Productos1]
GO
ALTER TABLE [dbo].[DetalleReceta]  WITH CHECK ADD  CONSTRAINT [FK_DetalleReceta_Receta] FOREIGN KEY([Id_Receta])
REFERENCES [dbo].[Receta] ([Id_Receta])
GO
ALTER TABLE [dbo].[DetalleReceta] CHECK CONSTRAINT [FK_DetalleReceta_Receta]
GO
ALTER TABLE [dbo].[Inter_Recetas]  WITH CHECK ADD  CONSTRAINT [FK_Inter_Recetas_Receta] FOREIGN KEY([Id_Recetas])
REFERENCES [dbo].[Receta] ([Id_Receta])
GO
ALTER TABLE [dbo].[Inter_Recetas] CHECK CONSTRAINT [FK_Inter_Recetas_Receta]
GO
ALTER TABLE [dbo].[Nuevo_Producto]  WITH CHECK ADD  CONSTRAINT [FK_Nuevo_Producto_Categorias] FOREIGN KEY([Id_Categoria])
REFERENCES [dbo].[Categorias] ([Id_Categorias])
GO
ALTER TABLE [dbo].[Nuevo_Producto] CHECK CONSTRAINT [FK_Nuevo_Producto_Categorias]
GO
ALTER TABLE [dbo].[Nuevo_Producto]  WITH CHECK ADD  CONSTRAINT [FK_Nuevo_Producto_Proovedores] FOREIGN KEY([Id_Proovedores])
REFERENCES [dbo].[Proovedores] ([Id_Proveedores])
GO
ALTER TABLE [dbo].[Nuevo_Producto] CHECK CONSTRAINT [FK_Nuevo_Producto_Proovedores]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Categorias] FOREIGN KEY([Id_Categoria])
REFERENCES [dbo].[Categorias] ([Id_Categorias])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_Categorias]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Proovedores] FOREIGN KEY([Id_Proveedores])
REFERENCES [dbo].[Proovedores] ([Id_Proveedores])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_Proovedores]
GO
ALTER TABLE [dbo].[Productos_Proovedores]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Proovedores_Productos] FOREIGN KEY([Id_Productos_Proovedores])
REFERENCES [dbo].[Productos] ([Id_Productos])
GO
ALTER TABLE [dbo].[Productos_Proovedores] CHECK CONSTRAINT [FK_Productos_Proovedores_Productos]
GO
ALTER TABLE [dbo].[Productos_Proovedores]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Proovedores_Proovedores] FOREIGN KEY([Id_Proovedores])
REFERENCES [dbo].[Proovedores] ([Id_Proveedores])
GO
ALTER TABLE [dbo].[Productos_Proovedores] CHECK CONSTRAINT [FK_Productos_Proovedores_Proovedores]
GO
ALTER TABLE [dbo].[Regalias]  WITH CHECK ADD  CONSTRAINT [FK_Regalias_Compras] FOREIGN KEY([Id_Compra])
REFERENCES [dbo].[Compras] ([Id_Compras])
GO
ALTER TABLE [dbo].[Regalias] CHECK CONSTRAINT [FK_Regalias_Compras]
GO
ALTER TABLE [dbo].[Regalias_Local]  WITH CHECK ADD  CONSTRAINT [FK_Regalias_Local_Compras] FOREIGN KEY([Id_Compra])
REFERENCES [dbo].[Compras] ([Id_Compras])
GO
ALTER TABLE [dbo].[Regalias_Local] CHECK CONSTRAINT [FK_Regalias_Local_Compras]
GO
ALTER TABLE [dbo].[Regalias_Local]  WITH CHECK ADD  CONSTRAINT [FK_Regalias_Local_Productos] FOREIGN KEY([Id_Producto])
REFERENCES [dbo].[Productos] ([Id_Productos])
GO
ALTER TABLE [dbo].[Regalias_Local] CHECK CONSTRAINT [FK_Regalias_Local_Productos]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Roles] FOREIGN KEY([Id_Roles])
REFERENCES [dbo].[Roles] ([Id_Roles])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Roles]
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD  CONSTRAINT [FK_Ventas_Bebidas] FOREIGN KEY([Id_Bebidas])
REFERENCES [dbo].[Bebidas] ([Id_Bebidas])
GO
ALTER TABLE [dbo].[Ventas] CHECK CONSTRAINT [FK_Ventas_Bebidas]
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD  CONSTRAINT [FK_Ventas_Catalogo] FOREIGN KEY([Id_Catalogo])
REFERENCES [dbo].[Catalogo] ([Id_Catalogo])
GO
ALTER TABLE [dbo].[Ventas] CHECK CONSTRAINT [FK_Ventas_Catalogo]
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD  CONSTRAINT [FK_Ventas_Tamaño_de_Porcion] FOREIGN KEY([Id_Tamaño_de_Porcion])
REFERENCES [dbo].[Tamaño_de_Porcion] ([Id_Tamaño_de_Porcion])
GO
ALTER TABLE [dbo].[Ventas] CHECK CONSTRAINT [FK_Ventas_Tamaño_de_Porcion]
GO
USE [master]
GO
ALTER DATABASE [LC-IF] SET  READ_WRITE 
GO
