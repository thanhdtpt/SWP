USE [master]
GO
CREATE DATABASE [Shop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Shop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Shop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Shop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Shop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Shop] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Shop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Shop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Shop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Shop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Shop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Shop] SET ARITHABORT OFF 
GO
ALTER DATABASE [Shop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Shop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Shop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Shop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Shop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Shop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Shop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Shop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Shop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Shop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Shop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Shop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Shop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Shop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Shop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Shop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Shop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Shop] SET RECOVERY FULL 
GO
ALTER DATABASE [Shop] SET  MULTI_USER 
GO
ALTER DATABASE [Shop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Shop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Shop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Shop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Shop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Shop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Shop', N'ON'
GO
ALTER DATABASE [Shop] SET QUERY_STORE = OFF
GO
USE [Shop]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 30/10/2022 9:44:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__Account__1788CCAC4F8F4466] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 30/10/2022 9:44:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] NOT NULL,
	[CategoryName] [nvarchar](50) NULL,
	[Images] [text] NULL,
 CONSTRAINT [PK__Categori__19093A2B7A833C31] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 30/10/2022 9:44:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[UserName] [nvarchar](50) NOT NULL,
	[CustomerName] [nvarchar](50) NULL,
	[Address] [nvarchar](250) NULL,
	[City] [nvarchar](250) NULL,
	[Phone] [nvarchar](12) NULL,
	[Mail] [nvarchar](50) NULL,
	[Gender] [bit] NULL,
	[dob] [date] NULL,
 CONSTRAINT [PK__Customer__1788CCAC33A29286] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discount]    Script Date: 30/10/2022 9:44:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discount](
	[ID] [nvarchar](50) NOT NULL,
	[DiscountValue] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Images]    Script Date: 30/10/2022 9:44:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[ImageID] [int] IDENTITY(1,1) NOT NULL,
	[Describe] [nvarchar](250) NULL,
	[url] [text] NULL,
	[ProductID] [int] NULL,
	[UserID] [nvarchar](50) NULL,
 CONSTRAINT [PK__Images__7516F4ECB1CD216B] PRIMARY KEY CLUSTERED 
(
	[ImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order Details]    Script Date: 30/10/2022 9:44:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order Details](
	[ID] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK__Order De__3299E55B2EE99DAE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[OrderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 30/10/2022 9:44:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [nvarchar](50) NOT NULL,
	[Shippervia] [int] NULL,
	[OrderDate] [datetime] NULL,
	[RequiredDate] [datetime] NULL,
	[ShippedDate] [datetime] NULL,
	[Freight] [float] NULL,
	[ShipAddress] [nvarchar](250) NULL,
	[ShipCity] [nvarchar](250) NULL,
	[PostalCode] [nvarchar](24) NULL,
	[total] [float] NULL,
	[discount] [float] NULL,
 CONSTRAINT [PK__Orders__C3905BAF16E49DB6] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 30/10/2022 9:44:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ShopID] [nvarchar](50) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[ProductName] [nvarchar](250) NOT NULL,
	[Brand] [nvarchar](250) NULL,
	[Origin] [nvarchar](50) NULL,
	[Images1] [text] NULL,
	[Describe] [nvarchar](max) NULL,
	[OldPrice] [float] NULL,
	[CurrentPrice] [float] NULL,
	[QuantityPerUnit] [int] NULL,
	[UnitInstock] [int] NULL,
	[UnitOnOrder] [int] NULL,
	[IsContinued] [bit] NULL,
 CONSTRAINT [PK__Products__B40CC6ED435C24DE] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shippers]    Script Date: 30/10/2022 9:44:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shippers](
	[ShipperID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyID] [int] NULL,
	[name] [nvarchar](50) NULL,
	[dob] [date] NULL,
	[City] [nvarchar](250) NULL,
	[Address] [nvarchar](500) NULL,
	[PostalCode] [nvarchar](24) NULL,
	[Phone] [nvarchar](12) NULL,
 CONSTRAINT [PK__Shippers__1F8AFFB991FB702B] PRIMARY KEY CLUSTERED 
(
	[ShipperID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipping Company]    Script Date: 30/10/2022 9:44:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipping Company](
	[CompanyID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](50) NULL,
	[Phone] [int] NULL,
	[Avartar] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shops]    Script Date: 30/10/2022 9:44:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shops](
	[UserName] [nvarchar](50) NOT NULL,
	[ShopName] [nvarchar](50) NOT NULL,
	[City] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[avartar] [text] NULL,
 CONSTRAINT [PK__Shops__1788CCAC2E9CB06F] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Account] ([UserName], [Password]) VALUES (N'1', N'123456')
