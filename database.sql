USE [master]
GO
/****** Object:  Database [WorkShop1]    Script Date: 10/11/2018 8:20:44 CH ******/
CREATE DATABASE [WorkShop1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WorkShop1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\WorkShop1.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'WorkShop1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\WorkShop1_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [WorkShop1] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WorkShop1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WorkShop1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WorkShop1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WorkShop1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WorkShop1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WorkShop1] SET ARITHABORT OFF 
GO
ALTER DATABASE [WorkShop1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WorkShop1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WorkShop1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WorkShop1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WorkShop1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WorkShop1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WorkShop1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WorkShop1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WorkShop1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WorkShop1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WorkShop1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WorkShop1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WorkShop1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WorkShop1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WorkShop1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WorkShop1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WorkShop1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WorkShop1] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WorkShop1] SET  MULTI_USER 
GO
ALTER DATABASE [WorkShop1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WorkShop1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WorkShop1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WorkShop1] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [WorkShop1] SET DELAYED_DURABILITY = DISABLED 
GO
USE [WorkShop1]
GO
/****** Object:  Table [dbo].[tbl_Bill]    Script Date: 10/11/2018 8:20:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Bill](
	[userId] [varchar](20) NOT NULL,
	[mobileId] [varchar](20) NOT NULL,
	[quantity] [int] NOT NULL,
	[datetime] [datetime] NOT NULL,
 CONSTRAINT [PK_Bills] PRIMARY KEY CLUSTERED 
(
	[userId] ASC,
	[mobileId] ASC,
	[datetime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Mobile]    Script Date: 10/11/2018 8:20:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Mobile](
	[mobileId] [varchar](10) NOT NULL,
	[description] [varchar](250) NULL,
	[price] [float] NOT NULL,
	[mobileName] [varchar](20) NOT NULL,
	[yearOfProduction] [int] NULL,
	[quantity] [int] NULL,
	[notSale] [bit] NULL,
 CONSTRAINT [PK_tbl_Mobile] PRIMARY KEY CLUSTERED 
(
	[mobileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_User]    Script Date: 10/11/2018 8:20:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_User](
	[userId] [varchar](20) NOT NULL,
	[password] [int] NOT NULL,
	[fullName] [nvarchar](50) NOT NULL,
	[role] [int] NULL,
 CONSTRAINT [PK_tbl_User] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tbl_Bill] ([userId], [mobileId], [quantity], [datetime]) VALUES (N'c1', N'B1', 3, CAST(N'2018-11-10 16:39:18.607' AS DateTime))
INSERT [dbo].[tbl_Bill] ([userId], [mobileId], [quantity], [datetime]) VALUES (N'c1', N'B1', 1, CAST(N'2018-11-10 20:18:25.233' AS DateTime))
INSERT [dbo].[tbl_Bill] ([userId], [mobileId], [quantity], [datetime]) VALUES (N'c1', N'B2', 4, CAST(N'2018-11-10 20:01:20.120' AS DateTime))
INSERT [dbo].[tbl_Bill] ([userId], [mobileId], [quantity], [datetime]) VALUES (N'c1', N'B2', 3, CAST(N'2018-11-10 20:18:25.233' AS DateTime))
INSERT [dbo].[tbl_Mobile] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]) VALUES (N'B1', N'B Phone 1 is made in Vietnam', 1324, N'B Phone 1', 2012, 0, 1)
INSERT [dbo].[tbl_Mobile] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]) VALUES (N'B2', N'B Phone 2 is made in Vietnam', 3456, N'B Phone 2', 2015, 0, 1)
INSERT [dbo].[tbl_Mobile] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]) VALUES (N'B3', N'B Phone 3 is made in Vietnam', 2345, N'B Phone 3', 2018, 4, 0)
INSERT [dbo].[tbl_Mobile] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]) VALUES (N'B4', N'B Phone 4', 123, N'B Phone 4', 2020, 11, 0)
INSERT [dbo].[tbl_Mobile] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]) VALUES (N'H2', N'HTC U12', 12345, N'HTC U12', 2019, 5, 0)
INSERT [dbo].[tbl_Mobile] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]) VALUES (N'IP2', N'I Phone 2', 1234, N'I Phone 2', 2014, 5, 0)
INSERT [dbo].[tbl_Mobile] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]) VALUES (N'IP3', N'I Phone 3', 1234, N'I Phone 3', 2010, 1, 0)
INSERT [dbo].[tbl_Mobile] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]) VALUES (N'IP4', N'I Phone 4', 1235, N'I Phone 4', 2009, 1, 0)
INSERT [dbo].[tbl_Mobile] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]) VALUES (N'IP5', N'I Phone 5', 2345, N'I Phone 5', 2013, 2, 0)
INSERT [dbo].[tbl_Mobile] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]) VALUES (N'IP6', N'I Phone 6 is made in China', 1567, N'I Phone 6', 2017, 4, 0)
INSERT [dbo].[tbl_Mobile] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]) VALUES (N'IPX', N'I Phone X', 2300, N'I Phone X', 2018, 8, 0)
INSERT [dbo].[tbl_Mobile] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]) VALUES (N'LG1', N'LG G5', 2900, N'LG G5', 2012, 8, 0)
INSERT [dbo].[tbl_Mobile] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]) VALUES (N'MI6', N'Xiaomi 6 is made in China', 1234, N'Xiaomi 6', 2018, 3, 0)
INSERT [dbo].[tbl_Mobile] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]) VALUES (N'N1', N'Nokia Lumia 502 is made in China', 5300, N'Nokia Lumia 502', 2009, 4, 0)
INSERT [dbo].[tbl_Mobile] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]) VALUES (N'OP2', N'OPPO F4', 2415, N'OPPO F4', 2012, 1, 0)
INSERT [dbo].[tbl_Mobile] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]) VALUES (N'OP3', N'OPPO F3', 3212, N'OPPO F5', 2015, 4, 0)
INSERT [dbo].[tbl_Mobile] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]) VALUES (N'SS1', N'This mobile is made in Vietnam', 15000.9853515625, N'Samsung Galaxy S1', 2012, 5, 0)
INSERT [dbo].[tbl_Mobile] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]) VALUES (N'SS2', N'Samsung s2 Korea', 20000.5, N'Samsung Galaxy S2', 2013, 7, 0)
INSERT [dbo].[tbl_User] ([userId], [password], [fullName], [role]) VALUES (N'C1', 12345, N'Bui Quoc Khanh', 0)
INSERT [dbo].[tbl_User] ([userId], [password], [fullName], [role]) VALUES (N'M1', 12345, N'Bui Quoc Khanh', 1)
INSERT [dbo].[tbl_User] ([userId], [password], [fullName], [role]) VALUES (N'S1', 12345, N'Thien', 2)
USE [master]
GO
ALTER DATABASE [WorkShop1] SET  READ_WRITE 
GO
