USE [master]
GO
/****** Object:  Database [StockControl]    Script Date: 2/12/2022 08:51:52 ******/
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
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 2/12/2022 08:51:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Articulos]    Script Date: 2/12/2022 08:51:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articulos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Fabricante] [int] NULL,
	[Nombre] [nchar](100) NOT NULL,
	[Stock] [int] NOT NULL,
	[Precio] [float] NOT NULL,
	[Sucursal] [int] NULL,
	[Estado] [bit] NULL,
 CONSTRAINT [PK_dbo.Articulos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fabricantes]    Script Date: 2/12/2022 08:51:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fabricantes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nchar](50) NULL,
 CONSTRAINT [PK_dbo.Fabricantes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paises]    Script Date: 2/12/2022 08:51:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paises](
	[Id] [int] NOT NULL,
	[Nombre] [nchar](50) NULL,
 CONSTRAINT [PK_dbo.Paises] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedidos]    Script Date: 2/12/2022 08:51:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedidos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Proveedor] [int] NOT NULL,
	[Precio] [int] NOT NULL,
	[Usuario] [int] NULL,
	[Sucursal] [int] NULL,
	[FechaAlta] [datetime] NULL,
 CONSTRAINT [PK_dbo.Pedidos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PedidosDet]    Script Date: 2/12/2022 08:51:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PedidosDet](
	[Id] [int] NOT NULL,
	[Articulo] [int] NULL,
	[Cantidad] [int] NULL,
	[Pedidos_Id] [int] NOT NULL,
 CONSTRAINT [PK_dbo.PedidosDet] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedores]    Script Date: 2/12/2022 08:51:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedores](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nchar](30) NOT NULL,
	[Telefono] [nchar](30) NULL,
	[Mail] [nchar](30) NULL,
	[Calle] [nchar](50) NULL,
	[Provincia] [int] NULL,
	[Ciudad] [nchar](50) NULL,
 CONSTRAINT [PK_dbo.Proveedores] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provincias]    Script Date: 2/12/2022 08:51:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provincias](
	[Id] [int] NOT NULL,
	[Nombre] [nchar](10) NULL,
	[Pais] [int] NULL,
 CONSTRAINT [PK_dbo.Provincias] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reparaciones]    Script Date: 2/12/2022 08:51:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reparaciones](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nchar](50) NULL,
	[Descripcion] [nchar](100) NULL,
	[EstaDanado] [bit] NULL,
	[TieneTransformador] [bit] NULL,
	[TieneFunda] [bit] NULL,
	[Observaciones] [nchar](50) NULL,
	[Estado] [int] NOT NULL,
	[Costo] [float] NULL,
	[Sucursal] [int] NULL,
 CONSTRAINT [PK_dbo.Reparaciones] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 2/12/2022 08:51:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] NOT NULL,
	[Nombre] [nchar](20) NOT NULL,
	[Habilitado] [bit] NULL,
 CONSTRAINT [PK_dbo.Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sucursales]    Script Date: 2/12/2022 08:51:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sucursales](
	[Id] [int] NOT NULL,
	[Nombre] [nchar](50) NOT NULL,
 CONSTRAINT [PK_dbo.Sucursales] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 2/12/2022 08:51:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nchar](30) NOT NULL,
	[Password] [char](50) NOT NULL,
	[Phone] [nchar](20) NULL,
	[Mail] [nchar](50) NULL,
	[Rol] [int] NOT NULL,
	[Sucursal] [int] NULL,
 CONSTRAINT [PK_dbo.Usuarios] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ventas]    Script Date: 2/12/2022 08:51:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ventas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Precio] [float] NULL,
	[Usuario] [int] NULL,
	[Sucursal] [int] NULL,
	[FechaAlta] [datetime] NULL,
 CONSTRAINT [PK_dbo.Ventas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VentasDet]    Script Date: 2/12/2022 08:51:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VentasDet](
	[Id] [int] NOT NULL,
	[Articulo] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
 CONSTRAINT [PK_dbo.VentasDet] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[Articulo] ASC,
	[Cantidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202211291416217_initial', N'DataAccess.Migrations.Configuration', 0x1F8B0800000000000400ED1DD96EE4B8F13D40FEA1D18FC1A4DB4716488CF62EBC3E1223EB19C3F60CF236A05B745B58B5D4D131B113E4CBF2904FCA2F84BA7915454A945A1A1B7E718B64B158178B6491F5BFFFFC77F5D3CBD69B7DC361E406FEE9FC7071309F617F1D38AEBF399D27F1D3EFFF38FFE9C7DFFE6675E96C5F665FCA7AC7693DD2D28F4EE7CF71BC3B592EA3F533DEA268B175D76110054FF1621D6C97C809964707077F5A1E1E2E31013127B066B3D55DE2C7EE16673FC8CFF3C05FE35D9C20EF2670B01715DF49C97D0675F6116D71B4436B7C3ABF40313A5BAF71142D48B318BFC4F3D999E72282C93DF69EE633E4FB418C6282E7C9E708DFC761E06FEE77E403F21E5E7798D47B425E840BFC4FEAEABA4339384A87B2AC1B96A0D64914075B438087C7056D967CF356149E57B423D4BB24548E5FD35167143C9D9F85B1BB4EBC209ACFF8DE4ECEBD30AD793ACF78102C72562CAA261F66D9970F9514106149FF3ECCCE132F4E427CEAE3240E11A9719B3C7AEEFAAFF8F521F815FBA77EE279345E043352C67C209F6EC36087C3F8F50E3F15D85E3BF3D9926DB7E41B56CDA836F930AEFDF8F8683EFB483A478F1EAED84E0DF93E0E42FC67ECE310C5D8B945718C433F858133C209BD737D5DA1C7D05D2322845C9FEA661F83ED63583521024A746D3EBB412FBF607F133F132D3C20DA75E5BE60A7FC12870969F0D9778966E2F2A7303275B764B0EB5F9B88A306711BE2B51B94302E02C2E6167824EB248C906744B3CB2826825E36F939083C8C7CA1D147F4CDDD64AC05394524FF0E7B599DE8D9DDE5466341957FA574E42A0CB67781C702A82B7C7D40E10613FBF310A86ADD0749B816C902227B8B1DD709A28B14B204D71A305DB14655565EE150622AAD540E4717D192930051EB62394D65E50249A5954C29FA85E833D22028554F46CFAA5841CEBA8E8C9AAB656D9295869A11585D534D357A37D6C656F7072DA3AB2B7294C4DBB337BCD8A9AD522BC1A36D8AAEDCD56DDE8ED87D0CFCC699AE6489D14C774ED8E93A8847D18EDCB59A3B7893AC9C600C27392996451980A3582A6028A922C3CF54298C35E2EDA883AE15263FBF61EC04A14D47B41D8CCF51824201480FBEEB155E3FA3332F4695E34C48F74096BFD65C426385E12712854ED977062B6D92BA82252A0A47B0AC626A730A8ECB112C0B65E8F165027242854EE68626A5AEC5A9DBBC1DA3A333075B72FB9A6C4BCBF9B8D51289575EE53ACAC67C6CACBB0A0C790DD2C5EF0EEF508888D1F79B0D0C5B578A295D45852E53CF1467A5BDA13AA9EB4971AD8C8B02CFAA8E298EF97AB509C3B29614BFBC50855D51A3D3C28465AAAE59A45BBD1DC3B8DF3531D7C9058ED6A1BB5B673BDA5DF73C9B77092F90AFB153C8357C70090D1F42E4474F41B845947F6A02E02AF11D64D8F0D36384C36F955CF7CA09761335D3F1FC5374E9275B6307FA3C203AC86F06DBF09F2DF898A65380C2DB944E15AD4C586DE775CD57D9E2DD74199BAEE33ECE506E5114FD23089D0E8A5AF463DAF173E6EB82BD1E59300F37C8F57AB64044B9BA2DDA3B1A1095976BB400E49D1D7085A8EDDF069055CB4AA43E225B22D830AED874B5AC6F6C75FD5785916D8DA5C27FAD608ADE2B5704B3D38AE71A18ADE4B3EA6FC7E05B59C4EB993F435BF317F4E87A6EA77367E50A505BB179E904F4BE957096BAA12B9D79FDB7239EFA1BDBB2D088EF67075A7F36D0D92B50CC049C45B6BBB7DB3C13803BBB2DF152871E1440A571077C996006840A160C81D1B96FD5640CE6405AAD3E81D5A85C9FBC8E751E040E947BEA0D3889EE692BBC45140E7C302D2A8D057FD2485979DC406D6E77208DDCC8C4A7CCEB8F414DC7A34C030704A527DFAEBF7601E1CA39F495AE459DE0F285E201AE50A35B14108586B68C556DDEE5CC30DCB7FBC64ACAFFB67B22852DE92E9442180E28B6264A93858B4008D6A099AA1496D21AA2FEC8AB7556A20A23132D2A1ABD1D351AF7A6EF03F6F053E0079DFBEDB4FD6AA38B73E4797D1FF7559A6416F5E82694A7B9F7C9B8AD59112CA0DAFAE89995644B1915E6C0EE3ABAF2D0A6BED1D460641669AB883EF3EB686208F91D1C7AAF845934AF5926DCE0ED230ECB6D04D73F8BDC8D8FC2F9EC0BF212F2E940601BD3E232228C4355ED4375EDF3248C82AAB228764CE52BD7479EFBCF6C83AF6871DC804C180635E67F103998F38AFE781645011180941D626C3F15F5C3F67AE93B33AD48F0FA2897B9327043D8E7EE08C3884411122F1622DD9ABAA864B9EE825AC1B11DFC4E804E26151CA6561D79E744B7880CB97E2CCE40A972EC90A73356AEB1FEB6C0B2EA862FB9C03BECA7738F0E2174FAA76F84897854DD71536C13AD564B4A88D4B225890485B8AE0A0BAD595E1D86B10C5789932A405B009CADA395C264307A69381D84A63AB6AE4694DEF934522BF5FDA6E1B44A35D001944A45069DEEEB1DEFBD689424F85183E1C239B15D7912E2901B15D6BE2C71431C569238024C4B8E98E0240D6ECB8355ED4A943C1AAAEE830DA8EA5BB664231E56C064F498809409412C10EBE188969AE7F5999A9154C1B72586B252D0E006102168F03A5D57E7C17B111D2E1C01E22E149B40998A406289540203C531354BA22579918F690069918F5CA7E32C926E2F72221C83416C850FB06BC696C76DFAC2029FB4F1509B97166DE5051AD90012030DBF7DD743CE4A05BB1B670E3E2CCFDE9CC487793489A2ED19891DD99013123BF2F1CF47B200530D47563533D97094F7384D294639AC73DC66C21ACFF2ABC108296EB6D995A43D9922707CC3CA90B939DAB30449DFCE80D8AC7E844963EFAF418CD40F75B4D8656D2B4DAA810E20502A3AE874AF08101C56A69ADD69E53B541A12A5274E7BF5AB15431C54965A79D77B1625E0CC1AE278535C0C6542A8B372231BD57446CE76511DB2F72259EAE10E205C6A62E820400556EC47C084603090F170B822C5F322ECCC4CA4E098331D81B5254CD0F886902388025A229445090E203D79284BFA3E2F6951077FA42F90568FF60AC12A9F235CC4AB44453C0F2F0629D07B1C8BF1E475E88C380B0AC2C44261C22604384C690324DAD71200D1857A7060208D10E8D58900842E6C80C31EFA0890D8E20658F5DA5880531735E113C887547C6F685DAEAA84E66581567B397BA9B226EE16764F646E51D0D49EB26E220CAA50034E35E74A0155A51C244AE7A56A443F6544D515350A0AD2604CBE3AFEA91A15A7C8828DD38D76A200C23664C99240833CB217DA44DA3445EFB073211CBF430D0230194D9024E4505830737AC81FBE1229D21CD103EDAE286505B681CDE07A9614D9635B4ABA484F7AA161F0A7BD9D68C29FEF368B5D377AB0F38D9228708805341869904527F248432A2888CAE9D39C50E2FB152285D4E101F2131385C84013B71A50AFE2C25FAA1769A03AE76610074EBA690ECAFC0E150CC9D041E7C77CECE2054571F4EAD35B0677F0FC96C25EEE3AA9C1488800BB4F1DF4A0C44DA106B2A300B9F0724701AD9580DBF46F2465378BA9D283C6F335ED13B64E567220DD903C50A02449A364C0C7449DC831807CC81F0117A9D17CE0A17FE4A1E32CE91F70F4E5954AEFA0AB08A3634655FBF61DC832983D852E4349962F1A5BD0269BD0349BC185ADC9963307105AE0B6A091785156421EF506AAE6162A3D06E98E81E686A9167115A428EFAB559B7C55D96A9967ED2A3EAC96407AAFD50DDAED5C7F43A5FB2ABECCEEF35C5FE7BFBF374F82B5CD612CD70C7DF92DC9AAA73808D10673A5E9E3960EBE72C3284EF38D3DA2F476DDB9B315AA315B9AC0864BD915BF6B2972ADDC84295BA4FFE7ADC4AC670B10504DC72B32B46DBA779CDDBB951A1BA1ED2C4DBA863C144AEEF99E075EB2F5E17D6CB8357D318A86A2BA3005432BEF01D390CA6FFA508A84583490E2933E8CF2D9271A48F9CD00932AB28141068C778021954FBCD270CA6F2294D5921314E164409049CE3CF042AEA502F44E5D47255080D2500365EB7E14C14C74F7C420A5BF67C41F1892067B548DFBE14E7D864FC3804FF66148F5E3493424E889A9FDF3DA12A3DB73792816578E1F6FB4ABCF435BFF2ACC960603C6DEC270ECCD22D47B81CC645D7F1E8DF8522BEC8E120C43D2106255E3373C91346CC31BF147054B8343EAE663E011048549A04083620ACC7CC4324B02EF2796DFF5A1C95227D05065E586D08BBC0A02D4E2BB3E342ED9020D902BEACBE306DD853C9702E32BE49FFAB4FF7BB20A8AED66238B00C1D1B00670D3315B823AFD00E371545F0D20E5F9041830CF92C7EC5430F207AB6810F9177D08D925461A80F45623DC7E32129F1F14769D00654074663E79BB310B3AFDF43A0D89FE3E1AE682474546DC9543D1602FD4B0AFE5D3FB92A796973DCA9B85CD191090B6D4BD6FCDF4C9E8E27CA7EBCE8C148ACEC60CD0700C13C7BE38A23ABB33E30A084987338AC663E00EECBFBA11EFBBCA6E24EC95BFF0B1B5318301509A1C065B8F99C5F563B9CC72BDFA3AE4F2A278EE96B5F29E9897450583BA75C56F170397B114F8148FDC320815DF865701F6645F7A28C00408E96CFF330DF48F73D280059EEE6074BB48282D652801CAEF5F5108B4C20DBC84D55A51619CF8A00C91BB426C065FA592ADE24BF5BB8ACD28E22298808D6C3869F845368CA888D1E00325F22AF359A6224E1624F11AC578BB482B2CEEFFEE9D7B2E91E6BAC20DF2DD271CC5F9C3C2F3A383C3A3F9ECCC23B35B1E385384809CF017C6B462420E8FD39810EC6C977C73F3C892144A1439CCD3EAE2B3EFD0CBA303BCC0EEFAA5DAA9DE58377CFE9C0ED1A0BA11AEEF5DFB0E7E399DFF2B6B7632BBFEDBD7BAE587D9A79070FA647630FB378D80CE83E2ECA3EF3E598F8562E660D33492799C07351CD37C9C4CBAAF272F40E630F8545EBA642DDB75212A9B0AF8D18DD500B4731E8011159315FF26F1FBE1C012E9C0574586A29C2161F86454BAE25BB6EB22BE7C6A2A0E7FAD3C05943F603680BA25340409FD4CC5E03BD11E2AACC296B16D0381CBB4A8CBE9A2591749DDA79117D23E3A84A97196F6D18AC582821EC66AB1CC4C79172556BCF03C554DEE3A0F8A1099F0054DEF4ED7B729E31834FD1B11882C6CA11BB0225AA135102E42C11E1F585FB08D6215A10A80333C2E33A9ADC3C0A393DFABFE1E9BAFA2EAC0831CA8B94195C0CCA310202C8F8CA59B4EAB65435BB210053321254D0C3CC549288724A660AAB3FE91B9908A99E1EDADA0A5AF934ED5E8346C93E8E8DBBBEBDE87EB0E3D3739E9E4DBBA0C325AB80FB7F1A1E76AA9773E3AED3C48CEFBA76AD4EDEDCA41CF1D4E943087C60E0F9D5A587B8B8CB4E9C1EB004FC5273B41F6E095F3E96A9B807677A2CDE13189686D78E5D479BCA1A4960D3B6D4733D96BED59238BB9432DA50AA55EA9A0E00D981774D087A0BFD79C9F96327C566121433D360F5F32B52E03CA8BCB626FEAE89261F35B98A43EB593D4623F5641796173CF46613CD94EF49396DA9105031333493930B141E39102C394A37644817DE09282386832D141F2F8A9EF268F4E328CD384DAC8C136BC65505C10DDAB5D984EA2CF6E893D8DA4C7662ECF2113EB7D5FE93AAD64E7E41706C3E4E31C2EFDA6EEAA603209376D98776DF999A0713710B02926CDB4E3EEEDC3DA0FEBE61989DC789C7FED849776E460684330AC0C1898824926ACB4929E725F1B84669B34C36E114E31D564F7CC92FB7108079503339F70AA6922EDE584AC9EDDE6000E950172A8748FF0ED6FC9F9C1C4923B5A48E5682A595693370E9BF2730AC919C507CF79CE1517B9F9F9449D7D31BF0D7C3A771ED38084FC00BC97E48CB28E7AC9DE28EBC86E7647450F8DE0B5533FCA3AE92B35A4AC2FFBC92365BDD84A2D291D819DAC9332D0763352C23D584958291557CBC92CA57DF492EC12EA6974D9305B25BF14ACF684325DB6CD6B49E9C7041359B6C927D53F977BCD52D966C8063232DE24946D062E9B8827945ED23C955EBF9CB69D3FD2305FA41159C69222B25D4648DE2C8F3E07A4B9A86A93677C591EDB98A2BE85B7C71C8E6D86DB2777FBCED1D822F5E010DE54BF09185B0CBA7F53056CC8DA4DAFD8369722B7669A4EE644E33C89A6A4B29319517C656FB5BC4BFCF4A267FEEB0247EEA606B122307DBC6676F4AA3AD7FE53506E2B72189555F86B3D38464EFA9823D18527B48E4971FAAAA3EB6FE6B32FC84B4895CBED2376AEFD4F49BC4B623264BC7DF45E6962A41B94AAFEB3F48F2CCEAB4FBBF457646308044D37BD1BFBC9FF39713DA7C2FB4A7211120091EE7C1657BA525EC6E9D5AECD6B05E9A3901601025490AFDAB07DC0DB9D4780459FFC7BF40DB7C1ED73847FC11BB47EBD2D1E4B848134338225FBEAC2459B106DA30246DD9EFC2432EC6C5F7EFC3FF90CCEEB22E00000, N'6.4.4')
GO
SET IDENTITY_INSERT [dbo].[Articulos] ON 

INSERT [dbo].[Articulos] ([Id], [Fabricante], [Nombre], [Stock], [Precio], [Sucursal], [Estado]) VALUES (1, 1, N'CTK-260                                                                                             ', 40, 10000, 1, 1)
INSERT [dbo].[Articulos] ([Id], [Fabricante], [Nombre], [Stock], [Precio], [Sucursal], [Estado]) VALUES (2, 2, N'DGX-349                                                                                             ', 23, 34000, 1, 0)
INSERT [dbo].[Articulos] ([Id], [Fabricante], [Nombre], [Stock], [Precio], [Sucursal], [Estado]) VALUES (3, 1, N'CTK-500                                                                                             ', 300, 230000, 1, 1)
SET IDENTITY_INSERT [dbo].[Articulos] OFF
GO
SET IDENTITY_INSERT [dbo].[Fabricantes] ON 

INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (1, N'Ableton                                           ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (2, N'Aclam                                             ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (3, N'ACME                                              ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (4, N'Acorn                                             ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (5, N'Acus                                              ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (6, N'ADAM Audio                                        ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (7, N'Adam Hall                                         ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (8, N'Adastra                                           ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (9, N'Admira                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (10, N'AER                                               ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (11, N'Aguilar                                           ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (12, N'Ahead                                             ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (13, N'AIAIAI                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (14, N'Akai Professional                                 ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (15, N'AKG                                               ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (16, N'Albion                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (17, N'Alesis                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (18, N'All Parts                                         ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (19, N'Allen and Heath                                   ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (20, N'Alpine                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (21, N'Alto                                              ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (22, N'Alvarez                                           ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (23, N'Ampeg                                             ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (24, N'Angel                                             ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (25, N'Antares                                           ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (26, N'Antelope Audio                                    ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (27, N'Antiquity                                         ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (28, N'Antoni                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (29, N'API                                               ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (30, N'Apogee                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (31, N'Aquarian                                          ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (32, N'Aria                                              ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (33, N'ART                                               ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (34, N'Artemis                                           ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (35, N'Arturia                                           ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (36, N'Ashbury                                           ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (37, N'Ashdown                                           ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (38, N'Ashton                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (39, N'ASM                                               ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (40, N'Astrea                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (41, N'ATV                                               ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (42, N'Audient                                           ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (43, N'Audio Technica                                    ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (44, N'Audix                                             ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (45, N'Augustine                                         ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (46, N'Aulos                                             ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (47, N'Auralex                                           ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (48, N'Austrian Audio                                    ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (49, N'Avantone                                          ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (50, N'Avid                                              ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (51, N'AVSL                                              ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (52, N'BandLab                                           ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (53, N'Bare Knuckle                                      ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (54, N'Barnes and Mullins                                ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (55, N'BC Rich                                           ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (56, N'BCK                                               ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (57, N'Beadbrain                                         ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (58, N'Behringer                                         ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (59, N'Beyerdynamic                                      ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (60, N'Big Fat Snare Drum                                ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (61, N'Big Fish Audio                                    ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (62, N'Big Top                                           ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (63, N'Black Lion Audio                                  ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (64, N'Black Rat                                         ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (65, N'Blackstar                                         ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (66, N'Blaxx                                             ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (67, N'Blue Microphones                                  ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (68, N'Bluguitar                                         ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (69, N'Bogner                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (70, N'Boomwhacker                                       ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (71, N'Bose                                              ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (72, N'Boss                                              ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (73, N'BR Distribution                                   ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (74, N'Breedlove                                         ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (75, N'Brian May Guitars                                 ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (76, N'British Drum Company                              ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (77, N'British Pedal Company                             ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (78, N'Brunswick                                         ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (79, N'BSS                                               ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (80, N'Bucara                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (81, N'Budda                                             ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (82, N'Cakewalk                                          ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (83, N'Cameo                                             ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (84, N'Carl Martin                                       ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (85, N'Carlsbro                                          ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (86, N'Carry-On                                          ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (87, N'Casio                                             ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (88, N'Catalinbread                                      ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (89, N'Celestion                                         ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (90, N'Chalklin                                          ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (91, N'Champion                                          ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (92, N'Chanson                                           ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (93, N'Charvel                                           ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (94, N'Chord                                             ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (95, N'Cioks                                             ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (96, N'Citronic                                          ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (97, N'CKK                                               ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (98, N'Clearsonic                                        ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (99, N'CME                                               ')
GO
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (100, N'CNB                                               ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (101, N'Code                                              ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (102, N'CODE Drumheads                                    ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (103, N'Cole Clark                                        ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (104, N'Coles                                             ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (105, N'Cool Claws                                        ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (106, N'Cordoba                                           ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (107, N'Cort                                              ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (108, N'Crazy Johns                                       ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (109, N'Crest Audio                                       ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (110, N'Crown                                             ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (111, N'Crush Drums                                       ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (112, N'Cympad                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (113, N'DAddario                                          ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (114, N'Danelectro                                        ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (115, N'Danmar                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (116, N'Darkglass                                         ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (117, N'Dave Hill                                         ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (118, N'DB Technologies                                   ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (119, N'DBX                                               ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (120, N'Ddrum                                             ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (121, N'Dean                                              ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (122, N'Dean Markley                                      ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (123, N'Death By Audio                                    ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (124, N'Decksaver                                         ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (125, N'Denis Wick                                        ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (126, N'Denon                                             ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (127, N'Diago                                             ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (128, N'Digidesign                                        ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (129, N'Digitech                                          ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (130, N'Dimarzio                                          ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (131, N'Dixon                                             ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (132, N'Docs                                              ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (133, N'DOD                                               ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (134, N'Doepfer                                           ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (135, N'Dogal                                             ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (136, N'Dominant                                          ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (137, N'Dr Green                                          ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (138, N'Dr Strings                                        ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (139, N'Dr Tite-Fit                                       ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (140, N'Dream                                             ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (141, N'Drum n Base                                       ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (142, N'Duesenberg                                        ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (143, N'Dunlop                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (144, N'DV Mark                                           ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (145, N'DW                                                ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (146, N'DYNACORD                                          ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (147, N'Dynaudio                                          ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (148, N'E-MU                                              ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (149, N'Ear Peace                                         ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (150, N'EarthQuaker Devices                               ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (151, N'Eastcoast                                         ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (152, N'Easy Karaoke                                      ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (153, N'Ebow                                              ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (154, N'EBS                                               ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (155, N'Eden                                              ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (156, N'Edirol                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (157, N'Electro-Harmonix                                  ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (158, N'Electrovision                                     ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (159, N'Electrovoice                                      ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (160, N'Elektron                                          ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (161, N'Elixir                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (162, N'EMG                                               ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (163, N'Empress Effects                                   ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (164, N'Encore                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (165, N'Engelhart                                         ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (166, N'Engl                                              ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (167, N'Epiphone                                          ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (168, N'EPM                                               ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (169, N'Equinox                                           ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (170, N'Ernie Ball                                        ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (171, N'ESI                                               ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (172, N'ESP                                               ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (173, N'Euphonix                                          ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (174, N'Evans                                             ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (175, N'Eventide                                          ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (176, N'EVH                                               ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (177, N'Expressive E                                      ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (178, N'Factory Metal                                     ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (179, N'Faith                                             ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (180, N'Faxx                                              ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (181, N'FBT                                               ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (182, N'Feardog                                           ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (183, N'Fender                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (184, N'Fernandez                                         ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (185, N'Ferndale                                          ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (186, N'Finkel                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (187, N'Fishman                                           ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (188, N'Floyd Rose                                        ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (189, N'Focal                                             ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (190, N'Focusrite                                         ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (191, N'Fostex                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (192, N'Freestyle Music                                   ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (193, N'Freshman                                          ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (194, N'Fret King                                         ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (195, N'Friedman                                          ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (196, N'Fulltone                                          ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (197, N'Fxpansion                                         ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (198, N'G and L                                           ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (199, N'G7th                                              ')
GO
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (200, N'Gallien Krueger                                   ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (201, N'Gamechanger Audio                                 ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (202, N'Gator                                             ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (203, N'Gemini                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (204, N'Genelec                                           ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (205, N'Genesis                                           ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (206, N'Gewa                                              ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (207, N'GHS                                               ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (208, N'Gibraltar                                         ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (209, N'Gibson                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (210, N'Godin                                             ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (211, N'Goldtone                                          ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (212, N'Gon Bops                                          ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (213, N'Gordon Smith                                      ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (214, N'Gorilla                                           ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (215, N'Gretsch                                           ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (216, N'Gretsch Drums                                     ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (217, N'Groove Juice                                      ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (218, N'Groove Tubes                                      ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (219, N'Grover                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (220, N'Gruv Gear                                         ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (221, N'Gruv-X                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (222, N'Guild                                             ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (223, N'Hagstrom                                          ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (224, N'Hammond                                           ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (225, N'Hardcase                                          ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (226, N'Harlequin                                         ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (227, N'Hartke                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (228, N'Hayden                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (229, N'HeadRush                                          ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (230, N'HEAROS                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (231, N'Heil Sound                                        ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (232, N'Helin                                             ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (233, N'Hercules                                          ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (234, N'Heritage Audio                                    ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (235, N'HH Electronics                                    ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (236, N'Hildersine                                        ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (237, N'Hiscox                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (238, N'HKAudio                                           ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (239, N'Hofner                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (240, N'Hohner                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (241, N'Holz                                              ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (242, N'Hotone                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (243, N'Hotsticks                                         ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (244, N'HQ                                                ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (245, N'Hughes and Kettner                                ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (246, N'Ibanez                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (247, N'Icon                                              ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (248, N'iConnectivity                                     ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (249, N'iDance                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (250, N'IK Multimedia                                     ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (251, N'iLok                                              ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (252, N'ION                                               ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (253, N'IsoAcoustics                                      ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (254, N'Istanbul                                          ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (255, N'Italia                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (256, N'iZotope                                           ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (257, N'J Rockett Pedals                                  ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (258, N'J.Michael                                         ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (259, N'Jackson                                           ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (260, N'Jackson Audio                                     ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (261, N'James Neligan                                     ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (262, N'James Neligan - JN Guitars                        ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (263, N'Jamhub                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (264, N'JamStands                                         ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (265, N'JBL                                               ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (266, N'JHS                                               ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (267, N'John Hornby Skewes                                ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (268, N'Jose Ferrer                                       ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (269, N'Juno                                              ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (270, N'Jupiter                                           ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (271, N'K and M                                           ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (272, N'Kala Brand Music Co                               ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (273, N'Kali Audio                                        ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (274, N'Kam                                               ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (275, N'Keeley                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (276, N'Kemper                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (277, N'Keo Percussion                                    ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (278, N'Kickport                                          ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (279, N'Kingston                                          ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (280, N'Kinsman                                           ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (281, N'Klotz                                             ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (282, N'KMA Audio Machines                                ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (283, N'Konig and Meyer                                   ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (284, N'Korala                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (285, N'Korg                                              ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (286, N'Kramer                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (287, N'KRK                                               ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (288, N'Kun                                               ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (289, N'Kuppmen                                           ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (290, N'Kurzweil                                          ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (291, N'Kyser                                             ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (292, N'La Audio                                          ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (293, N'Lace                                              ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (294, N'LAG                                               ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (295, N'Landlord FX                                       ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (296, N'Laney                                             ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (297, N'Lanikai                                           ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (298, N'Larrivee                                          ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (299, N'Latin Percussion                                  ')
GO
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (300, N'LD SYSTEMS                                        ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (301, N'Lee Oskar                                         ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (302, N'Leedy                                             ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (303, N'Lehle                                             ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (304, N'Leisure Lynx                                      ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (305, N'Levys                                             ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (306, N'Lewitt Audio                                      ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (307, N'Lexicon                                           ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (308, N'Line 6                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (309, N'LOCI                                              ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (310, N'Lodestone                                         ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (311, N'LR Baggs                                          ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (312, N'Ludwig                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (313, N'Luna                                              ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (314, N'Lynx                                              ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (315, N'M-Audio                                           ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (316, N'Mackie                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (317, N'MAD Professor                                     ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (318, N'Maestro                                           ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (319, N'Mahalo                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (320, N'Manuel Rodriguez                                  ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (321, N'Mapex                                             ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (322, N'Marantz                                           ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (323, N'Mark Bass                                         ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (324, N'Marshall                                          ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (325, N'Martin                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (326, N'Martin Lighting                                   ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (327, N'Maxon                                             ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (328, N'Meinl                                             ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (329, N'Meris                                             ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (330, N'Mesa Boogie                                       ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (331, N'Miscellaneous                                     ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (332, N'Modal Electronics                                 ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (333, N'Mono                                              ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (334, N'Mooer                                             ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (335, N'Moog                                              ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (336, N'Morley                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (337, N'Morpheus                                          ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (338, N'MOTU                                              ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (339, N'Munro Sonic                                       ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (340, N'Music Man                                         ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (341, N'Music Sales                                       ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (342, N'MXL                                               ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (343, N'MXR                                               ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (344, N'N-Tune                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (345, N'Natal                                             ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (346, N'Native Instruments                                ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (347, N'Nektar                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (348, N'Neotech                                           ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (349, N'Neumann                                           ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (350, N'Neural                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (351, N'Nineboys                                          ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (352, N'Nobels                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (353, N'Nord                                              ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (354, N'Novation                                          ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (355, N'Numark                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (356, N'NUX                                               ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (357, N'Odyssey                                           ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (358, N'Old Blood Noise                                   ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (359, N'On Stage                                          ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (360, N'Orange                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (361, N'Origin FX                                         ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (362, N'Ovation                                           ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (363, N'Ozark                                             ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (364, N'P & H                                             ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (365, N'Paiste                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (366, N'Palma                                             ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (367, N'Palmer                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (368, N'Paoletti                                          ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (369, N'PDP                                               ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (370, N'Pearl                                             ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (371, N'Peavey                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (372, N'Pedaltrain                                        ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (373, N'Percussion Plus                                   ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (374, N'Performance Percussion                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (375, N'Peterson                                          ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (376, N'Picato                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (377, N'Pigtronix                                         ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (378, N'Pilgrim                                           ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (379, N'Pioneer                                           ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (380, N'PJB                                               ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (381, N'Planet Waves                                      ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (382, N'PMT                                               ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (383, N'Pod                                               ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (384, N'Positive Grid                                     ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (385, N'Power Bank                                        ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (386, N'Premier                                           ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (387, N'PreSonus                                          ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (388, N'Prime Vibe                                        ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (389, N'Pro Co                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (390, N'Pro Guard                                         ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (391, N'Pro Signal                                        ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (392, N'Prolight                                          ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (393, N'ProLogix                                          ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (394, N'Promark                                           ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (395, N'Promuco                                           ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (396, N'Protection Racket                                 ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (397, N'PRS                                               ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (398, N'Puresound                                         ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (399, N'PWM                                               ')
GO
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (400, N'Q Parts                                           ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (401, N'QSC                                               ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (402, N'QTX                                               ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (403, N'Quiklok                                           ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (404, N'Radial                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (405, N'Rainger                                           ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (406, N'Randall                                           ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (407, N'Rane                                              ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (408, N'RCF                                               ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (409, N'Reason Studios                                    ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (410, N'Red Panda                                         ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (411, N'Regal                                             ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (412, N'Remo                                              ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (413, N'Revv                                              ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (414, N'Rhythm Tech                                       ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (415, N'Rickenbacker                                      ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (416, N'Rico                                              ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (417, N'Ritter                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (418, N'RME                                               ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (419, N'Rob Papen                                         ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (420, N'Roc n Soc                                         ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (421, N'RockNRoller                                       ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (422, N'Rocktron                                          ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (423, N'Rode                                              ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (424, N'Rodriguez                                         ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (425, N'Roland                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (426, N'Roli                                              ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (427, N'Rotosound                                         ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (428, N'Rupert Neve                                       ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (429, N'S and T Audio                                     ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (430, N'S&T Audio                                         ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (431, N'Sabian                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (432, N'Sakae                                             ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (433, N'Samson                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (434, N'Sandberg                                          ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (435, N'Schaller                                          ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (436, N'Schecter                                          ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (437, N'Schlagwerk                                        ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (438, N'sE Electronics                                    ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (439, N'Seagull                                           ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (440, N'Selectron                                         ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (441, N'Sennheiser                                        ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (442, N'Sequential                                        ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (443, N'Seymour Duncan                                    ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (444, N'Shadow                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (445, N'Shaw                                              ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (446, N'Shergold                                          ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (447, N'Shubb                                             ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (448, N'Shure                                             ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (449, N'Sigma                                             ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (450, N'Simon and Patrick                                 ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (451, N'Singular Sound                                    ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (452, N'SKB                                               ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (453, N'Skeletoncase                                      ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (454, N'SlapKlatz                                         ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (455, N'Snark                                             ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (456, N'Soarvalley                                        ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (457, N'Softube                                           ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (458, N'Solid State Logic                                 ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (459, N'SolidGoldFX                                       ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (460, N'Sonarworks                                        ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (461, N'Sonitus                                           ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (462, N'Sonor                                             ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (463, N'Sontronics                                        ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (464, N'Soundcraft                                        ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (465, N'Source Audio                                      ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (466, N'Spector                                           ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (467, N'Spectrasonics                                     ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (468, N'Squier                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (469, N'Stagg                                             ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (470, N'Stanton                                           ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (471, N'Steinberg                                         ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (472, N'Stentor                                           ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (473, N'Stone Deaf                                        ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (474, N'Strymon                                           ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (475, N'Studiomaster                                      ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (476, N'Suhr                                              ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (477, N'Supro                                             ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (478, N'Swan Flight                                       ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (479, N'SX                                                ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (480, N'T-Rex                                             ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (481, N'Takamine                                          ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (482, N'Tama                                              ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (483, N'Tanglewood                                        ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (484, N'Tannoy                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (485, N'Tascam                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (486, N'Taylor                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (487, N'TC Electronic                                     ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (488, N'TC Helicon                                        ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (489, N'Tech 21                                           ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (490, N'Teenage Engineering                               ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (491, N'TGI                                               ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (492, N'The Beatles                                       ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (493, N'The String Cleaner                                ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (494, N'Thermion                                          ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (495, N'Thomastik                                         ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (496, N'Toca                                              ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (497, N'Tokai                                             ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (498, N'Tombo                                             ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (499, N'ToneBone                                          ')
GO
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (500, N'TonePros                                          ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (501, N'Toontrack                                         ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (502, N'TOURTECH                                          ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (503, N'Townsend Labs                                     ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (504, N'Traben                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (505, N'Trace Elliot                                      ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (506, N'Trantec                                           ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (507, N'Trevor James                                      ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (508, N'True Tone                                         ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (509, N'Trumix                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (510, N'Tuner Fish                                        ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (511, N'Two Notes                                         ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (512, N'UDG                                               ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (513, N'Ultimate                                          ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (514, N'Ultimate Support                                  ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (515, N'Universal Audio                                   ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (516, N'V-MODA                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (517, N'Valencia                                          ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (518, N'Valeton                                           ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (519, N'Van Damme Cables                                  ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (520, N'Vandoren                                          ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (521, N'Vater                                             ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (522, N'Vic Firth                                         ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (523, N'Victory Amps                                      ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (524, N'Vintage                                           ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (525, N'Visual Sound                                      ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (526, N'Vivace                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (527, N'Vocalzone                                         ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (528, N'Voodoo Lab                                        ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (529, N'VOX                                               ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (530, N'Vulcan                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (531, N'W-Audio                                           ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (532, N'Waldorf                                           ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (533, N'Wampler                                           ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (534, N'Warwick                                           ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (535, N'Washburn                                          ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (536, N'Waves                                             ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (537, N'Way Huge                                          ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (538, N'WD                                                ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (539, N'WD Music                                          ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (540, N'Wharfedale                                        ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (541, N'Wincent                                           ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (542, N'Wittner                                           ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (543, N'Wolf                                              ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (544, N'Workshop                                          ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (545, N'Worldmax                                          ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (546, N'XLN Audio                                         ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (547, N'Xvive                                             ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (548, N'Yamaha                                            ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (549, N'Yellow Tools                                      ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (550, N'Zildjian                                          ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (551, N'Zoom                                              ')
INSERT [dbo].[Fabricantes] ([Id], [Nombre]) VALUES (552, N'ZVEX                                              ')
SET IDENTITY_INSERT [dbo].[Fabricantes] OFF
GO
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (1, N'Australia                                         ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (2, N'Austria                                           ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (3, N'Azerbaiyán                                        ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (4, N'Anguilla                                          ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (5, N'Argentina                                         ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (6, N'Armenia                                           ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (7, N'Bielorrusia                                       ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (8, N'Belice                                            ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (9, N'Bélgica                                           ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (10, N'Bermudas                                          ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (11, N'Bulgaria                                          ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (12, N'Brasil                                            ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (13, N'Reino Unido                                       ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (14, N'Hungría                                           ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (15, N'Vietnam                                           ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (16, N'Haiti                                             ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (17, N'Guadalupe                                         ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (18, N'Alemania                                          ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (19, N'Países Bajos, Holanda                             ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (20, N'Grecia                                            ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (21, N'Georgia                                           ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (22, N'Dinamarca                                         ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (23, N'Egipto                                            ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (24, N'Israel                                            ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (25, N'India                                             ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (26, N'Irán                                              ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (27, N'Irlanda                                           ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (28, N'España                                            ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (29, N'Italia                                            ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (30, N'Kazajstán                                         ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (31, N'Camerún                                           ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (32, N'Canadá                                            ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (33, N'Chipre                                            ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (34, N'Kirguistán                                        ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (35, N'China                                             ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (36, N'Costa Rica                                        ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (37, N'Kuwait                                            ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (38, N'Letonia                                           ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (39, N'Libia                                             ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (40, N'Lituania                                          ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (41, N'Luxemburgo                                        ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (42, N'México                                            ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (43, N'Moldavia                                          ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (44, N'Mónaco                                            ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (45, N'Nueva Zelanda                                     ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (46, N'Noruega                                           ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (47, N'Polonia                                           ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (48, N'Portugal                                          ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (49, N'Reunión                                           ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (50, N'Rusia                                             ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (51, N'El Salvador                                       ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (52, N'Eslovaquia                                        ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (53, N'Eslovenia                                         ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (54, N'Surinam                                           ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (55, N'Estados Unidos                                    ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (56, N'Tadjikistan                                       ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (57, N'Turkmenistan                                      ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (58, N'Islas Turcas y Caicos                             ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (59, N'Turquía                                           ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (60, N'Uganda                                            ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (61, N'Uzbekistán                                        ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (62, N'Ucrania                                           ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (63, N'Finlandia                                         ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (64, N'Francia                                           ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (65, N'República Checa                                   ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (66, N'Suiza                                             ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (67, N'Suecia                                            ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (68, N'Estonia                                           ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (69, N'Corea del Sur                                     ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (70, N'Japón                                             ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (71, N'Croacia                                           ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (72, N'Rumanía                                           ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (73, N'Hong Kong                                         ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (74, N'Indonesia                                         ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (75, N'Jordania                                          ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (76, N'Malasia                                           ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (77, N'Singapur                                          ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (78, N'Taiwan                                            ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (79, N'Bosnia y Herzegovina                              ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (80, N'Bahamas                                           ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (81, N'Chile                                             ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (82, N'Colombia                                          ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (83, N'Islandia                                          ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (84, N'Corea del Norte                                   ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (85, N'Macedonia                                         ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (86, N'Malta                                             ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (87, N'Pakistán                                          ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (88, N'Papúa-Nueva Guinea                                ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (89, N'Perú                                              ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (90, N'Filipinas                                         ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (91, N'Arabia Saudita                                    ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (92, N'Tailandia                                         ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (93, N'Emiratos árabes Unidos                            ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (94, N'Groenlandia                                       ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (95, N'Venezuela                                         ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (96, N'Zimbabwe                                          ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (97, N'Kenia                                             ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (98, N'Algeria                                           ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (99, N'Líbano                                            ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (100, N'Botsuana                                          ')
GO
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (101, N'Tanzania                                          ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (102, N'Namibia                                           ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (103, N'Ecuador                                           ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (104, N'Marruecos                                         ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (105, N'Ghana                                             ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (106, N'Siria                                             ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (107, N'Nepal                                             ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (108, N'Mauritania                                        ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (109, N'Seychelles                                        ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (110, N'Paraguay                                          ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (111, N'Uruguay                                           ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (112, N'Congo (Brazzaville)                               ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (113, N'Cuba                                              ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (114, N'Albania                                           ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (115, N'Nigeria                                           ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (116, N'Zambia                                            ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (117, N'Mozambique                                        ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (119, N'Angola                                            ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (120, N'Sri Lanka                                         ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (121, N'Etiopía                                           ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (122, N'Túnez                                             ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (123, N'Bolivia                                           ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (124, N'Panamá                                            ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (125, N'Malawi                                            ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (126, N'Liechtenstein                                     ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (127, N'Bahrein                                           ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (128, N'Barbados                                          ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (130, N'Chad                                              ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (131, N'Man, Isla de                                      ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (132, N'Jamaica                                           ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (133, N'Malí                                              ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (134, N'Madagascar                                        ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (135, N'Senegal                                           ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (136, N'Togo                                              ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (137, N'Honduras                                          ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (138, N'República Dominicana                              ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (139, N'Mongolia                                          ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (140, N'Irak                                              ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (141, N'Sudáfrica                                         ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (142, N'Aruba                                             ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (143, N'Gibraltar                                         ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (144, N'Afganistán                                        ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (145, N'Andorra                                           ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (147, N'Antigua y Barbuda                                 ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (149, N'Bangladesh                                        ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (151, N'Benín                                             ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (152, N'Bután                                             ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (154, N'Islas Virgenes Británicas                         ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (155, N'Brunéi                                            ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (156, N'Burkina Faso                                      ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (157, N'Burundi                                           ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (158, N'Camboya                                           ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (159, N'Cabo Verde                                        ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (164, N'Comores                                           ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (165, N'Congo (Kinshasa)                                  ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (166, N'Cook, Islas                                       ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (168, N'Costa de Marfil                                   ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (169, N'Djibouti, Yibuti                                  ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (171, N'Timor Oriental                                    ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (172, N'Guinea Ecuatorial                                 ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (173, N'Eritrea                                           ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (175, N'Feroe, Islas                                      ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (176, N'Fiyi                                              ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (178, N'Polinesia Francesa                                ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (180, N'Gabón                                             ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (181, N'Gambia                                            ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (184, N'Granada                                           ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (185, N'Guatemala                                         ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (186, N'Guernsey                                          ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (187, N'Guinea                                            ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (188, N'Guinea-Bissau                                     ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (189, N'Guyana                                            ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (193, N'Jersey                                            ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (195, N'Kiribati                                          ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (196, N'Laos                                              ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (197, N'Lesotho                                           ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (198, N'Liberia                                           ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (200, N'Maldivas                                          ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (201, N'Martinica                                         ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (202, N'Mauricio                                          ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (205, N'Myanmar                                           ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (206, N'Nauru                                             ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (207, N'Antillas Holandesas                               ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (208, N'Nueva Caledonia                                   ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (209, N'Nicaragua                                         ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (210, N'Níger                                             ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (212, N'Norfolk Island                                    ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (213, N'Omán                                              ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (215, N'Isla Pitcairn                                     ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (216, N'Qatar                                             ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (217, N'Ruanda                                            ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (218, N'Santa Elena                                       ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (219, N'San Cristobal y Nevis                             ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (220, N'Santa Lucía                                       ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (221, N'San Pedro y Miquelón                              ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (222, N'San Vincente y Granadinas                         ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (223, N'Samoa                                             ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (224, N'San Marino                                        ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (225, N'San Tomé y Príncipe                               ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (226, N'Serbia y Montenegro                               ')
GO
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (227, N'Sierra Leona                                      ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (228, N'Islas Salomón                                     ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (229, N'Somalia                                           ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (232, N'Sudán                                             ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (234, N'Swazilandia                                       ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (235, N'Tokelau                                           ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (236, N'Tonga                                             ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (237, N'Trinidad y Tobago                                 ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (239, N'Tuvalu                                            ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (240, N'Vanuatu                                           ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (241, N'Wallis y Futuna                                   ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (242, N'Sáhara Occidental                                 ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (243, N'Yemen                                             ')
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (246, N'Puerto Rico                                       ')
GO
SET IDENTITY_INSERT [dbo].[Pedidos] ON 

INSERT [dbo].[Pedidos] ([Id], [Proveedor], [Precio], [Usuario], [Sucursal], [FechaAlta]) VALUES (1, 1, 50000, 1, 1, CAST(N'2022-10-16T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Pedidos] OFF
GO
INSERT [dbo].[PedidosDet] ([Id], [Articulo], [Cantidad], [Pedidos_Id]) VALUES (1, 1, 4, 1)
INSERT [dbo].[PedidosDet] ([Id], [Articulo], [Cantidad], [Pedidos_Id]) VALUES (2, 2, 2, 1)
GO
SET IDENTITY_INSERT [dbo].[Proveedores] ON 

INSERT [dbo].[Proveedores] ([Id], [Nombre], [Telefono], [Mail], [Calle], [Provincia], [Ciudad]) VALUES (1, N'Cuerdeah                      ', NULL, NULL, NULL, 1822, N'Cordoba                                           ')
SET IDENTITY_INSERT [dbo].[Proveedores] OFF
GO
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (771, N'Alaska    ', 55)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (772, N'Alabama   ', 55)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (774, N'Arkansas  ', 55)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (776, N'Arizona   ', 55)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (777, N'California', 55)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (778, N'Colorado  ', 55)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (781, N'Delaware  ', 55)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (782, N'Florida   ', 55)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (784, N'Georgia   ', 55)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (786, N'Hawaii    ', 55)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (787, N'Iowa      ', 55)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (788, N'Idaho     ', 55)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (789, N'Illinois  ', 55)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (790, N'Indiana   ', 55)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (791, N'Kansas    ', 55)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (792, N'Kentucky  ', 55)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (793, N'Louisiana ', 55)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (795, N'Maryland  ', 55)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (796, N'Maine     ', 55)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (798, N'Michigan  ', 55)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (799, N'Minnesota ', 55)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (800, N'Missouri  ', 55)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (803, N'Montana   ', 55)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (806, N'Nebraska  ', 55)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (808, N'New Jersey', 55)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (809, N'New Mexico', 55)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (810, N'Nevada    ', 55)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (811, N'New York  ', 55)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (812, N'Ohio      ', 55)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (813, N'Oklahoma  ', 55)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (814, N'Oregon    ', 55)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (817, N'Palau     ', 55)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (821, N'Tennessee ', 55)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (822, N'Texas     ', 55)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (823, N'Utah      ', 55)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (824, N'Virginia  ', 55)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (826, N'Vermont   ', 55)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (827, N'Washington', 55)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (829, N'Wisconsin ', 55)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (830, N'Wyoming   ', 55)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (1736, N'Campeche  ', 42)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (1737, N'Chiapas   ', 42)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (1738, N'Chihuahua ', 42)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (1740, N'Colima    ', 42)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (1742, N'Durango   ', 42)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (1743, N'Guanajuato', 42)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (1744, N'Guerrero  ', 42)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (1745, N'Hidalgo   ', 42)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (1746, N'Jalisco   ', 42)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (1747, N'México    ', 42)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (1749, N'Morelos   ', 42)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (1750, N'Nayarit   ', 42)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (1751, N'Nuevo León', 42)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (1752, N'Oaxaca    ', 42)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (1753, N'Puebla    ', 42)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (1757, N'Sinaloa   ', 42)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (1758, N'Sonora    ', 42)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (1759, N'Tabasco   ', 42)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (1760, N'Tamaulipas', 42)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (1761, N'Tlaxcala  ', 42)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (1763, N'Yucatán   ', 42)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (1764, N'Zacatecas ', 42)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (1819, N'Catamarca ', 5)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (1820, N'Chaco     ', 5)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (1821, N'Chubut    ', 5)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (1822, N'Córdoba   ', 5)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (1823, N'Corrientes', 5)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (1825, N'Entre Ríos', 5)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (1826, N'Formosa   ', 5)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (1827, N'Jujuy     ', 5)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (1828, N'La Pampa  ', 5)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (1829, N'La Rioja  ', 5)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (1830, N'Mendoza   ', 5)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (1831, N'Misiones  ', 5)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (1832, N'Neuquén   ', 5)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (1833, N'Río Negro ', 5)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (1834, N'Salta     ', 5)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (1835, N'San Juan  ', 5)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (1836, N'San Luis  ', 5)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (1837, N'Santa Cruz', 5)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (1838, N'Santa Fe  ', 5)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (1841, N'Tucumán   ', 5)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (1901, N'Acre      ', 12)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (1902, N'Alagoas   ', 12)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (1903, N'Amapa     ', 12)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (1904, N'Amazonas  ', 12)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (1905, N'Bahia     ', 12)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (1906, N'Ceara     ', 12)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (1910, N'Maranhao  ', 12)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (1913, N'Para      ', 12)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (1914, N'Paraiba   ', 12)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (1915, N'Parana    ', 12)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (1916, N'Piaui     ', 12)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (1920, N'Rondonia  ', 12)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (1921, N'Roraima   ', 12)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (1923, N'Sao Paulo ', 12)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (1924, N'Sergipe   ', 12)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (1925, N'Goias     ', 12)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (1926, N'Pernambuco', 12)
INSERT [dbo].[Provincias] ([Id], [Nombre], [Pais]) VALUES (1927, N'Tocantins ', 12)
GO
SET IDENTITY_INSERT [dbo].[Reparaciones] ON 

INSERT [dbo].[Reparaciones] ([Id], [Nombre], [Descripcion], [EstaDanado], [TieneTransformador], [TieneFunda], [Observaciones], [Estado], [Costo], [Sucursal]) VALUES (1, N'Piano Casio CTX                                   ', N'Decripcion                                                                                          ', 1, 0, 1, NULL, 2, 900, 1)
INSERT [dbo].[Reparaciones] ([Id], [Nombre], [Descripcion], [EstaDanado], [TieneTransformador], [TieneFunda], [Observaciones], [Estado], [Costo], [Sucursal]) VALUES (2, N'yamaha guitarra                                   ', N'Descripcion de prueba                                                                               ', 0, 1, 0, NULL, 1, 51870, 1)
INSERT [dbo].[Reparaciones] ([Id], [Nombre], [Descripcion], [EstaDanado], [TieneTransformador], [TieneFunda], [Observaciones], [Estado], [Costo], [Sucursal]) VALUES (1004, N'Piano KORG                                        ', N'asdasda                                                                                             ', 1, 1, 1, NULL, 3, 70867, 1)
SET IDENTITY_INSERT [dbo].[Reparaciones] OFF
GO
INSERT [dbo].[Roles] ([Id], [Nombre], [Habilitado]) VALUES (1, N'Administrador       ', 1)
INSERT [dbo].[Roles] ([Id], [Nombre], [Habilitado]) VALUES (2, N'Empleado            ', 1)
INSERT [dbo].[Roles] ([Id], [Nombre], [Habilitado]) VALUES (3, N'Manager             ', 1)
GO
INSERT [dbo].[Sucursales] ([Id], [Nombre]) VALUES (1, N'Olmos                                             ')
INSERT [dbo].[Sucursales] ([Id], [Nombre]) VALUES (2, N'Humberto Primo                                    ')
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([Id], [Nombre], [Password], [Phone], [Mail], [Rol], [Sucursal]) VALUES (1, N'Admin                         ', N'Admin                                             ', NULL, NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
/****** Object:  Index [IX_Fabricante]    Script Date: 2/12/2022 08:51:52 ******/
CREATE NONCLUSTERED INDEX [IX_Fabricante] ON [dbo].[Articulos]
(
	[Fabricante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Sucursal]    Script Date: 2/12/2022 08:51:52 ******/
CREATE NONCLUSTERED INDEX [IX_Sucursal] ON [dbo].[Articulos]
(
	[Sucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Sucursal]    Script Date: 2/12/2022 08:51:52 ******/
CREATE NONCLUSTERED INDEX [IX_Sucursal] ON [dbo].[Pedidos]
(
	[Sucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Usuario]    Script Date: 2/12/2022 08:51:52 ******/
CREATE NONCLUSTERED INDEX [IX_Usuario] ON [dbo].[Pedidos]
(
	[Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Articulo]    Script Date: 2/12/2022 08:51:52 ******/
CREATE NONCLUSTERED INDEX [IX_Articulo] ON [dbo].[PedidosDet]
(
	[Articulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Pedidos_Id]    Script Date: 2/12/2022 08:51:52 ******/
CREATE NONCLUSTERED INDEX [IX_Pedidos_Id] ON [dbo].[PedidosDet]
(
	[Pedidos_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Provincia]    Script Date: 2/12/2022 08:51:52 ******/
CREATE NONCLUSTERED INDEX [IX_Provincia] ON [dbo].[Proveedores]
(
	[Provincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Pais]    Script Date: 2/12/2022 08:51:52 ******/
CREATE NONCLUSTERED INDEX [IX_Pais] ON [dbo].[Provincias]
(
	[Pais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Sucursal]    Script Date: 2/12/2022 08:51:52 ******/
CREATE NONCLUSTERED INDEX [IX_Sucursal] ON [dbo].[Reparaciones]
(
	[Sucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Rol]    Script Date: 2/12/2022 08:51:52 ******/
CREATE NONCLUSTERED INDEX [IX_Rol] ON [dbo].[Usuarios]
(
	[Rol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Sucursal]    Script Date: 2/12/2022 08:51:52 ******/
CREATE NONCLUSTERED INDEX [IX_Sucursal] ON [dbo].[Usuarios]
(
	[Sucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Sucursal]    Script Date: 2/12/2022 08:51:52 ******/
CREATE NONCLUSTERED INDEX [IX_Sucursal] ON [dbo].[Ventas]
(
	[Sucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Usuario]    Script Date: 2/12/2022 08:51:52 ******/
CREATE NONCLUSTERED INDEX [IX_Usuario] ON [dbo].[Ventas]
(
	[Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Articulo]    Script Date: 2/12/2022 08:51:52 ******/
CREATE NONCLUSTERED INDEX [IX_Articulo] ON [dbo].[VentasDet]
(
	[Articulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Id]    Script Date: 2/12/2022 08:51:52 ******/
CREATE NONCLUSTERED INDEX [IX_Id] ON [dbo].[VentasDet]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Articulos]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Articulos_dbo.Fabricantes_Fabricante] FOREIGN KEY([Fabricante])
REFERENCES [dbo].[Fabricantes] ([Id])
GO
ALTER TABLE [dbo].[Articulos] CHECK CONSTRAINT [FK_dbo.Articulos_dbo.Fabricantes_Fabricante]
GO
ALTER TABLE [dbo].[Articulos]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Articulos_dbo.Sucursales_Sucursal] FOREIGN KEY([Sucursal])
REFERENCES [dbo].[Sucursales] ([Id])
GO
ALTER TABLE [dbo].[Articulos] CHECK CONSTRAINT [FK_dbo.Articulos_dbo.Sucursales_Sucursal]
GO
ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Pedidos_dbo.Sucursales_Sucursal] FOREIGN KEY([Sucursal])
REFERENCES [dbo].[Sucursales] ([Id])
GO
ALTER TABLE [dbo].[Pedidos] CHECK CONSTRAINT [FK_dbo.Pedidos_dbo.Sucursales_Sucursal]
GO
ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Pedidos_dbo.Usuarios_Usuario] FOREIGN KEY([Usuario])
REFERENCES [dbo].[Usuarios] ([Id])
GO
ALTER TABLE [dbo].[Pedidos] CHECK CONSTRAINT [FK_dbo.Pedidos_dbo.Usuarios_Usuario]
GO
ALTER TABLE [dbo].[PedidosDet]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PedidosDet_dbo.Articulos_Articulo] FOREIGN KEY([Articulo])
REFERENCES [dbo].[Articulos] ([Id])
GO
ALTER TABLE [dbo].[PedidosDet] CHECK CONSTRAINT [FK_dbo.PedidosDet_dbo.Articulos_Articulo]
GO
ALTER TABLE [dbo].[PedidosDet]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PedidosDet_dbo.Pedidos_Pedidos_Id] FOREIGN KEY([Pedidos_Id])
REFERENCES [dbo].[Pedidos] ([Id])
GO
ALTER TABLE [dbo].[PedidosDet] CHECK CONSTRAINT [FK_dbo.PedidosDet_dbo.Pedidos_Pedidos_Id]
GO
ALTER TABLE [dbo].[Proveedores]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Proveedores_dbo.Provincias_Provincia] FOREIGN KEY([Provincia])
REFERENCES [dbo].[Provincias] ([Id])
GO
ALTER TABLE [dbo].[Proveedores] CHECK CONSTRAINT [FK_dbo.Proveedores_dbo.Provincias_Provincia]
GO
ALTER TABLE [dbo].[Provincias]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Provincias_dbo.Paises_Pais] FOREIGN KEY([Pais])
REFERENCES [dbo].[Paises] ([Id])
GO
ALTER TABLE [dbo].[Provincias] CHECK CONSTRAINT [FK_dbo.Provincias_dbo.Paises_Pais]
GO
ALTER TABLE [dbo].[Reparaciones]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Reparaciones_dbo.Sucursales_Sucursal] FOREIGN KEY([Sucursal])
REFERENCES [dbo].[Sucursales] ([Id])
GO
ALTER TABLE [dbo].[Reparaciones] CHECK CONSTRAINT [FK_dbo.Reparaciones_dbo.Sucursales_Sucursal]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Usuarios_dbo.Roles_Rol] FOREIGN KEY([Rol])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_dbo.Usuarios_dbo.Roles_Rol]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Usuarios_dbo.Sucursales_Sucursal] FOREIGN KEY([Sucursal])
REFERENCES [dbo].[Sucursales] ([Id])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_dbo.Usuarios_dbo.Sucursales_Sucursal]
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Ventas_dbo.Sucursales_Sucursal] FOREIGN KEY([Sucursal])
REFERENCES [dbo].[Sucursales] ([Id])
GO
ALTER TABLE [dbo].[Ventas] CHECK CONSTRAINT [FK_dbo.Ventas_dbo.Sucursales_Sucursal]
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Ventas_dbo.Usuarios_Usuario] FOREIGN KEY([Usuario])
REFERENCES [dbo].[Usuarios] ([Id])
GO
ALTER TABLE [dbo].[Ventas] CHECK CONSTRAINT [FK_dbo.Ventas_dbo.Usuarios_Usuario]
GO
ALTER TABLE [dbo].[VentasDet]  WITH CHECK ADD  CONSTRAINT [FK_dbo.VentasDet_dbo.Articulos_Articulo] FOREIGN KEY([Articulo])
REFERENCES [dbo].[Articulos] ([Id])
GO
ALTER TABLE [dbo].[VentasDet] CHECK CONSTRAINT [FK_dbo.VentasDet_dbo.Articulos_Articulo]
GO
ALTER TABLE [dbo].[VentasDet]  WITH CHECK ADD  CONSTRAINT [FK_dbo.VentasDet_dbo.Ventas_Id] FOREIGN KEY([Id])
REFERENCES [dbo].[Ventas] ([Id])
GO
ALTER TABLE [dbo].[VentasDet] CHECK CONSTRAINT [FK_dbo.VentasDet_dbo.Ventas_Id]
GO
USE [master]
GO
ALTER DATABASE [StockControl] SET  READ_WRITE 
GO