INSERT [dbo].[Account] ([UserName], [Password]) VALUES (N'2', N'123456')
INSERT [dbo].[Account] ([UserName], [Password]) VALUES (N'3', N'123456')
INSERT [dbo].[Account] ([UserName], [Password]) VALUES (N'4', N'123456')
INSERT [dbo].[Account] ([UserName], [Password]) VALUES (N'5', N'123456')
INSERT [dbo].[Account] ([UserName], [Password]) VALUES (N'dung', N'123')
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Images]) VALUES (0, N'Khác', NULL)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Images]) VALUES (1, N'Quần áo', NULL)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Images]) VALUES (2, N'Đồng Hồ', NULL)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Images]) VALUES (3, N'Đồ ăn', NULL)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Images]) VALUES (4, N'Đồ Điện tử', NULL)
GO
INSERT [dbo].[Customers] ([UserName], [CustomerName], [Address], [City], [Phone], [Mail], [Gender], [dob]) VALUES (N'1                                                 ', N'dung bui1', N'B16 Song hành An phú – An Khánh Q.02 TP.Yên Bái', N'Yên Bái', N'0909522702', N'Hoahongcogai@gmail.com', 1, CAST(N'1984-03-09' AS Date))
INSERT [dbo].[Customers] ([UserName], [CustomerName], [Address], [City], [Phone], [Mail], [Gender], [dob]) VALUES (N'2', N'Khánh sky', N'503 Cao ốc  An Phú P.An Phú Q.2 TPHCM
', N'HCM', N'0903734355', N'Khanhbautroi@gmail.com', 1, CAST(N'1985-09-09' AS Date))
INSERT [dbo].[Customers] ([UserName], [CustomerName], [Address], [City], [Phone], [Mail], [Gender], [dob]) VALUES (N'3', N'Ngô Bá Khá', N'84 Đường 1 khu B , An Phú  Hà Nội', N'Hà Nội', N'0907225050', N'Khabanhvippro@gmail.com', 1, CAST(N'1993-11-27' AS Date))
INSERT [dbo].[Customers] ([UserName], [CustomerName], [Address], [City], [Phone], [Mail], [Gender], [dob]) VALUES (N'4', N'Dương Minh tuyền', N'2/41 Cao Thắng P5,Bắc Ninh
', N'Bắc Ninh', N'0907222605	', N'Tuyenmoc@gmail.com', 1, CAST(N'1978-12-20' AS Date))
INSERT [dbo].[Customers] ([UserName], [CustomerName], [Address], [City], [Phone], [Mail], [Gender], [dob]) VALUES (N'5', N'Trần Hồng Tuấn	', N'31 Trần Chánh Chiếu, P14,SaPa', N'Lào Cai', N'0906686899', N'Quantran@gmail.com', 1, CAST(N'1999-10-05' AS Date))
INSERT [dbo].[Customers] ([UserName], [CustomerName], [Address], [City], [Phone], [Mail], [Gender], [dob]) VALUES (N'dung', N'Bùi Anh Dũng', N'An Dương', N'Hải Phòng', N'12345', N'Dungbahe150633@fpt.edu.vn', 0, CAST(N'2001-12-12' AS Date))
GO
INSERT [dbo].[Discount] ([ID], [DiscountValue]) VALUES (N'HCM', 20)
INSERT [dbo].[Discount] ([ID], [DiscountValue]) VALUES (N'HN', 30)
INSERT [dbo].[Discount] ([ID], [DiscountValue]) VALUES (N'HP', 20)
GO
INSERT [dbo].[Order Details] ([ID], [OrderID], [ProductID], [Quantity], [status]) VALUES (3, 1, 33, 5, 1)
INSERT [dbo].[Order Details] ([ID], [OrderID], [ProductID], [Quantity], [status]) VALUES (3, 1, 35, 10, 0)
INSERT [dbo].[Order Details] ([ID], [OrderID], [ProductID], [Quantity], [status]) VALUES (4, 1, 35, 6, 1)
INSERT [dbo].[Order Details] ([ID], [OrderID], [ProductID], [Quantity], [status]) VALUES (5, 16, 40, 7, 1)
INSERT [dbo].[Order Details] ([ID], [OrderID], [ProductID], [Quantity], [status]) VALUES (6, 21, 45, 8, 1)
INSERT [dbo].[Order Details] ([ID], [OrderID], [ProductID], [Quantity], [status]) VALUES (7, 22, 33, 10, 1)
INSERT [dbo].[Order Details] ([ID], [OrderID], [ProductID], [Quantity], [status]) VALUES (8, 22, 35, 10, 0)
INSERT [dbo].[Order Details] ([ID], [OrderID], [ProductID], [Quantity], [status]) VALUES (9, 16, 35, 11, 0)
INSERT [dbo].[Order Details] ([ID], [OrderID], [ProductID], [Quantity], [status]) VALUES (10, 16, 35, 11, 0)
INSERT [dbo].[Order Details] ([ID], [OrderID], [ProductID], [Quantity], [status]) VALUES (11, 26, 1, 3, 1)
INSERT [dbo].[Order Details] ([ID], [OrderID], [ProductID], [Quantity], [status]) VALUES (12, 27, 2, 2, 0)
INSERT [dbo].[Order Details] ([ID], [OrderID], [ProductID], [Quantity], [status]) VALUES (13, 28, 1, 3, 0)
INSERT [dbo].[Order Details] ([ID], [OrderID], [ProductID], [Quantity], [status]) VALUES (13, 29, 8, 2, 1)
INSERT [dbo].[Order Details] ([ID], [OrderID], [ProductID], [Quantity], [status]) VALUES (14, 30, 33, 1, 0)
INSERT [dbo].[Order Details] ([ID], [OrderID], [ProductID], [Quantity], [status]) VALUES (15, 31, 1, 2, 0)
INSERT [dbo].[Order Details] ([ID], [OrderID], [ProductID], [Quantity], [status]) VALUES (15, 32, 2, 2, 0)
INSERT [dbo].[Order Details] ([ID], [OrderID], [ProductID], [Quantity], [status]) VALUES (16, 33, 35, 2, 0)
INSERT [dbo].[Order Details] ([ID], [OrderID], [ProductID], [Quantity], [status]) VALUES (17, 34, 1, 3, 0)
INSERT [dbo].[Order Details] ([ID], [OrderID], [ProductID], [Quantity], [status]) VALUES (17, 35, 3, 3, 0)
INSERT [dbo].[Order Details] ([ID], [OrderID], [ProductID], [Quantity], [status]) VALUES (18, 36, 33, 2, 0)
INSERT [dbo].[Order Details] ([ID], [OrderID], [ProductID], [Quantity], [status]) VALUES (19, 44, 40, 1, 0)
INSERT [dbo].[Order Details] ([ID], [OrderID], [ProductID], [Quantity], [status]) VALUES (20, 45, 2, 2, 0)
INSERT [dbo].[Order Details] ([ID], [OrderID], [ProductID], [Quantity], [status]) VALUES (21, 46, 2, 1, 0)
INSERT [dbo].[Order Details] ([ID], [OrderID], [ProductID], [Quantity], [status]) VALUES (22, 47, 8, 1, 0)
INSERT [dbo].[Order Details] ([ID], [OrderID], [ProductID], [Quantity], [status]) VALUES (23, 48, 2, 2, 0)
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderID], [CustomerID], [Shippervia], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipAddress], [ShipCity], [PostalCode], [total], [discount]) VALUES (1, N'1', 1, CAST(N'2001-01-01T00:00:00.000' AS DateTime), CAST(N'2002-02-02T00:00:00.000' AS DateTime), CAST(N'2002-03-01T00:00:00.000' AS DateTime), 15000, N'Hải Phòng', N'Hải Phòng', N'16', 2000000, NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [Shippervia], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipAddress], [ShipCity], [PostalCode], [total], [discount]) VALUES (16, N'2', 1, CAST(N'2002-08-06T00:00:00.000' AS DateTime), CAST(N'2002-08-20T00:00:00.000' AS DateTime), CAST(N'2002-08-16T00:00:00.000' AS DateTime), 20000, N'Hà Nội', N'Hà Nội', N'30', 3000000, NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [Shippervia], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipAddress], [ShipCity], [PostalCode], [total], [discount]) VALUES (21, N'3', 2, CAST(N'2003-07-05T00:00:00.000' AS DateTime), CAST(N'2003-07-10T00:00:00.000' AS DateTime), CAST(N'2003-07-09T00:00:00.000' AS DateTime), 30000, N'HCM', N'HCM', N'51', 3500000, NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [Shippervia], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipAddress], [ShipCity], [PostalCode], [total], [discount]) VALUES (22, N'4', 2, CAST(N'2005-08-09T00:00:00.000' AS DateTime), CAST(N'2005-08-20T00:00:00.000' AS DateTime), CAST(N'2005-08-23T00:00:00.000' AS DateTime), 20000, N'HN', N'HN', N'30', 4500000, NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [Shippervia], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipAddress], [ShipCity], [PostalCode], [total], [discount]) VALUES (23, N'dung', 1, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'2021-03-25T00:00:00.000' AS DateTime), NULL, 10000, N'số 45 đường-208-an dương-hải phòng', N'Hải Phòng', N'16', 310000, 20000)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [Shippervia], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipAddress], [ShipCity], [PostalCode], [total], [discount]) VALUES (24, N'dung', 2, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'2021-03-25T00:00:00.000' AS DateTime), NULL, 10000, N'số 45 đường-208-an dương-hải phòng', N'Hải Phòng', N'16', 90000, 20000)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [Shippervia], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipAddress], [ShipCity], [PostalCode], [total], [discount]) VALUES (25, N'dung', 2, CAST(N'2021-03-17T00:00:00.000' AS DateTime), CAST(N'2021-03-25T00:00:00.000' AS DateTime), NULL, 10000, N'số 45 đường-208-an dương-hải phòng', N'Hải Phòng', N'16', 940000, 20000)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [Shippervia], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipAddress], [ShipCity], [PostalCode], [total], [discount]) VALUES (26, N'dung', 1, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'2021-03-25T00:00:00.000' AS DateTime), NULL, 10000, N'số 45 đường-208-an dương-hải phòng', N'Hải Phòng', N'16', 310000, 20000)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [Shippervia], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipAddress], [ShipCity], [PostalCode], [total], [discount]) VALUES (27, N'dung', 2, CAST(N'2021-03-07T00:00:00.000' AS DateTime), CAST(N'2021-03-25T00:00:00.000' AS DateTime), NULL, 10000, N'số 45 đường-208-an dương-hải phòng', N'Hải Phòng', N'16', 1080000, 20000)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [Shippervia], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipAddress], [ShipCity], [PostalCode], [total], [discount]) VALUES (28, N'dung', 1, CAST(N'2021-03-07T00:00:00.000' AS DateTime), CAST(N'2021-03-25T00:00:00.000' AS DateTime), NULL, 10000, N'số 45 đường-208-an dương-hải phòng', N'Hải Phòng', N'16', 310000, 20000)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [Shippervia], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipAddress], [ShipCity], [PostalCode], [total], [discount]) VALUES (29, N'dung', 1, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'2021-03-25T00:00:00.000' AS DateTime), NULL, 10000, N'số 45 đường-208-an dương-hải phòng', N'Hải Phòng', N'16', 1420000, 20000)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [Shippervia], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipAddress], [ShipCity], [PostalCode], [total], [discount]) VALUES (30, N'dung', 1, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'2021-03-25T00:00:00.000' AS DateTime), NULL, 10000, N'số 45 đường-208-an dương-hải phòng', N'Hải Phòng', N'16', 400000, 20000)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [Shippervia], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipAddress], [ShipCity], [PostalCode], [total], [discount]) VALUES (31, N'dung', 2, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'2021-03-25T00:00:00.000' AS DateTime), NULL, 10000, N'số 45 đường-208-an dương-hải phòng', N'Hải Phòng', N'16', 200000, 20000)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [Shippervia], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipAddress], [ShipCity], [PostalCode], [total], [discount]) VALUES (32, N'dung', 2, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'2021-03-25T00:00:00.000' AS DateTime), NULL, 10000, N'số 45 đường-208-an dương-hải phòng', N'Hải Phòng', N'16', 1080000, 20000)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [Shippervia], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipAddress], [ShipCity], [PostalCode], [total], [discount]) VALUES (33, N'dung', 2, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'2021-03-25T00:00:00.000' AS DateTime), NULL, 10000, N'số 45 đường-208-an dương-hải phòng', N'Hải Phòng', N'16', 176000, 20000)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [Shippervia], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipAddress], [ShipCity], [PostalCode], [total], [discount]) VALUES (34, N'dung', 2, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'2021-03-25T00:00:00.000' AS DateTime), NULL, 10000, N'An Dương', N'Hải Phòng', N'16', 310000, 20000)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [Shippervia], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipAddress], [ShipCity], [PostalCode], [total], [discount]) VALUES (35, N'dung', 2, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'2021-03-25T00:00:00.000' AS DateTime), NULL, 10000, N'An Dương', N'Hải Phòng', N'16', 1420000, 20000)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [Shippervia], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipAddress], [ShipCity], [PostalCode], [total], [discount]) VALUES (36, N'dung', 2, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'2021-03-25T00:00:00.000' AS DateTime), NULL, 10000, N'An Dương', N'Hải Phòng', N'16', 820000, 20000)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [Shippervia], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipAddress], [ShipCity], [PostalCode], [total], [discount]) VALUES (44, N'dung', 1, CAST(N'2022-09-04T12:33:57.000' AS DateTime), CAST(N'2021-03-25T00:00:00.000' AS DateTime), NULL, 10000, N'An Dương', N'Hải Phòng', N'16', 79000, 20000)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [Shippervia], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipAddress], [ShipCity], [PostalCode], [total], [discount]) VALUES (45, N'dung', 1, CAST(N'2022-12-07T22:37:49.000' AS DateTime), CAST(N'2021-03-25T00:00:00.000' AS DateTime), NULL, 10000, N'An Dương', N'Hải Phòng', N'16', 1110000, 20000)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [Shippervia], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipAddress], [ShipCity], [PostalCode], [total], [discount]) VALUES (46, N'dung', 1, CAST(N'2022-12-07T22:38:06.000' AS DateTime), CAST(N'2021-03-25T00:00:00.000' AS DateTime), NULL, 10000, N'An Dương', N'Hải Phòng', N'16', 560000, 20000)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [Shippervia], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipAddress], [ShipCity], [PostalCode], [total], [discount]) VALUES (47, N'dung', 1, CAST(N'2022-12-07T22:39:27.000' AS DateTime), CAST(N'2021-03-25T00:00:00.000' AS DateTime), NULL, 10000, N'An Dương', N'Hải Phòng', N'16', 730000, 20000)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [Shippervia], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipAddress], [ShipCity], [PostalCode], [total], [discount]) VALUES (48, N'dung', 1, CAST(N'2022-12-07T22:41:47.000' AS DateTime), CAST(N'2021-03-25T00:00:00.000' AS DateTime), NULL, 10000, N'An Dương', N'Hải Phòng', N'16', 1110000, 20000)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [ShopID], [CategoryID], [ProductName], [Brand], [Origin], [Images1], [Describe], [OldPrice], [CurrentPrice], [QuantityPerUnit], [UnitInstock], [UnitOnOrder], [IsContinued]) VALUES (1, N'1                                                 ', 1, N'suzuki3', N'suzuki', N'vietnam1', N'https://cf.shopee.vn/file/e66dca09e5b0e7ea38822f55ac70e234', N'aloo1', 130000, 110000, 1, 201, 101, 1)
INSERT [dbo].[Products] ([ProductID], [ShopID], [CategoryID], [ProductName], [Brand], [Origin], [Images1], [Describe], [OldPrice], [CurrentPrice], [QuantityPerUnit], [UnitInstock], [UnitOnOrder], [IsContinued]) VALUES (2, N'1                                                 ', 1, N'Áo Sweater Coffee nam nữ, Áo hoodie unisex Form rộng Unisex                                            Yindiao - Hàng chính hãng      ', N'No brand                                          ', N'Đài Loan                                          ', N'https://cf.shopee.vn/file/c595b439f00db3c790abfcdbdff82265', N'Áo Sweater Coffee nam nữ, Áo hoodie unisex Form rộng Unisex                                            Yindiao - Hàng chính hãng                                                                                                                        ', 1100000, 550000, 1, 500, 100, 1)
INSERT [dbo].[Products] ([ProductID], [ShopID], [CategoryID], [ProductName], [Brand], [Origin], [Images1], [Describe], [OldPrice], [CurrentPrice], [QuantityPerUnit], [UnitInstock], [UnitOnOrder], [IsContinued]) VALUES (3, N'1                                                 ', 1, N'Áo khoác lông', N'No brand                                          ', N'Đài loan                                          ', N'https://cf.shopee.vn/file/74893b9d48b8cdcd263555ea43e2a307', N'Áo khoác lông mượt mà', 750000, 480000, 1, 500, 152, 1)
INSERT [dbo].[Products] ([ProductID], [ShopID], [CategoryID], [ProductName], [Brand], [Origin], [Images1], [Describe], [OldPrice], [CurrentPrice], [QuantityPerUnit], [UnitInstock], [UnitOnOrder], [IsContinued]) VALUES (8, N'1                                                 ', 1, N'Áo choàng siêu đẹp                                                                                                                                                                                                                                        ', N'No Brand                                          ', N'Việt Nam                                          ', N'https://cf.shopee.vn/file/074e2c4c51b4fd4b4c868df49e23902d', N'Áo choàng lông siêu ấm và style', 860000, 720000, 1, 500, 123, 1)
INSERT [dbo].[Products] ([ProductID], [ShopID], [CategoryID], [ProductName], [Brand], [Origin], [Images1], [Describe], [OldPrice], [CurrentPrice], [QuantityPerUnit], [UnitInstock], [UnitOnOrder], [IsContinued]) VALUES (9, N'1                                                 ', 1, N'Áo thun tee lab siêu cá tính  ', N'Snow                                              ', N'Việt Nam                                          ', N'https://cf.shopee.vn/file/71f6b8a2825b0790498b720a70d720aa', N'Áo thun tee lab siêu cá tính', 230000, 180000, 1, 100, 125, 1)
INSERT [dbo].[Products] ([ProductID], [ShopID], [CategoryID], [ProductName], [Brand], [Origin], [Images1], [Describe], [OldPrice], [CurrentPrice], [QuantityPerUnit], [UnitInstock], [UnitOnOrder], [IsContinued]) VALUES (10, N'1                                                 ', 1, N'Quần Jogger Nam Nữ 3 Sọc Chất Đẹp Form Ống Rộng Để Suông Hoặc Rút Dây Bo Gấu Vải Mịn Mềm Mát Quần Joker, Joger, Thể Thao  ', N'JEMCLOSET                                         ', N'Trung Quốc', N'https://cf.shopee.vn/file/b764f4c385fc771c078ae02d48bb3dbd', N'Tên sản phẩm: Quần Jogger Nam Nữ 3 Sọc Chất Đẹp Form Ống Rộng Để Suông Hoặc Rút Dây Bo Gấu Vải Mịn Mềm Mát Quần Joker, Joger, Thể Thao
Thành phần: vải nỉ cao cấp
Thông số kỹ thuật: form xuông rộng, gấu quần có thể thắt lại
Thông tin cảnh báo: không có
Hướng dẫn sử dụng, hướng dẫn bảo quản: không có
Xuất xứ: Việt Nam
Chịu trách nghiệm sản phẩm: Shop thời trang GUF Unisex
Năm sản xuất: 2021', 250000, 220000, 1, 200, 100, 1)
INSERT [dbo].[Products] ([ProductID], [ShopID], [CategoryID], [ProductName], [Brand], [Origin], [Images1], [Describe], [OldPrice], [CurrentPrice], [QuantityPerUnit], [UnitInstock], [UnitOnOrder], [IsContinued]) VALUES (11, N'1                                                 ', 1, N'Áo Khoa´c N? JEMCLOSET Áo Khoác Ngoài UNPLUG Ch?t Li?u Nhung Gân Dày D?n Có Lót M?t L?p V?i Dù Mát M? 10221 V?i Dày D?n C?c Ð?p - ADLV Áo hoodie dáng rộng in hình thương hiệu ngôi sao thời trang thu đông Hàn Quốc cho nam và nữ [snow boy]', N'JEMCLOSET                                         ', N'Việt Nam', N'https://cf.shopee.vn/file/0f3bb97f24fa1b04d5a5758dd3818117', N'NOTE:All products are in Ready Stock, orders can be shipped before 5 pm every day, because it is shipped from China warehouse, it takes about 5-15 days to arrive. Our philosophy is:High quality worth waiting.

1.Brand Name : Teegotone

2.Sleeve Length(cm) : Full

3.Clothing Length : REGULAR

4.Model Number : Hoodies

5.Hooded : Yes

6.Thickness : STANDARD

7.Item Type : Hoodies

8.Material : Cotton

9.Style : Hip Hop

It is made of high quality materials,Soft hand feeling, no any harm to your skin.', 350000, 120000, 1, 200, 252, 1)
INSERT [dbo].[Products] ([ProductID], [ShopID], [CategoryID], [ProductName], [Brand], [Origin], [Images1], [Describe], [OldPrice], [CurrentPrice], [QuantityPerUnit], [UnitInstock], [UnitOnOrder], [IsContinued]) VALUES (12, N'1                                                 ', 1, N'Áo Khoa´c N? JEMCLOSET Áo Khoác Ngoài UNPLUG Ch?t Li?u Nhung Gân Dày D?n Có Lót M?t L?p V?i Dù Mát M? 10221 V?i Dày D?n C?c Ð?p - 2815                                                                                                                    ', N'JEMCLOSET                                         ', N'Trung Quốc', N'https://cf.shopee.vn/file/fa570102ffa9db5ee571836a60adbc58', N'NOTE:All products are in Ready Stock, orders can be shipped before 5 pm every day, because it is shipped from China warehouse, it takes about 5-15 days to arrive. Our philosophy is:High quality worth waiting.

1.Brand Name : Teegotone

2.Sleeve Length(cm) : Full

3.Clothing Length : REGULAR

4.Model Number : Hoodies

5.Hooded : Yes

6.Thickness : STANDARD

7.Item Type : Hoodies

8.Material : Cotton

9.Style : Hip Hop

It is made of high quality materials,Soft hand feeling, no any harm to your skin.', 350000, 120000, 1, 500, 215, 1)
INSERT [dbo].[Products] ([ProductID], [ShopID], [CategoryID], [ProductName], [Brand], [Origin], [Images1], [Describe], [OldPrice], [CurrentPrice], [QuantityPerUnit], [UnitInstock], [UnitOnOrder], [IsContinued]) VALUES (13, N'1                                                 ', 1, N'Áo Khoác Jeans Loang Ulzzang Phong Cách Unisex Cho C? Nam Và N? V?i Jeans Xu?t Dày D?n                                                                                                                                                                    ', N'AKBN13                                            ', N'Trung Quốc', N'https://cf.shopee.vn/file/04e74b68bb365603dfb5d401938ee315', N'Áo Khoác Jeans Jeans Loang Ulzzang Phong Cách Unisex có form r?ng, phù h?p cho c? nam và n?, có th? dùng làm áo dôi cho các c?p dôi.
-	Áo khoác jean có th? s? d?ng d? m?c di choi v?i b?n bè, di dã ngo?i, ch?p k? y?u,…
-	Thi?t k? d?c dáo, tr? trung, don gi?n nhung không kém ph?n d?c bi?t, c?c d? ph?i d?.
-	Ch?t li?u: Jeans xu?t, co dãn nh?, dày d?n. Ch?t li?u du?c l?a ch?n ki càng, ch?ng nhan c?c t?t và d?t bi?t không b? xù khi gi?t.
-       Công ngh? m?c in UV không b? bong tróc', 550000, 420000, 1, 700, 644, 1)
INSERT [dbo].[Products] ([ProductID], [ShopID], [CategoryID], [ProductName], [Brand], [Origin], [Images1], [Describe], [OldPrice], [CurrentPrice], [QuantityPerUnit], [UnitInstock], [UnitOnOrder], [IsContinued]) VALUES (14, N'1                                                 ', 1, N'Áo khoác form r?ng unisex, áo khoát n? ngo?i ch?ng n?ng có nón missout                                                                                                                                                                                    ', N'missout                                           ', N'Trung Quốc', N'https://cf.shopee.vn/file/5ae4e147229bb0580a1208a2e9b57f54', N'(x? hàng cu?i nam) Áo thun cotton tron from r?ng, áo thun unisex hàng qu?ng châu lo?i 1 (s? lu?ng có h?ng)', 750000, 420000, 1, 200, 125, 1)
INSERT [dbo].[Products] ([ProductID], [ShopID], [CategoryID], [ProductName], [Brand], [Origin], [Images1], [Describe], [OldPrice], [CurrentPrice], [QuantityPerUnit], [UnitInstock], [UnitOnOrder], [IsContinued]) VALUES (15, N'2                                                 ', 4, N'Bàn phím cơ Coputa Bàn phím máy tính laptop gaming Full LED RGB T907', N'T907', N'Hà Nội', N'https://cf.shopee.vn/file/f0b4b21c899df59a220dc57f0f80fe5b', N'Nhẹ gọn, trọng lượng: 0.8kg 
- Kích thước bàn phím: 44 x 15 x 3 (cm) 
- Cổng kết nối: USB 
- Loại kết nối: Có dây usb chống nhiễu
- Chất liệu vỏ: Nhựa ABS siêu bền + chống nước', 798000, 489000, 1, 200, 111, 1)
INSERT [dbo].[Products] ([ProductID], [ShopID], [CategoryID], [ProductName], [Brand], [Origin], [Images1], [Describe], [OldPrice], [CurrentPrice], [QuantityPerUnit], [UnitInstock], [UnitOnOrder], [IsContinued]) VALUES (19, N'2                                                 ', 4, N'Bàn phím bluetooth không dây mini HP 10 inch/ chuột không dây cho điện thoại nhiều màu sắc tùy chọn', N'HP', N'Singapore', N'https://cf.shopee.vn/file/4519d079a924891d22eebe4707797f94', N'Bàn Phím bluetooth không dây mini 
Khắc Laser chống mờ
Thiết kế: giảm thiểu tiếng ồn khi gõ
Kết nối : cổng USB
Kích thước: Nhỏ gọn 24.5 x 15 x 6MM
Bàn Phím bluetooth không dây mini  Tương thích gần như hầu hết hệ điều hành hiện nay', 450000, 265000, 1, 1000, 643, 1)
INSERT [dbo].[Products] ([ProductID], [ShopID], [CategoryID], [ProductName], [Brand], [Origin], [Images1], [Describe], [OldPrice], [CurrentPrice], [QuantityPerUnit], [UnitInstock], [UnitOnOrder], [IsContinued]) VALUES (20, N'2                                                 ', 4, N'Màn Hình Máy Tính Gaming ATAS 24 Inch – Full HD 1080 - Tấm nền IPS - Tần số quét 75HZ', N'Atlas', N'Hàn Quốc', N'https://cf.shopee.vn/file/d7a194ac35987f77ddb81bc8ee52004e', N'** Thông số kỹ thuật của Màn hình ATAS 24 Inch - Tấm Nền IPS
- Tần số 75HZ 
- Tấm nền sử dụng IPS cho góc xem lên đến 178/178 
- Độ phân giải : Full HD1080
- Màn hình Full view 3 cạnh , chống lóa
- Công nghệ lọc sáng xanh đến từ ATAS giúp bảo vệ mắt người dùng
- Độ tương phản : 50.000.000 : 1 
- Tỷ lệ màn hình : 16:9 
- Gam màu : sRGB : 96% 
- Màu sắc hiển thị : 16,7tr màu 
- Màu sắc : Đen', 3990000, 2990000, 1, 200, 123, 1)
INSERT [dbo].[Products] ([ProductID], [ShopID], [CategoryID], [ProductName], [Brand], [Origin], [Images1], [Describe], [OldPrice], [CurrentPrice], [QuantityPerUnit], [UnitInstock], [UnitOnOrder], [IsContinued]) VALUES (21, N'2                                                 ', 4, N'Màn Hình Máy Tính - MSI Pro MP242 (24inch/FHD/IPS/75Hz/5ms/250nits/HDMI+Dsub+Audio) - Hàng Chính', N'MSI', N'Đài Loan', N'https://cf.shopee.vn/file/496ac8ffe526205313b5f8d7fa83b89b', N'Thông số sản phẩm
Kích thước: 23.8 inch
Tấm nền: IPS
Độ phân giải: Full HD (1920×1080)
Tốc độ làm mới: 75Hz
Thời gian đáp ứng: 5ms
Góc nhìn: 178°(H) x 178°(V)
Độ sáng : 250 nits
Loa : 2*2W
Cổng kết nối: 1x D-sub /1x HDMI (1.4),1x Mic-in 1x Ngõ ra tai nghe
Màn hình chứng nhận TÜV bảo vệ thị lực của bạn và giữ cho đôi mắt của bạn khỏe mạnh
Phụ kiện: Cáp nguồn Adapter ,cáp HDMI, sách hướng dẫn', 4390000, 3900000, 1, 200, 56, 1)
INSERT [dbo].[Products] ([ProductID], [ShopID], [CategoryID], [ProductName], [Brand], [Origin], [Images1], [Describe], [OldPrice], [CurrentPrice], [QuantityPerUnit], [UnitInstock], [UnitOnOrder], [IsContinued]) VALUES (29, N'2                                                 ', 4, N'Màn Hình Máy tính LCD 32'''' Samsung S32E360 FHD IPS', N'SamSung', N'Hàn Quốc', N'https://cf.shopee.vn/file/9961f94e13ebd7bf0e8d32a6fd095d9a', N'Brightness (Typical)300 cd/m²
Contrast Ratio5000 : 1 (Typ.)
Dynamic Contrast RatioMega DCR
Resolution1920 x 1080
Pixel Pitch (HxV)0.36375 mm (H) x 0.36375 mm (V)
Response Time5 (GtG)
Viewing Angle (H/V)178° (H) / 178° (V)
Color Support16.7 M
Cổng : HDMI & Vga', 3590000, 3000000, 1, 200, 78, 1)
INSERT [dbo].[Products] ([ProductID], [ShopID], [CategoryID], [ProductName], [Brand], [Origin], [Images1], [Describe], [OldPrice], [CurrentPrice], [QuantityPerUnit], [UnitInstock], [UnitOnOrder], [IsContinued]) VALUES (30, N'2                                                 ', 4, N'Cây Máy Tính Để Bàn H510 - I3 10105F - RAM 8GB 2666 NEW 100%', N'MSI', N'Việt Nam', N'https://cf.shopee.vn/file/bee424585d703ef8ba57f762cfd4c305', N'Main:  MSI H510 MỚI 100% bảo hành 36 tháng
CPU: I3 10100F 4 nhân 8 luồng tubo 4.0ghz (Hiệu năng mạnh hơn core i7 7700 )
Ram:  8GB  2666  chuyển tap mượt mà
SSD: 120G NEW nhanh hơn HHD 10 lần sử lý
VGA : NVIDIA GT 730 2GB  DDR5 CHƠI LMHT , FIFA4 , CF , GTA5 ...( new bh 3 tháng)
  Nguồn:  XIGMATEK  CST CHẠY CỰC KỲ ỔN ĐỊNH
Case: XIGMATEK + FAN LED

QUÀ TẶNG : Lót chuột khổ to', 8500000, 7550000, 1, 200, 139, 1)
INSERT [dbo].[Products] ([ProductID], [ShopID], [CategoryID], [ProductName], [Brand], [Origin], [Images1], [Describe], [OldPrice], [CurrentPrice], [QuantityPerUnit], [UnitInstock], [UnitOnOrder], [IsContinued]) VALUES (31, N'2                                                 ', 4, N'Loa vi tính để bàn MC D221 SUPER BASS cực đã, có LED, dòng loa máy tính cao cấp cho laptop, pc, điện thoại', N'MC D221', N'Thái Lan', N'https://cf.shopee.vn/file/87199be4ce4af711c6f9b592ce15df59', N'Dòng loa 2.1 kênh thoải mái nghe nhạc, xem phim, chơi game

Kết nối đơn giản

Âm bass đầy mạnh mẽ, trung thực với tần số xuống đến 20Hz

Công suốt lớn cho âm thanh to hơn

Loa có thiết kế đơn giản, gọn gàng, phù hợp với đa số nội thất

Loa bass được thiết kế với nhiều công nghệ mới cho âm BASS của loa cực đỉnh', 500000, 279000, 1, 200, 278, 1)
INSERT [dbo].[Products] ([ProductID], [ShopID], [CategoryID], [ProductName], [Brand], [Origin], [Images1], [Describe], [OldPrice], [CurrentPrice], [QuantityPerUnit], [UnitInstock], [UnitOnOrder], [IsContinued]) VALUES (33, N'dung                                              ', 2, N'Đồng Hồ Nam PAGINI PA9966 Dây Titanium Thời Trang Cao Cấp - Kim Dạ Quang Có Lịch Ngày', N'PAGINI', N'Việt Nam', N'https://cf.shopee.vn/file/ec653f4c6dde4f3af86ee0009138b657', N'Thông Tin Đồng Hồ Nam PAGINI PA9966  Kiểu dáng doanh nhân , mạnh mẽ, năng động, lịch lãm.Kính tráng sapphire chống trầy xước cực tốt.Vỏ máy bằng thép 316L sáng bóng, ', 598000, 420000, 1, 200, 841, 1)
INSERT [dbo].[Products] ([ProductID], [ShopID], [CategoryID], [ProductName], [Brand], [Origin], [Images1], [Describe], [OldPrice], [CurrentPrice], [QuantityPerUnit], [UnitInstock], [UnitOnOrder], [IsContinued]) VALUES (34, N'dung                                              ', 2, N'Đồng Hồ Nam Chính Hãng CUENA Dây Da Cao Cấp Phong Cách Thời Trang Sang Trọng, Có Lịch Ngày Đẹp Giá Rẻ', N'CUENA ', N'Việt Nam', N'https://cf.shopee.vn/file/d98e8c1fb52422ed1d4e191617ff2f7f', N'THÔNG TIN VỀ SẢN PHẨM 
- Tình trạng: Mới
- Kích thước mặt đồng hồ: 40mm 
- Kích thước dây đồng hồ: 20mm 
- Chống nước: Thấp nhất 3ATM( Đi mưa và rữa tay thoải mái) 
- Bảo hành: 6 tháng
- Loại: Dùng kim quay hiển thị 
- Chất liệu mặt : Kính cao cấp chống xước 
- Chất liệu vỏ: Thép không gỉ cao cấp
- Năng lượng sử dụng; Pin', 700000, 500000, 1, 200, 489, 1)
INSERT [dbo].[Products] ([ProductID], [ShopID], [CategoryID], [ProductName], [Brand], [Origin], [Images1], [Describe], [OldPrice], [CurrentPrice], [QuantityPerUnit], [UnitInstock], [UnitOnOrder], [IsContinued]) VALUES (35, N'dung                                              ', 3, N'đồ ăn vặt trung quốc- chân gà, chân vịt, cổ, cánh, đồ ăn cay', N'none', N'Trung Quốc', N'https://cf.shopee.vn/file/a9694d682e85007da23c6d7d2d21b0fa', N'XUẤT XỨ: Trung Quốc
Ngày sản xuất. In trên bao bì
Hạn sử dụng. 12 tháng kể từ ngày sản xuất
Nhà sản xuất: Công Ty TNHH DACHENG REAL ESTATE CO, LTD
Người đại diện. DONG, WENHAO
Địa chỉ: Khu Đô Thị Cẩm Giang, Tứ Xuyên, Trung Quốc
Số tiêu chuẩn: GB/T23586
Mã số thuế. 0315841969
Nhà nhập khẩu: CÔNG TY DACHENG FOOD
Địa chỉ: 28 Mai Chí Thọ, Phường An Phú, Quận 2, Thành Phố Hồ Chí Minh', 100000, 98000, 1, 200, 512, 1)
INSERT [dbo].[Products] ([ProductID], [ShopID], [CategoryID], [ProductName], [Brand], [Origin], [Images1], [Describe], [OldPrice], [CurrentPrice], [QuantityPerUnit], [UnitInstock], [UnitOnOrder], [IsContinued]) VALUES (40, N'dung                                              ', 3, N'[100% chất lượng] Chà Bông Xù MIDUCO - 100% Heo Tươi 500gam', N'MIDUCO', N'Việt Nam', N'https://cf.shopee.vn/file/f4cfdd38959691070756b0dc507629ed', N'Thịt chà bông thơm ngon giàu chất dinh dưỡng và rất dễ làm thời gian bảo quản lâu. Chà bông heo làm từ thịt tươi 100%, Nguyên liệu nguồn góc rõ ràng, Gia vị sạch, không thêm tạp chất, Không chất bảo quản, không đường hoá học. Chà bông được thêm gia vị vừa ăn - Cực thích hợp dùng dự trữ sẵn trong căn bếp để dễ dàng kết hợp cùng bánh mì, cơm sấy hay thậm chí là xôi trắng… ngon miệng và còn rất đảm bảo vệ sinh nữa', 100000, 69000, 1, 1000, 786, 1)
INSERT [dbo].[Products] ([ProductID], [ShopID], [CategoryID], [ProductName], [Brand], [Origin], [Images1], [Describe], [OldPrice], [CurrentPrice], [QuantityPerUnit], [UnitInstock], [UnitOnOrder], [IsContinued]) VALUES (41, N'dung                                              ', 3, N'(Giao Nội Thành Hà Nội) Xúc Xích Đức Việt Dòng Chicagos | Xúc Xích Rán | Xúc Xích 10 Cây', N'Đức Việt', N'Việt Nam', N'https://cf.shopee.vn/file/6bb95ff09ba27f905dc723d8663a9600', N'Là dòng sản phẩ mới của Đức Việt
Thành phần dược làm từ thịt gà sạch, xúc xích chicagos cung cấp nhiều dưỡng chất, an toàn vệ sinh thực phẩm
Xúc xích có thể chiên, rán, ... tùy vào khẩu vị và cách mọi người muốn ăn
Được đóng gói 500gr dễ dàng bảo quản', 42000, 35000, 1, 9500, 875, 1)
INSERT [dbo].[Products] ([ProductID], [ShopID], [CategoryID], [ProductName], [Brand], [Origin], [Images1], [Describe], [OldPrice], [CurrentPrice], [QuantityPerUnit], [UnitInstock], [UnitOnOrder], [IsContinued]) VALUES (45, N'dung                                              ', 3, N'Khô cá dứa U Minh Cà Mau 1KG chất lượng ngon,thịt dày dai thơm ,không chất bảo quản ,hàng mới về hàng ngày', N'none', N'Việt Nam', N'https://cf.shopee.vn/file/c4d2c83b6b9f9aa7341a5260c49ee4e1', N'Cam kết:
– Đổi trả tại nhà miễn phí nếu hàng kém chất lượng
– Sản phẩm an toàn, nguồn gốc rõ ràng
Tiêu chuẩn chất lượng : Đạt tiêu chuẩn sạch, KHÔNG hóa chất, KHÔNG phẩm màu, đảm bảo VSATTP.
Hình thức kinh doanh : Bán lẻ giao hàng đi toàn quốc - Kinh doanh sỉ giá rẻ tốt nhất cho đại lý toàn quốc
Hỗ trợ cho các địa lý muốn kinh doanh online mở shop online hoặc mở cửa hàng kinh doanh thực phẩm khô toàn quốc.
', 220000, 115000, 1, 10000, 5700, 1)
INSERT [dbo].[Products] ([ProductID], [ShopID], [CategoryID], [ProductName], [Brand], [Origin], [Images1], [Describe], [OldPrice], [CurrentPrice], [QuantityPerUnit], [UnitInstock], [UnitOnOrder], [IsContinued]) VALUES (54, N'dung                                              ', 3, N'KHÔ CÁ LƯỠI TRÂU LOẠI TRUNG ĐẶC SẢN MINH TRIẾT CÀ MÀU 500GR', N'none', N'Việt Nam', N'https://cf.shopee.vn/file/b4e521ea7eda34ec2284687e7ca377f2', N'Gọi là cá lưỡi bò, chứ tên chính của loài cá này theo Wikipedia tiếng Việt là cá lưỡi trâu. Ngoài ra, bà con nông dân còn gọi bằng nhiều cái tên khác nữa như cá lưỡi mèo, cá thờn bơn…
 Bởi thế trong nhiều thực đơn, các món ngon từ cá lưỡi trâu cũng có nhiều tên gọi khác.

xuất xứ: đại lý Tiên chuyên bán các loại khô hải sản và cua biển Cà Mau 

Khô cá lưỡi trâu chế biến từ nguồn cá lớn đánh bắt bằng lưới, xẻ thịt ngay khi còn sống và ướp muối, phơi khô khoảng 3,4 nắng gắt. Khô cá lưỡi trâu dùng làm món cơm chiên cá mặn hoặc đơn giản nhất là chiên lên ăn với cơm trắng. Khô cá lưỡi trâu là đặc sản Đông Nam Bộ, đặc sản ngon của Cà Mau và đây cũng là đặc sản hấp dẫn của ĐẠI LÝ TIÊN, có quy trình sản xuất đảm bảo 100% an toàn vệ sinh thực phẩm, từ khâu chế biến đến đóng gói đều được kiểm định chặt chẽ, phân phối bởi ĐẠI LÝ TIÊN được thu mua ngay tại nơi sản xuất chính, đảm bảo chất lượng.', 84000, 72000, 1, 1000, 875, 1)
INSERT [dbo].[Products] ([ProductID], [ShopID], [CategoryID], [ProductName], [Brand], [Origin], [Images1], [Describe], [OldPrice], [CurrentPrice], [QuantityPerUnit], [UnitInstock], [UnitOnOrder], [IsContinued]) VALUES (55, N'dung                                              ', 4, N'xiaomi Curved Gaming Monitor Mi Surface 34" 21:9 Gaming WQHD 2K', N'xiaomi ', N'Trung Quốc', N'https://cf.shopee.vn/file/aba0afbee0f5f2962e8c35e177899228', N'Mô tả sản phẩm
Chào mừng Anh/ Chị đến cửa hàng Brand Home
4 cam kết lợi ích khi chọn mua sản phẩm ở cửa hàng:
1. Cam kết hàng chính hãng 100%.
2. Cam kết mang đến dịch vụ chăm sóc khách hàng tốt nhất.
3. Cam kết giao hàng nhanh & chất lượng.
4. Cam kết áp dụng chính sách bảo hành sản phẩm.
- Phiên bản nội địa Trung - Ngôn ngữ mặc định: Tiếng Trung, hỗ trợ cài đặt tiếng Anh, đi kèm dây 3 chấu và sách hướng dẫn sử dụng tiếng Trung
- Góc nhìn toàn cảnh siêu rộng 21:9 - Giao diện chơi game cho tầm nhìn rộng hơn 30% so với màn hình 16:9 tiêu chuẩn, mang lại trải ngiệm tuyệt vời.
- Độ nét siêu cao, độ sáng cao, độ tương phản cao - Độ phân giải 3440 x 1440 độ phân giải UHD siêu cao cho thấy chi tiết chân thực, màu sắc rõ nét ở mọi góc nhìn mang đến thế giới trò chơi ngoạn mục và sống động.
- Màn hình siêu cong 1500R - Màn hình cong tạo góc nhìn nghiêng nhỏ hơn, khoảng cahs từ mọi điểm trên màn hình đến mắt gần như bằng nhau, giúp giảm biến dạng hình ảnh và cho bạn góc nhìn chân thực hơn từ mọi góc độ.
- Tốc độ làm mới cao 144Hz - Tần số quét 144hz cao và thời gian phản hồi 4ms giúp giảm hiện tượng giật hình và bóng ma trong các trò chơi một cách hiệu quả.
- Công nghệ AMD FreeSync Premium - Công nghệ AMD GFreeSync Premium giúp hình ảnh luôn đồng bộ với đầu vào và tốc độ khung hình cao, giảm tình trạng gián đoạn, sọc màn hình và xé hình khi chơi game, mang đến hình ảnh mượt mà hơn giúp bạn giành được lợi thế.
- Giảm ánh sáng xanh - Bảo vệ đôi mắt của bạn, đồng thời giảm căng thẳng cho mắt một cách hiệu quả
- Điều chỉnh độ nghiêng, cao - Giá gắn tường và chân đế xoay có thể điều chienhr độ cao/ độ nghiêng, đáp ứng nhiều nhu cầu khác nhau. 
Thông số kĩ thuật:
- Độ phân giải: 3440 x 1440
- Màn hình: 21:9
- Độ cong màn hình: 1500R
- Tốc độ làm mới: 144Hz
- Thời gian phản hồi: 4ms
- Gam màu: 85% NTSC 
- Màu sắc: 16.7 triệu (8 bit)
- Tỷ lệ tương phản: 3000:1
- Độ sáng: 300cd/m2
Danh sách đóng gói:
- 1 x Thân màn hình chính
- 1 x Đế
- 1 x Giá đỡ
- 1 x Dây nguồn
- 1 x Cáp DP
- 1 x Vít neo
- 4 x Ốc vít gắn tường
- 4 x Bu lông gắn tường
- 1 x Sổ tay hướng dẫn', 13000000, 9000000, 1, 200, 100, 1)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Shippers] ON 

INSERT [dbo].[Shippers] ([ShipperID], [CompanyID], [name], [dob], [City], [Address], [PostalCode], [Phone]) VALUES (1, 1, N'Đoàn Huy Thái', CAST(N'1999-08-09' AS Date), N'Hải Phòng', N'Số 7, thị trấn An Dương, huyện An Dương, thành phố Hải Phòng', N'16', N'0912457248')
INSERT [dbo].[Shippers] ([ShipperID], [CompanyID], [name], [dob], [City], [Address], [PostalCode], [Phone]) VALUES (2, 1, N'	
Phạm Đăng Khoa', CAST(N'1999-12-09' AS Date), N'Hà Nội', N'Khu 5 Hạ Lũng, phường Đằng Hải, quận Hải An, thành phố Hà Nội', N'30', N'0368752982')
INSERT [dbo].[Shippers] ([ShipperID], [CompanyID], [name], [dob], [City], [Address], [PostalCode], [Phone]) VALUES (3, 2, N'Lê Quang Hòa', CAST(N'1990-08-12' AS Date), N'Hồ Chí Minh', N'Đường 353 Nguyễn Hữu Cầu, phường Ngọc Xuyên,Q2 tp.HCM', N'51', N'0725681428')
INSERT [dbo].[Shippers] ([ShipperID], [CompanyID], [name], [dob], [City], [Address], [PostalCode], [Phone]) VALUES (4, 2, N'Trịnh Văn Diễn', CAST(N'1985-04-12' AS Date), N'Đà Nẵng', N'Góc đường Hùng Vương - Ông ích Kiêm, Phường Hải Châu 2,thành phố Đà Nẵng', N'23', N'0984247847')
INSERT [dbo].[Shippers] ([ShipperID], [CompanyID], [name], [dob], [City], [Address], [PostalCode], [Phone]) VALUES (5, 2, N'	
Nguyễn Văn Thơ', CAST(N'1976-12-10' AS Date), N'Thanh Hóa', N'80 Dương Đình Nghệ, P. Tân Sơn, TP Thanh Hóa', N'36', N'02373851255')
SET IDENTITY_INSERT [dbo].[Shippers] OFF
GO
SET IDENTITY_INSERT [dbo].[Shipping Company] ON 

INSERT [dbo].[Shipping Company] ([CompanyID], [CompanyName], [Phone], [Avartar]) VALUES (1, N'Giao Hàng tiết kiệm', 18001061, N'https://vinawebsite.vn/wp-content/uploads/2019/12/Giaohangtietkiem.jpg')
INSERT [dbo].[Shipping Company] ([CompanyID], [CompanyName], [Phone], [Avartar]) VALUES (2, N'ViettelPost', 19008095, N'https://viettelpost.com.vn/wp-content/uploads/2020/09/viettel-post-tong-cong-ty-co-phan-buu-chinh-viettel.png')
INSERT [dbo].[Shipping Company] ([CompanyID], [CompanyName], [Phone], [Avartar]) VALUES (3, N'J&T Express 
', 19001088, N'data:image/jpeg;base64,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')
SET IDENTITY_INSERT [dbo].[Shipping Company] OFF
GO
INSERT [dbo].[Shops] ([UserName], [ShopName], [City], [Address], [Phone], [avartar]) VALUES (N'1', N'Shop quần áo 1', N'Hải Phòng', N'Hải Phòng', N'123', NULL)
INSERT [dbo].[Shops] ([UserName], [ShopName], [City], [Address], [Phone], [avartar]) VALUES (N'2', N'Shop Bàn Phím', N'Hà Nội', N'Hà Nội', N'1234', NULL)
INSERT [dbo].[Shops] ([UserName], [ShopName], [City], [Address], [Phone], [avartar]) VALUES (N'dung                                              ', N'Shop Nam', N'Hải Phòng', N'Hải Phòng', N'12345', NULL)
GO
ALTER TABLE [dbo].[Order Details] ADD  CONSTRAINT [df_satus]  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ((0)) FOR [discount]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK__Customers__UserI__38996AB5] FOREIGN KEY([UserName])
REFERENCES [dbo].[Account] ([UserName])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK__Customers__UserI__38996AB5]
GO
ALTER TABLE [dbo].[Images]  WITH CHECK ADD  CONSTRAINT [FK__Images__ProductI__4E88ABD4] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Images] CHECK CONSTRAINT [FK__Images__ProductI__4E88ABD4]
GO
ALTER TABLE [dbo].[Images]  WITH CHECK ADD  CONSTRAINT [FK__Images__UserID__4F7CD00D] FOREIGN KEY([UserID])
REFERENCES [dbo].[Shops] ([UserName])
GO
ALTER TABLE [dbo].[Images] CHECK CONSTRAINT [FK__Images__UserID__4F7CD00D]
GO
ALTER TABLE [dbo].[Order Details]  WITH CHECK ADD  CONSTRAINT [FK__Order Det__Order__70DDC3D8] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[Order Details] CHECK CONSTRAINT [FK__Order Det__Order__70DDC3D8]
GO
ALTER TABLE [dbo].[Order Details]  WITH CHECK ADD  CONSTRAINT [FK__Order Det__Produ__71D1E811] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Order Details] CHECK CONSTRAINT [FK__Order Det__Produ__71D1E811]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK__Orders__Customer__6D0D32F4] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([UserName])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK__Orders__Customer__6D0D32F4]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK__Orders__Shipperv__6E01572D] FOREIGN KEY([Shippervia])
REFERENCES [dbo].[Shipping Company] ([CompanyID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK__Orders__Shipperv__6E01572D]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK__Products__Catego__4BAC3F29] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK__Products__Catego__4BAC3F29]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK__Products__ShopID__4AB81AF0] FOREIGN KEY([ShopID])
REFERENCES [dbo].[Shops] ([UserName])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK__Products__ShopID__4AB81AF0]
GO
ALTER TABLE [dbo].[Shippers]  WITH CHECK ADD  CONSTRAINT [FK__Shippers__Compan__6A30C649] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Shipping Company] ([CompanyID])
GO
ALTER TABLE [dbo].[Shippers] CHECK CONSTRAINT [FK__Shippers__Compan__6A30C649]
GO
ALTER TABLE [dbo].[Shops]  WITH CHECK ADD  CONSTRAINT [FK__Shops__UserID__45F365D3] FOREIGN KEY([UserName])
REFERENCES [dbo].[Account] ([UserName])
GO
ALTER TABLE [dbo].[Shops] CHECK CONSTRAINT [FK__Shops__UserID__45F365D3]
GO
USE [master]
GO
ALTER DATABASE [Shop] SET  READ_WRITE 
GO
