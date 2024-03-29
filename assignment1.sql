USE [master]
GO
/****** Object:  Database [Assignment01_PRN231]    Script Date: 09/25/2023 11:14:56 AM ******/
CREATE DATABASE [Assignment01_PRN231]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Assignment01_PRN231', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Assignment01_PRN231.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Assignment01_PRN231_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Assignment01_PRN231_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Assignment01_PRN231] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Assignment01_PRN231].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Assignment01_PRN231] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Assignment01_PRN231] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Assignment01_PRN231] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Assignment01_PRN231] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Assignment01_PRN231] SET ARITHABORT OFF 
GO
ALTER DATABASE [Assignment01_PRN231] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Assignment01_PRN231] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Assignment01_PRN231] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Assignment01_PRN231] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Assignment01_PRN231] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Assignment01_PRN231] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Assignment01_PRN231] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Assignment01_PRN231] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Assignment01_PRN231] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Assignment01_PRN231] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Assignment01_PRN231] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Assignment01_PRN231] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Assignment01_PRN231] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Assignment01_PRN231] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Assignment01_PRN231] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Assignment01_PRN231] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Assignment01_PRN231] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Assignment01_PRN231] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Assignment01_PRN231] SET  MULTI_USER 
GO
ALTER DATABASE [Assignment01_PRN231] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Assignment01_PRN231] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Assignment01_PRN231] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Assignment01_PRN231] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Assignment01_PRN231] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Assignment01_PRN231]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 09/25/2023 11:14:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Member]    Script Date: 09/25/2023 11:14:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Member](
	[MemberId] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[CompanyName] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[Country] [nvarchar](255) NULL,
	[Password] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MemberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 09/25/2023 11:14:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NULL,
	[OrderDate] [datetime] NULL,
	[RequiredDate] [datetime] NULL,
	[ShippedDate] [datetime] NULL,
	[Freight] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 09/25/2023 11:14:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[UnitPrice] [money] NULL,
	[Quantity] [int] NULL,
	[Discount] [decimal](5, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 09/25/2023 11:14:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NULL,
	[ProductName] [nvarchar](255) NOT NULL,
	[Weight] [decimal](10, 2) NULL,
	[UnitPrice] [money] NULL,
	[UnitsInStock] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (1, N'IPhone')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (2, N'SamSung')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Member] ON 

INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (1, N'viet@gmail.com', N'Company A', N'Ha Noi', N'VietNam', N'123456')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (2, N'huy@gmail.com', N'Company B', N'Ha Noi', N'Viet Nam', N'1234567')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (5, N'vu@gmail.com', N'VTI', N'Hà Nội', N'Việt Nam', N'1234567')
SET IDENTITY_INSERT [dbo].[Member] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (1, 1, CAST(N'2020-02-20T00:00:00.000' AS DateTime), CAST(N'2020-02-24T00:00:00.000' AS DateTime), CAST(N'2020-02-26T00:00:00.000' AS DateTime), CAST(10.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (3, 2, CAST(N'2023-09-21T00:00:00.000' AS DateTime), CAST(N'2023-09-23T00:00:00.000' AS DateTime), CAST(N'2023-09-28T00:00:00.000' AS DateTime), CAST(40.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (1, 1, 2000.0000, 10, CAST(0.10 AS Decimal(5, 2)))
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (1, 2, 10.0000, 10, CAST(0.20 AS Decimal(5, 2)))
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (3, 1, 10.0000, 50, CAST(0.30 AS Decimal(5, 2)))
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (3, 3, 30.0000, 20, CAST(0.10 AS Decimal(5, 2)))
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitsInStock]) VALUES (1, 1, N'IPhone 15', CAST(10.00 AS Decimal(10, 2)), 2000.0000, 20)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitsInStock]) VALUES (2, 2, N'SamSung Glaxy', CAST(20.00 AS Decimal(10, 2)), 10.0000, 20)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitsInStock]) VALUES (3, 1, N'IPhone 15 Pro', CAST(10.00 AS Decimal(10, 2)), 30.0000, 10)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitsInStock]) VALUES (6, 2, N'SamSung Note 10', CAST(10.00 AS Decimal(10, 2)), 200.0000, 30)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([MemberId])
REFERENCES [dbo].[Member] ([MemberId])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
USE [master]
GO
ALTER DATABASE [Assignment01_PRN231] SET  READ_WRITE 
GO
