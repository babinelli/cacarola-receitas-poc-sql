USE [master]
GO
/****** Object:  Database [Orders]    Script Date: 18/09/2020 09:49:53 ******/
CREATE DATABASE [Orders]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Orders', FILENAME = N'D:\APC-2020-09-FBD\OrderForm\Orders.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Orders_log', FILENAME = N'D:\APC-2020-09-FBD\OrderForm\Orders_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Orders] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Orders].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Orders] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Orders] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Orders] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Orders] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Orders] SET ARITHABORT OFF 
GO
ALTER DATABASE [Orders] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Orders] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Orders] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Orders] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Orders] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Orders] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Orders] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Orders] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Orders] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Orders] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Orders] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Orders] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Orders] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Orders] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Orders] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Orders] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Orders] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Orders] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Orders] SET  MULTI_USER 
GO
ALTER DATABASE [Orders] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Orders] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Orders] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Orders] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Orders] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Orders] SET QUERY_STORE = OFF
GO
USE [Orders]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 18/09/2020 09:49:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Category] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 18/09/2020 09:49:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[CityID] [int] IDENTITY(1,1) NOT NULL,
	[CountryID] [int] NOT NULL,
	[City] [nvarchar](70) NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 18/09/2020 09:49:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[CountryID] [int] IDENTITY(1,1) NOT NULL,
	[Country] [nvarchar](70) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 18/09/2020 09:49:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[CityID] [int] NOT NULL,
	[CustomerName] [nvarchar](100) NOT NULL,
	[CustomerAddress] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 18/09/2020 09:49:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 18/09/2020 09:49:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [decimal](7, 2) NOT NULL,
 CONSTRAINT [PK_OrderProduct] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 18/09/2020 09:49:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[ProductRef] [char](10) NOT NULL,
	[ProductName] [nvarchar](70) NOT NULL,
	[UnitPrice] [decimal](7, 2) NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [Category]) VALUES (1, N'Office')
INSERT [dbo].[Category] ([CategoryID], [Category]) VALUES (2, N'Furniture')
INSERT [dbo].[Category] ([CategoryID], [Category]) VALUES (3, N'Technology')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([CityID], [CountryID], [City]) VALUES (1, 1, N'Hong Kong')
INSERT [dbo].[City] ([CityID], [CountryID], [City]) VALUES (2, 2, N'Porto')
INSERT [dbo].[City] ([CityID], [CountryID], [City]) VALUES (3, 2, N'Vila Nova de Gaia')
SET IDENTITY_INSERT [dbo].[City] OFF
GO
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([CountryID], [Country]) VALUES (1, N'China')
INSERT [dbo].[Country] ([CountryID], [Country]) VALUES (2, N'Portugal')
SET IDENTITY_INSERT [dbo].[Country] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CustomerID], [CityID], [CustomerName], [CustomerAddress]) VALUES (1, 1, N'Billy', N'456 High Tower Street')
INSERT [dbo].[Customer] ([CustomerID], [CityID], [CustomerName], [CustomerAddress]) VALUES (2, 2, N'John', N'78 Flores Street')
INSERT [dbo].[Customer] ([CustomerID], [CityID], [CustomerName], [CustomerAddress]) VALUES (3, 3, N'Claire', N'951 Republica Avenue')
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderID], [CustomerID], [Date]) VALUES (1, 1, CAST(N'1998-04-11' AS Date))
INSERT [dbo].[Order] ([OrderID], [CustomerID], [Date]) VALUES (2, 2, CAST(N'1995-03-26' AS Date))
INSERT [dbo].[Order] ([OrderID], [CustomerID], [Date]) VALUES (3, 3, CAST(N'1996-10-02' AS Date))
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Quantity]) VALUES (1, 1, CAST(100.00 AS Decimal(7, 2)))
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Quantity]) VALUES (1, 2, CAST(200.00 AS Decimal(7, 2)))
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Quantity]) VALUES (1, 3, CAST(5.00 AS Decimal(7, 2)))
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Quantity]) VALUES (2, 2, CAST(50.00 AS Decimal(7, 2)))
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Quantity]) VALUES (2, 4, CAST(24.00 AS Decimal(7, 2)))
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Quantity]) VALUES (3, 1, CAST(75.00 AS Decimal(7, 2)))
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Quantity]) VALUES (3, 5, CAST(5.00 AS Decimal(7, 2)))
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Quantity]) VALUES (3, 6, CAST(5.00 AS Decimal(7, 2)))
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Quantity]) VALUES (3, 7, CAST(5.00 AS Decimal(7, 2)))
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Quantity]) VALUES (3, 8, CAST(5.00 AS Decimal(7, 2)))
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Quantity]) VALUES (3, 9, CAST(5.00 AS Decimal(7, 2)))
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductRef], [ProductName], [UnitPrice]) VALUES (1, 1, N'A123      ', N'Pencil', CAST(3.00 AS Decimal(7, 2)))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductRef], [ProductName], [UnitPrice]) VALUES (2, 1, N'B234      ', N'Eraser', CAST(1.50 AS Decimal(7, 2)))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductRef], [ProductName], [UnitPrice]) VALUES (3, 1, N'C345      ', N'Sharpener', CAST(8.00 AS Decimal(7, 2)))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductRef], [ProductName], [UnitPrice]) VALUES (4, 1, N'D456      ', N'Stapler', CAST(2.50 AS Decimal(7, 2)))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductRef], [ProductName], [UnitPrice]) VALUES (5, 2, N'E567      ', N'Table', CAST(120.00 AS Decimal(7, 2)))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductRef], [ProductName], [UnitPrice]) VALUES (6, 2, N'F678      ', N'Chair', CAST(70.00 AS Decimal(7, 2)))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductRef], [ProductName], [UnitPrice]) VALUES (7, 3, N'G789      ', N'Monitor', CAST(150.00 AS Decimal(7, 2)))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductRef], [ProductName], [UnitPrice]) VALUES (8, 3, N'H890      ', N'Keyboard', CAST(35.00 AS Decimal(7, 2)))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductRef], [ProductName], [UnitPrice]) VALUES (9, 3, N'I901      ', N'Mouse', CAST(10.00 AS Decimal(7, 2)))
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_City_Country]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_City] FOREIGN KEY([CityID])
REFERENCES [dbo].[City] ([CityID])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_City]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderProduct_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK_OrderProduct_Order]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderProduct_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK_OrderProduct_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
USE [master]
GO
ALTER DATABASE [Orders] SET  READ_WRITE 
GO
