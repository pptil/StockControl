USE [master]
GO
/****** Object:  Database [StockControl]    Script Date: 18/10/2022 17:10:44 ******/
CREATE DATABASE [StockControl]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StockControl', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\StockControl.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'StockControl_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\StockControl_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [StockControl] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StockControl].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StockControl] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StockControl] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StockControl] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StockControl] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StockControl] SET ARITHABORT OFF 
GO
ALTER DATABASE [StockControl] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StockControl] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StockControl] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StockControl] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StockControl] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StockControl] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StockControl] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StockControl] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StockControl] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StockControl] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StockControl] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StockControl] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StockControl] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StockControl] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StockControl] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StockControl] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StockControl] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StockControl] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [StockControl] SET  MULTI_USER 
GO
ALTER DATABASE [StockControl] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StockControl] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StockControl] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StockControl] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [StockControl] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [StockControl] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [StockControl] SET QUERY_STORE = OFF
GO
USE [StockControl]
GO
/****** Object:  Table [dbo].[Articulos]    Script Date: 18/10/2022 17:10:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articulos](
	[articulo_cod] [int] NOT NULL,
	[fabricante_cod] [int] NULL,
	[articulo_denom] [nchar](100) NOT NULL,
	[articulo_stock] [int] NOT NULL,
	[articulo_precio] [float] NOT NULL,
	[sucursal_cod] [int] NULL,
	[articulo_estado] [bit] NULL,
 CONSTRAINT [PK_Articulos] PRIMARY KEY CLUSTERED 
(
	[articulo_cod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fabricantes]    Script Date: 18/10/2022 17:10:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fabricantes](
	[fabricante_cod] [int] NOT NULL,
	[fabricante_denom] [nchar](50) NULL,
 CONSTRAINT [PK_Fabricantes] PRIMARY KEY CLUSTERED 
(
	[fabricante_cod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paises]    Script Date: 18/10/2022 17:10:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paises](
	[pais_cod] [int] NOT NULL,
	[pais_denom] [nchar](50) NULL,
 CONSTRAINT [PK_Paises] PRIMARY KEY CLUSTERED 
(
	[pais_cod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedidos]    Script Date: 18/10/2022 17:10:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedidos](
	[pedido_cod] [int] NOT NULL,
	[proveedor_cod] [int] NOT NULL,
	[pedido_precio] [int] NOT NULL,
	[user_cod] [int] NULL,
	[sucursal_cod] [int] NULL,
	[pedido_fecha] [datetime] NULL,
 CONSTRAINT [PK_Pedidos] PRIMARY KEY CLUSTERED 
(
	[pedido_cod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PedidosDet]    Script Date: 18/10/2022 17:10:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PedidosDet](
	[pedido_cod] [int] NOT NULL,
	[articulo_cod] [int] NULL,
	[pedido_cantidad] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedores]    Script Date: 18/10/2022 17:10:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedores](
	[proveedor_cod] [int] NOT NULL,
	[proveedor_name] [nchar](30) NOT NULL,
	[proveedor_telefono] [nchar](30) NULL,
	[proveedor_mail] [nchar](30) NULL,
	[proveedor_calle] [nchar](50) NULL,
	[provincia_cod] [int] NULL,
	[proveedor_ciudad] [nchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provincias]    Script Date: 18/10/2022 17:10:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provincias](
	[provincia_cod] [int] NOT NULL,
	[provincia_denom] [nchar](10) NULL,
	[pais_cod] [int] NULL,
 CONSTRAINT [PK_Provincias] PRIMARY KEY CLUSTERED 
(
	[provincia_cod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reparaciones]    Script Date: 18/10/2022 17:10:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reparaciones](
	[reparacion_cod] [int] NOT NULL,
	[reparacion_producto] [nchar](50) NULL,
	[reparacion_desc] [nchar](100) NULL,
	[reparacion_danado] [bit] NULL,
	[reparacion_transformador] [bit] NULL,
	[reparacion_funda] [bit] NULL,
	[reparacion_obs] [nchar](50) NULL,
	[reparacion_estado] [int] NULL,
	[reparacion_costo] [float] NULL,
	[sucursal_cod] [int] NULL,
 CONSTRAINT [PK_Reparaciones] PRIMARY KEY CLUSTERED 
(
	[reparacion_cod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 18/10/2022 17:10:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[rol_cod] [int] NOT NULL,
	[rol_denom] [nchar](20) NOT NULL,
	[habilitado] [binary](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[rol_cod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sucursales]    Script Date: 18/10/2022 17:10:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sucursales](
	[sucursal_cod] [int] NOT NULL,
	[sucursal_denom] [nchar](50) NOT NULL,
 CONSTRAINT [PK_Sucursales] PRIMARY KEY CLUSTERED 
(
	[sucursal_cod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 18/10/2022 17:10:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[user_cod] [int] NOT NULL,
	[user_username] [nchar](30) NOT NULL,
	[user_password] [char](50) NOT NULL,
	[user_telefono] [nchar](20) NULL,
	[user_mail] [nchar](50) NULL,
	[rol_cod] [int] NOT NULL,
	[sucursal_cod] [int] NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[user_cod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ventas]    Script Date: 18/10/2022 17:10:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ventas](
	[venta_cod] [int] NOT NULL,
	[venta_precio] [float] NULL,
	[user_cod] [int] NULL,
	[sucursal_cod] [int] NULL,
	[venta_fecha] [datetime] NULL,
 CONSTRAINT [PK_Ventas] PRIMARY KEY CLUSTERED 
(
	[venta_cod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VentasDet]    Script Date: 18/10/2022 17:10:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VentasDet](
	[venta_cod] [int] NOT NULL,
	[articulo_cod] [int] NOT NULL,
	[venta_cantidad] [int] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (1, N'Australia                                         ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (2, N'Austria                                           ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (3, N'Azerbaiyán                                        ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (4, N'Anguilla                                          ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (5, N'Argentina                                         ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (6, N'Armenia                                           ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (7, N'Bielorrusia                                       ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (8, N'Belice                                            ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (9, N'Bélgica                                           ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (10, N'Bermudas                                          ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (11, N'Bulgaria                                          ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (12, N'Brasil                                            ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (13, N'Reino Unido                                       ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (14, N'Hungría                                           ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (15, N'Vietnam                                           ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (16, N'Haiti                                             ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (17, N'Guadalupe                                         ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (18, N'Alemania                                          ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (19, N'Países Bajos, Holanda                             ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (20, N'Grecia                                            ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (21, N'Georgia                                           ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (22, N'Dinamarca                                         ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (23, N'Egipto                                            ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (24, N'Israel                                            ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (25, N'India                                             ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (26, N'Irán                                              ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (27, N'Irlanda                                           ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (28, N'España                                            ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (29, N'Italia                                            ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (30, N'Kazajstán                                         ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (31, N'Camerún                                           ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (32, N'Canadá                                            ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (33, N'Chipre                                            ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (34, N'Kirguistán                                        ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (35, N'China                                             ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (36, N'Costa Rica                                        ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (37, N'Kuwait                                            ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (38, N'Letonia                                           ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (39, N'Libia                                             ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (40, N'Lituania                                          ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (41, N'Luxemburgo                                        ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (42, N'México                                            ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (43, N'Moldavia                                          ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (44, N'Mónaco                                            ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (45, N'Nueva Zelanda                                     ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (46, N'Noruega                                           ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (47, N'Polonia                                           ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (48, N'Portugal                                          ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (49, N'Reunión                                           ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (50, N'Rusia                                             ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (51, N'El Salvador                                       ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (52, N'Eslovaquia                                        ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (53, N'Eslovenia                                         ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (54, N'Surinam                                           ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (55, N'Estados Unidos                                    ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (56, N'Tadjikistan                                       ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (57, N'Turkmenistan                                      ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (58, N'Islas Turcas y Caicos                             ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (59, N'Turquía                                           ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (60, N'Uganda                                            ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (61, N'Uzbekistán                                        ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (62, N'Ucrania                                           ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (63, N'Finlandia                                         ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (64, N'Francia                                           ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (65, N'República Checa                                   ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (66, N'Suiza                                             ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (67, N'Suecia                                            ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (68, N'Estonia                                           ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (69, N'Corea del Sur                                     ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (70, N'Japón                                             ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (71, N'Croacia                                           ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (72, N'Rumanía                                           ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (73, N'Hong Kong                                         ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (74, N'Indonesia                                         ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (75, N'Jordania                                          ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (76, N'Malasia                                           ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (77, N'Singapur                                          ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (78, N'Taiwan                                            ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (79, N'Bosnia y Herzegovina                              ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (80, N'Bahamas                                           ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (81, N'Chile                                             ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (82, N'Colombia                                          ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (83, N'Islandia                                          ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (84, N'Corea del Norte                                   ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (85, N'Macedonia                                         ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (86, N'Malta                                             ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (87, N'Pakistán                                          ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (88, N'Papúa-Nueva Guinea                                ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (89, N'Perú                                              ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (90, N'Filipinas                                         ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (91, N'Arabia Saudita                                    ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (92, N'Tailandia                                         ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (93, N'Emiratos árabes Unidos                            ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (94, N'Groenlandia                                       ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (95, N'Venezuela                                         ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (96, N'Zimbabwe                                          ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (97, N'Kenia                                             ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (98, N'Algeria                                           ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (99, N'Líbano                                            ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (100, N'Botsuana                                          ')
GO
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (101, N'Tanzania                                          ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (102, N'Namibia                                           ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (103, N'Ecuador                                           ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (104, N'Marruecos                                         ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (105, N'Ghana                                             ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (106, N'Siria                                             ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (107, N'Nepal                                             ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (108, N'Mauritania                                        ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (109, N'Seychelles                                        ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (110, N'Paraguay                                          ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (111, N'Uruguay                                           ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (112, N'Congo (Brazzaville)                               ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (113, N'Cuba                                              ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (114, N'Albania                                           ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (115, N'Nigeria                                           ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (116, N'Zambia                                            ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (117, N'Mozambique                                        ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (119, N'Angola                                            ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (120, N'Sri Lanka                                         ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (121, N'Etiopía                                           ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (122, N'Túnez                                             ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (123, N'Bolivia                                           ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (124, N'Panamá                                            ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (125, N'Malawi                                            ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (126, N'Liechtenstein                                     ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (127, N'Bahrein                                           ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (128, N'Barbados                                          ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (130, N'Chad                                              ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (131, N'Man, Isla de                                      ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (132, N'Jamaica                                           ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (133, N'Malí                                              ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (134, N'Madagascar                                        ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (135, N'Senegal                                           ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (136, N'Togo                                              ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (137, N'Honduras                                          ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (138, N'República Dominicana                              ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (139, N'Mongolia                                          ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (140, N'Irak                                              ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (141, N'Sudáfrica                                         ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (142, N'Aruba                                             ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (143, N'Gibraltar                                         ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (144, N'Afganistán                                        ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (145, N'Andorra                                           ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (147, N'Antigua y Barbuda                                 ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (149, N'Bangladesh                                        ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (151, N'Benín                                             ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (152, N'Bután                                             ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (154, N'Islas Virgenes Británicas                         ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (155, N'Brunéi                                            ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (156, N'Burkina Faso                                      ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (157, N'Burundi                                           ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (158, N'Camboya                                           ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (159, N'Cabo Verde                                        ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (164, N'Comores                                           ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (165, N'Congo (Kinshasa)                                  ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (166, N'Cook, Islas                                       ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (168, N'Costa de Marfil                                   ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (169, N'Djibouti, Yibuti                                  ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (171, N'Timor Oriental                                    ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (172, N'Guinea Ecuatorial                                 ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (173, N'Eritrea                                           ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (175, N'Feroe, Islas                                      ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (176, N'Fiyi                                              ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (178, N'Polinesia Francesa                                ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (180, N'Gabón                                             ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (181, N'Gambia                                            ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (184, N'Granada                                           ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (185, N'Guatemala                                         ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (186, N'Guernsey                                          ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (187, N'Guinea                                            ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (188, N'Guinea-Bissau                                     ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (189, N'Guyana                                            ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (193, N'Jersey                                            ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (195, N'Kiribati                                          ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (196, N'Laos                                              ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (197, N'Lesotho                                           ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (198, N'Liberia                                           ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (200, N'Maldivas                                          ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (201, N'Martinica                                         ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (202, N'Mauricio                                          ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (205, N'Myanmar                                           ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (206, N'Nauru                                             ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (207, N'Antillas Holandesas                               ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (208, N'Nueva Caledonia                                   ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (209, N'Nicaragua                                         ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (210, N'Níger                                             ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (212, N'Norfolk Island                                    ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (213, N'Omán                                              ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (215, N'Isla Pitcairn                                     ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (216, N'Qatar                                             ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (217, N'Ruanda                                            ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (218, N'Santa Elena                                       ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (219, N'San Cristobal y Nevis                             ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (220, N'Santa Lucía                                       ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (221, N'San Pedro y Miquelón                              ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (222, N'San Vincente y Granadinas                         ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (223, N'Samoa                                             ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (224, N'San Marino                                        ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (225, N'San Tomé y Príncipe                               ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (226, N'Serbia y Montenegro                               ')
GO
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (227, N'Sierra Leona                                      ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (228, N'Islas Salomón                                     ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (229, N'Somalia                                           ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (232, N'Sudán                                             ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (234, N'Swazilandia                                       ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (235, N'Tokelau                                           ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (236, N'Tonga                                             ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (237, N'Trinidad y Tobago                                 ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (239, N'Tuvalu                                            ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (240, N'Vanuatu                                           ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (241, N'Wallis y Futuna                                   ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (242, N'Sáhara Occidental                                 ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (243, N'Yemen                                             ')
INSERT [dbo].[Paises] ([pais_cod], [pais_denom]) VALUES (246, N'Puerto Rico                                       ')
GO
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (771, N'Alaska    ', 55)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (772, N'Alabama   ', 55)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (774, N'Arkansas  ', 55)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (776, N'Arizona   ', 55)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (777, N'California', 55)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (778, N'Colorado  ', 55)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (781, N'Delaware  ', 55)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (782, N'Florida   ', 55)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (784, N'Georgia   ', 55)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (786, N'Hawaii    ', 55)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (787, N'Iowa      ', 55)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (788, N'Idaho     ', 55)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (789, N'Illinois  ', 55)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (790, N'Indiana   ', 55)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (791, N'Kansas    ', 55)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (792, N'Kentucky  ', 55)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (793, N'Louisiana ', 55)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (795, N'Maryland  ', 55)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (796, N'Maine     ', 55)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (798, N'Michigan  ', 55)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (799, N'Minnesota ', 55)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (800, N'Missouri  ', 55)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (803, N'Montana   ', 55)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (806, N'Nebraska  ', 55)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (808, N'New Jersey', 55)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (809, N'New Mexico', 55)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (810, N'Nevada    ', 55)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (811, N'New York  ', 55)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (812, N'Ohio      ', 55)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (813, N'Oklahoma  ', 55)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (814, N'Oregon    ', 55)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (817, N'Palau     ', 55)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (821, N'Tennessee ', 55)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (822, N'Texas     ', 55)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (823, N'Utah      ', 55)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (824, N'Virginia  ', 55)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (826, N'Vermont   ', 55)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (827, N'Washington', 55)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (829, N'Wisconsin ', 55)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (830, N'Wyoming   ', 55)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (1736, N'Campeche  ', 42)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (1737, N'Chiapas   ', 42)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (1738, N'Chihuahua ', 42)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (1740, N'Colima    ', 42)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (1742, N'Durango   ', 42)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (1743, N'Guanajuato', 42)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (1744, N'Guerrero  ', 42)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (1745, N'Hidalgo   ', 42)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (1746, N'Jalisco   ', 42)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (1747, N'México    ', 42)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (1749, N'Morelos   ', 42)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (1750, N'Nayarit   ', 42)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (1751, N'Nuevo León', 42)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (1752, N'Oaxaca    ', 42)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (1753, N'Puebla    ', 42)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (1757, N'Sinaloa   ', 42)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (1758, N'Sonora    ', 42)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (1759, N'Tabasco   ', 42)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (1760, N'Tamaulipas', 42)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (1761, N'Tlaxcala  ', 42)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (1763, N'Yucatán   ', 42)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (1764, N'Zacatecas ', 42)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (1819, N'Catamarca ', 5)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (1820, N'Chaco     ', 5)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (1821, N'Chubut    ', 5)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (1822, N'Córdoba   ', 5)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (1823, N'Corrientes', 5)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (1825, N'Entre Ríos', 5)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (1826, N'Formosa   ', 5)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (1827, N'Jujuy     ', 5)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (1828, N'La Pampa  ', 5)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (1829, N'La Rioja  ', 5)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (1830, N'Mendoza   ', 5)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (1831, N'Misiones  ', 5)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (1832, N'Neuquén   ', 5)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (1833, N'Río Negro ', 5)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (1834, N'Salta     ', 5)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (1835, N'San Juan  ', 5)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (1836, N'San Luis  ', 5)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (1837, N'Santa Cruz', 5)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (1838, N'Santa Fe  ', 5)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (1841, N'Tucumán   ', 5)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (1901, N'Acre      ', 12)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (1902, N'Alagoas   ', 12)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (1903, N'Amapa     ', 12)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (1904, N'Amazonas  ', 12)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (1905, N'Bahia     ', 12)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (1906, N'Ceara     ', 12)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (1910, N'Maranhao  ', 12)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (1913, N'Para      ', 12)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (1914, N'Paraiba   ', 12)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (1915, N'Parana    ', 12)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (1916, N'Piaui     ', 12)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (1920, N'Rondonia  ', 12)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (1921, N'Roraima   ', 12)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (1923, N'Sao Paulo ', 12)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (1924, N'Sergipe   ', 12)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (1925, N'Goias     ', 12)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (1926, N'Pernambuco', 12)
INSERT [dbo].[Provincias] ([provincia_cod], [provincia_denom], [pais_cod]) VALUES (1927, N'Tocantins ', 12)
GO
INSERT [dbo].[Reparaciones] ([reparacion_cod], [reparacion_producto], [reparacion_desc], [reparacion_danado], [reparacion_transformador], [reparacion_funda], [reparacion_obs], [reparacion_estado], [reparacion_costo], [sucursal_cod]) VALUES (1, N'Piano Casio CTX                                   ', N'Decripcion                                                                                          ', 0, 0, 1, N'nada                                              ', 1, 10000, 1)
GO
INSERT [dbo].[Sucursales] ([sucursal_cod], [sucursal_denom]) VALUES (1, N'Olmos                                             ')
INSERT [dbo].[Sucursales] ([sucursal_cod], [sucursal_denom]) VALUES (2, N'Humberto Primo                                    ')
GO
ALTER TABLE [dbo].[Articulos]  WITH CHECK ADD  CONSTRAINT [FK_Articulos_Fabricantes] FOREIGN KEY([fabricante_cod])
REFERENCES [dbo].[Fabricantes] ([fabricante_cod])
GO
ALTER TABLE [dbo].[Articulos] CHECK CONSTRAINT [FK_Articulos_Fabricantes]
GO
ALTER TABLE [dbo].[Articulos]  WITH CHECK ADD  CONSTRAINT [FK_Articulos_Sucursales] FOREIGN KEY([sucursal_cod])
REFERENCES [dbo].[Sucursales] ([sucursal_cod])
GO
ALTER TABLE [dbo].[Articulos] CHECK CONSTRAINT [FK_Articulos_Sucursales]
GO
ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD  CONSTRAINT [FK_Pedidos_Sucursales] FOREIGN KEY([sucursal_cod])
REFERENCES [dbo].[Sucursales] ([sucursal_cod])
GO
ALTER TABLE [dbo].[Pedidos] CHECK CONSTRAINT [FK_Pedidos_Sucursales]
GO
ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD  CONSTRAINT [FK_Pedidos_Usuarios] FOREIGN KEY([user_cod])
REFERENCES [dbo].[Usuarios] ([user_cod])
GO
ALTER TABLE [dbo].[Pedidos] CHECK CONSTRAINT [FK_Pedidos_Usuarios]
GO
ALTER TABLE [dbo].[PedidosDet]  WITH CHECK ADD  CONSTRAINT [FK_PedidosDet_Articulo] FOREIGN KEY([articulo_cod])
REFERENCES [dbo].[Articulos] ([articulo_cod])
GO
ALTER TABLE [dbo].[PedidosDet] CHECK CONSTRAINT [FK_PedidosDet_Articulo]
GO
ALTER TABLE [dbo].[PedidosDet]  WITH CHECK ADD  CONSTRAINT [FK_PedidosDet_Pedidos] FOREIGN KEY([pedido_cod])
REFERENCES [dbo].[Pedidos] ([pedido_cod])
GO
ALTER TABLE [dbo].[PedidosDet] CHECK CONSTRAINT [FK_PedidosDet_Pedidos]
GO
ALTER TABLE [dbo].[Proveedores]  WITH CHECK ADD  CONSTRAINT [FK_Proveedores_Provincias] FOREIGN KEY([provincia_cod])
REFERENCES [dbo].[Provincias] ([provincia_cod])
GO
ALTER TABLE [dbo].[Proveedores] CHECK CONSTRAINT [FK_Proveedores_Provincias]
GO
ALTER TABLE [dbo].[Provincias]  WITH CHECK ADD  CONSTRAINT [FK_Provincias_Paises] FOREIGN KEY([pais_cod])
REFERENCES [dbo].[Paises] ([pais_cod])
GO
ALTER TABLE [dbo].[Provincias] CHECK CONSTRAINT [FK_Provincias_Paises]
GO
ALTER TABLE [dbo].[Reparaciones]  WITH CHECK ADD  CONSTRAINT [FK_Reparaciones_Sucursal] FOREIGN KEY([sucursal_cod])
REFERENCES [dbo].[Sucursales] ([sucursal_cod])
GO
ALTER TABLE [dbo].[Reparaciones] CHECK CONSTRAINT [FK_Reparaciones_Sucursal]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Rol] FOREIGN KEY([rol_cod])
REFERENCES [dbo].[Roles] ([rol_cod])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Rol]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Sucursal] FOREIGN KEY([sucursal_cod])
REFERENCES [dbo].[Sucursales] ([sucursal_cod])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Sucursal]
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD  CONSTRAINT [FK_Ventas_Sucursal] FOREIGN KEY([sucursal_cod])
REFERENCES [dbo].[Sucursales] ([sucursal_cod])
GO
ALTER TABLE [dbo].[Ventas] CHECK CONSTRAINT [FK_Ventas_Sucursal]
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD  CONSTRAINT [FK_Ventas_Usuario] FOREIGN KEY([user_cod])
REFERENCES [dbo].[Usuarios] ([user_cod])
GO
ALTER TABLE [dbo].[Ventas] CHECK CONSTRAINT [FK_Ventas_Usuario]
GO
ALTER TABLE [dbo].[VentasDet]  WITH CHECK ADD  CONSTRAINT [FK_VentasDet_Articulos] FOREIGN KEY([articulo_cod])
REFERENCES [dbo].[Articulos] ([articulo_cod])
GO
ALTER TABLE [dbo].[VentasDet] CHECK CONSTRAINT [FK_VentasDet_Articulos]
GO
ALTER TABLE [dbo].[VentasDet]  WITH CHECK ADD  CONSTRAINT [FK_VentasDet_Ventas] FOREIGN KEY([venta_cod])
REFERENCES [dbo].[Ventas] ([venta_cod])
GO
ALTER TABLE [dbo].[VentasDet] CHECK CONSTRAINT [FK_VentasDet_Ventas]
GO
USE [master]
GO
ALTER DATABASE [StockControl] SET  READ_WRITE 
GO
