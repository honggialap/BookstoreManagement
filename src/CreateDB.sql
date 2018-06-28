USE [master]
GO

WHILE EXISTS(select NULL from sys.databases where name='BookstoreManagement')
BEGIN
    DECLARE @SQL varchar(max)
    SELECT @SQL = COALESCE(@SQL,'') + 'Kill ' + Convert(varchar, SPId) + ';'
    FROM MASTER..SysProcesses
    WHERE DBId = DB_ID(N'BookstoreManagement') AND SPId <> @@SPId
    EXEC(@SQL)
    DROP DATABASE [BookstoreManagement]
END
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
	[MinImportAmount] [int] NULL,
	[MaxStockBeforeImport] [int] NULL,
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
	[ReportDate] [smalldatetime] NULL,
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
	[StockReportID] [nvarchar](20) NULL,
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
	[ReportDate] [smalldatetime] NULL,
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
	[CollectedDate] [smalldatetime] NULL,
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
	[CustomerID] [nvarchar](20) NULL,
	[InvoiceDate] [smalldatetime] NULL,
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





/****** BM1 TESTING DATA ******/
USE [BookstoreManagement]
GO

/*****/
DECLARE @i INT = 1;
DECLARE @temp INT;
DECLARE @temp2 INT;

WHILE @i <= 10
BEGIN
  INSERT INTO [dbo].[Author]
           ([ID]
           ,[Name])
     VALUES
           (
            CONVERT(NVARCHAR,'AUTHOR') + CONVERT(NVARCHAR,FORMAT(@i,'d4'))
           ,CONVERT(NVARCHAR,'Testing Author ') + CONVERT(NVARCHAR,@i)
           )

  SET @i = @i + 1;
END


/*****/
SET @i = 1;
WHILE @i <= 10
BEGIN
  INSERT INTO [dbo].[BookCategory]
           ([ID]
           ,[Name])
     VALUES
           (
            CONVERT(NVARCHAR,'CATEGORY') + CONVERT(NVARCHAR,FORMAT(@i,'d4'))
           ,CONVERT(NVARCHAR,'Testing Book Category ') + CONVERT(NVARCHAR,@i)
           )

  SET @i = @i + 1;
END


/*****/
SET @i = 1;
WHILE @i <= 20

BEGIN

IF @i % 10 = 0
SET @temp = 10
ELSE SET @temp = @i % 10

INSERT INTO [dbo].[Book]
           ([ID]
           ,[Name]
           ,[AuthorID]
           ,[BookCategoryID]
           ,[Stock]
           ,[Price])
     VALUES
           (
            CONVERT(NVARCHAR,'BOOK') + CONVERT(NVARCHAR,FORMAT(@i,'d4'))
           ,CONVERT(NVARCHAR,'Testing Book ') + CONVERT(NVARCHAR,@i)
           ,CONVERT(NVARCHAR,'AUTHOR') + CONVERT(NVARCHAR,FORMAT(@temp,'d4'))
           ,CONVERT(NVARCHAR,'CATEGORY') + CONVERT(NVARCHAR,FORMAT(@temp,'d4'))
           ,@i * 100
           ,@i * 100)
  SET @i = @i + 1;
END
GO

USE [BookstoreManagement]
GO


/*****/
DECLARE @i INT = 1;
DECLARE @temp INT;
DECLARE @temp2 INT;
SET @i = 1;
WHILE @i <= 40

BEGIN
INSERT INTO [dbo].[Import]
           ([ID]
           ,[ImportDate])
     VALUES
           (
            CONVERT(NVARCHAR,'IMPORT') + CONVERT(NVARCHAR,FORMAT(@i,'d4'))
           ,CONVERT(datetime, DATEADD(day, @i,'1/1/2018'))
           )
  SET @i = @i + 1;
END
GO


/****/
DECLARE @i INT = 1;
DECLARE @temp INT;
DECLARE @temp2 INT;
SET @i = 1;
WHILE @i <= 80

BEGIN

IF @i % 40 = 0
SET @temp = 40
ELSE SET @temp = @i % 40

IF @i % 20 = 0
SET @temp2 = 20
ELSE SET @temp2 = @i % 20

INSERT INTO [dbo].[ImportDetail]
           ([ID]
           ,[ImportID]
           ,[BookID]
           ,[ImportAmount]
           ,[ImportPrice])
     VALUES
           (
            CONVERT(NVARCHAR,'IMPORTDETAIL') + CONVERT(NVARCHAR,FORMAT(@i,'d4'))
           ,CONVERT(NVARCHAR,'IMPORT') + CONVERT(NVARCHAR,FORMAT(@temp,'d4'))
           ,CONVERT(NVARCHAR,'BOOK') + CONVERT(NVARCHAR,FORMAT(@temp2,'d4'))
           ,(@i * 2)
           ,(@i * 1000 - 300)
           )
  SET @i = @i + 1;
END
GO


INSERT INTO [dbo].[Parameter]
(
	[MinImportAmount],
	[MaxStockBeforeImport],
	[MinStockAfterSales],
	[MaxDebt],
	[UseRegulation]
)
VALUES
(
	150,
	299,
	20,
	20000,
	1
)
