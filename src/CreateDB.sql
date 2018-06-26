USE [master]
GO

/****** Object:  Database [BookstoreManagement]    Script Date: 5/23/2018 4:12:51 PM ******/
CREATE DATABASE [BookstoreManagement]
 CONTAINMENT = NONE
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookstoreManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookstoreManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookstoreManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookstoreManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookstoreManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookstoreManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookstoreManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BookstoreManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookstoreManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookstoreManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookstoreManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookstoreManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookstoreManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookstoreManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookstoreManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookstoreManagement] SET    DISABLE_BROKER 
GO
ALTER DATABASE [BookstoreManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookstoreManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookstoreManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookstoreManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookstoreManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookstoreManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BookstoreManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookstoreManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BookstoreManagement] SET MULTI_USER 
GO
ALTER DATABASE [BookstoreManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookstoreManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BookstoreManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BookstoreManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BookstoreManagement] SET DELAYED_DURABILITY = DISABLED 
GO
USE [BookstoreManagement]
GO

/****** Object:  Table [dbo].[Parameter]    Script Date: 6/3/2018 11:39:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parameter](
	[MinImportQuanity] [int] NULL,
	[MinStockBeforeImport] [int] NULL,
	[MinStockAfterSales] [int] NULL,
	[MaxDebt] [int] NULL,
	[UseRegulation] [bit] NULL
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Author]    Script Date: 6/3/2018 11:36:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Author](
	[ID] [nvarchar](20) NOT NULL,
	[Name] [nvarchar](30) NULL,
 CONSTRAINT [PK_Author] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[BookCategory]    Script Date: 6/3/2018 11:37:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookCategory](
	[ID] [nvarchar](20) NOT NULL,
	[Name] [nvarchar](30) NULL,
 CONSTRAINT [PK_BookCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Book]    Script Date: 6/3/2018 11:38:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[ID] [nvarchar](20) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[AuthorID] [nvarchar](20) NULL,
	[BookCategoryID] [nvarchar](20) NULL,
	[Stock] [int] NULL,
	[Price] [int] NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_Author] FOREIGN KEY([AuthorID])
REFERENCES [dbo].[Author] ([ID])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_Author]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_BookCategory] FOREIGN KEY([BookCategoryID])
REFERENCES [dbo].[BookCategory] ([ID])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_BookCategory]
GO

/****** Object:  Table [dbo].[StockReport]    Script Date: 6/3/2018 11:41:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockReport](
	[ID] [nvarchar](20) NOT NULL,
	/*
	[Month] [int] NULL,
	[Year] [int] NULL,
	*/
	[DateReport] [smalldatetime] NULL,
 CONSTRAINT [PK_StockReport] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[StockReportDetail]    Script Date: 6/3/2018 11:41:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockReportDetail](
	[ID] [nvarchar](20) NOT NULL,
	[StockReportID] [nvarchar](10) NULL,
	[BookID] [nvarchar](20) NULL,
	[OpeningStock] [int] NULL,
	[NewStock] [int] NULL,
	[ClosingStock] [int] NULL,
 CONSTRAINT [PK_StockReportDetail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[StockReportDetail]  WITH CHECK ADD  CONSTRAINT [FK_StockReportDetail_Book] FOREIGN KEY([BookID])
REFERENCES [dbo].[Book] ([ID])
GO
ALTER TABLE [dbo].[StockReportDetail] CHECK CONSTRAINT [FK_StockReportDetail_Book]
GO
ALTER TABLE [dbo].[StockReportDetail]  WITH CHECK ADD  CONSTRAINT [FK_StockReportDetail_StockReport] FOREIGN KEY([StockReportID])
REFERENCES [dbo].[StockReport] ([ID])
GO
ALTER TABLE [dbo].[StockReportDetail] CHECK CONSTRAINT [FK_StockReportDetail_StockReport]
GO

/****** Object:  Table [dbo].[Import]    Script Date: 6/3/2018 11:43:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Import](
	[ID] [nvarchar](20) NOT NULL,
	[ImportDate] [smalldatetime] NULL,
 CONSTRAINT [PK_Import] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[ImportDetail]    Script Date: 6/3/2018 11:45:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImportDetail](
	[ID] [nvarchar](20) NOT NULL,
	[ImportID] [nvarchar](20) NULL,
	[BookID] [nvarchar](20) NULL,
	[ImportAmount] [int] NULL,
	[CurrentAmount] [int] NULL,
	[ImportPrice] [int] NULL,
 CONSTRAINT [PK_ImportDetail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ImportDetail]  WITH CHECK ADD  CONSTRAINT [FK_ImportDetail_Book] FOREIGN KEY([BookID])
REFERENCES [dbo].[Book] ([ID])
GO
ALTER TABLE [dbo].[ImportDetail] CHECK CONSTRAINT [FK_ImportDetail_Book]
GO
ALTER TABLE [dbo].[ImportDetail]  WITH CHECK ADD  CONSTRAINT [FK_ImportDetail_Import] FOREIGN KEY([ImportID])
REFERENCES [dbo].[Import] ([ID])
GO
ALTER TABLE [dbo].[ImportDetail] CHECK CONSTRAINT [FK_ImportDetail_Import]
GO

/****** Object:  Table [dbo].[Customer]    Script Date: 6/3/2018 11:46:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[ID] [nvarchar](20) NOT NULL,
	[Name] [nvarchar](30) NULL,
	[Address] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[PhoneNumber] [nvarchar](20) NULL,
	[CurrentDebt] [int] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[DebtReport]    Script Date: 6/3/2018 11:46:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DebtReport](
	[ID] [nvarchar](20) NOT NULL,
	/*
	[Month] [int] NULL,
	[Year] [int] NULL,
	*/
	[DateReport] [smalldatetime] NULL,
 CONSTRAINT [PK_DebtReport] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[DebtReportDetail]    Script Date: 6/3/2018 11:47:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DebtReportDetail](
	[ID] [nvarchar](20) NOT NULL,
	[DebtReportID] [nvarchar](20) NULL,
	[CustomerID] [nvarchar](20) NULL,
	[OpeningDebt] [int] NULL,
	[NewDebt] [int] NULL,
	[ClosingDebt] [int] NULL,
 CONSTRAINT [PK_DebtReportDetail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DebtReportDetail]  WITH CHECK ADD  CONSTRAINT [FK_DebtReportDetail_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([ID])
GO
ALTER TABLE [dbo].[DebtReportDetail] CHECK CONSTRAINT [FK_DebtReportDetail_Customer]
GO
ALTER TABLE [dbo].[DebtReportDetail]  WITH CHECK ADD  CONSTRAINT [FK_DebtReportDetail_DebtReport] FOREIGN KEY([DebtReportID])
REFERENCES [dbo].[DebtReport] ([ID])
GO
ALTER TABLE [dbo].[DebtReportDetail] CHECK CONSTRAINT [FK_DebtReportDetail_DebtReport]
GO


/****** Object:  Table [dbo].[Receipt]    Script Date: 6/3/2018 11:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receipt](
	[ID] [nvarchar](20) NOT NULL,
	[CustomerID] [nvarchar](20) NULL,
	[DateCollect] [smalldatetime] NULL,
	[DebtBeforeCollection] [int] NULL,
	[CollectedAmount] [int] NULL,
 CONSTRAINT [PK_Receipt] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Receipt]  WITH CHECK ADD  CONSTRAINT [FK_Receipt_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([ID])
GO
ALTER TABLE [dbo].[Receipt] CHECK CONSTRAINT [FK_Receipt_Customer]
GO

/****** Object:  Table [dbo].[Invoice]    Script Date: 6/3/2018 11:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[ID] [nvarchar](20) NOT NULL,
	[CustomerID] [nvarchar](10) NULL,
	[InvoiceDate] [smalldatetime] NULL,
	[Amount] [int] NULL,
	[DebtBeforeSales] [int] NULL,
 CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([ID])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_Customer]
GO


/****** Object:  Table [dbo].[InvoiceDetail]    Script Date: 6/3/2018 11:48:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceDetail](
	[ID] [nvarchar](20) NOT NULL,
	[InvoiceID] [nvarchar](20) NULL,
	[BookID] [nvarchar](20) NULL,
	[Amount] [int] NULL,
	[StockBeforeSales] [int] NULL,
	[SalesPrice] [int] NULL,
 CONSTRAINT [PK_InvoiceDetail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InvoiceDetail]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceDetail_Book] FOREIGN KEY([BookID])
REFERENCES [dbo].[Book] ([ID])
GO
ALTER TABLE [dbo].[InvoiceDetail] CHECK CONSTRAINT [FK_InvoiceDetail_Book]
GO
ALTER TABLE [dbo].[InvoiceDetail]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceDetail_Invoice] FOREIGN KEY([InvoiceID])
REFERENCES [dbo].[Invoice] ([ID])
GO
ALTER TABLE [dbo].[InvoiceDetail] CHECK CONSTRAINT [FK_InvoiceDetail_Invoice]
GO


/****** Insert Testing data ******/
USE [BookstoreManagement]
GO

INSERT INTO [dbo].[Author]
           ([ID]
           ,[Name])
     VALUES
           ('AUTHOR001'
           ,'Testing Author')
GO

INSERT INTO [dbo].[Author]
           ([ID]
           ,[Name])
     VALUES
           ('AUTHOR002'
           ,'Testing Author 2')
GO

INSERT INTO [dbo].[Author]
           ([ID]
           ,[Name])
     VALUES
           ('AUTHOR003'
           ,'Testing Author 3')
GO


USE [BookstoreManagement]
GO

INSERT INTO [dbo].[BookCategory]
           ([ID]
           ,[Name])
     VALUES
           ('CATEGORY001'
           ,'Testing Book Category')
GO

INSERT INTO [dbo].[BookCategory]
           ([ID]
           ,[Name])
     VALUES
           ('CATEGORY002'
           ,'Testing Book Category 2')
GO

INSERT INTO [dbo].[BookCategory]
           ([ID]
           ,[Name])
     VALUES
           ('CATEGORY003'
           ,'Testing Book Category 3')
GO

USE [BookstoreManagement]
GO

INSERT INTO [dbo].[Book]
           ([ID]
           ,[Name]
           ,[AuthorID]
           ,[BookCategoryID]
           ,[Stock]
           ,[Price])
     VALUES
           ('BOOK001'
           ,'Testing book'
           ,'AUTHOR001'
           ,'CATEGORY001'
           ,1000
           ,1000)
GO


INSERT INTO [dbo].[Book]
           ([ID]
           ,[Name]
           ,[AuthorID]
           ,[BookCategoryID]
           ,[Stock]
           ,[Price])
     VALUES
           ('BOOK002'
           ,'Testing book 2'
           ,'AUTHOR002'
           ,'CATEGORY002'
           ,1000
           ,1000)
GO



INSERT INTO [dbo].[Book]
           ([ID]
           ,[Name]
           ,[AuthorID]
           ,[BookCategoryID]
           ,[Stock]
           ,[Price])
     VALUES
           ('BOOK003'
           ,'Testing book 3'
           ,'AUTHOR003'
           ,'CATEGORY003'
           ,1000
           ,1000)
GO

USE [BookstoreManagement]
GO

INSERT INTO [dbo].[Import]
           ([ID]
           ,[ImportDate])
     VALUES
           ('IMPORT001'
           ,convert(datetime,'7/15/2018 00:00:00'))
GO

INSERT INTO [dbo].[Import]
           ([ID]
           ,[ImportDate])
     VALUES
           ('IMPORT002'
           ,convert(datetime,'7/20/2018 00:00:00'))
GO

USE [BookstoreManagement]
GO

INSERT INTO [dbo].[ImportDetail]
           ([ID]
           ,[ImportID]
           ,[BookID]
           ,[ImportAmount]
           ,[ImportPrice])
     VALUES
           ('IMPORTDETAIL001'
           ,'IMPORT001'
           ,'BOOK001'
           ,20
           ,900)
GO

INSERT INTO [dbo].[ImportDetail]
           ([ID]
           ,[ImportID]
           ,[BookID]
           ,[ImportAmount]
           ,[ImportPrice])
     VALUES
           ('IMPORTDETAIL002'
           ,'IMPORT001'
           ,'BOOK002'
           ,30
           ,950)
GO

INSERT INTO [dbo].[ImportDetail]
           ([ID]
           ,[ImportID]
           ,[BookID]
           ,[ImportAmount]
           ,[ImportPrice])
     VALUES
           ('IMPORTDETAIL003'
           ,'IMPORT002'
           ,'BOOK003'
           ,20
           ,800)
GO
