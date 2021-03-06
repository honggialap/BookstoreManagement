USE [master]
GO

/****** Object:  Database [BookstoreManagement]    Script Date: 5/23/2018 4:12:51 PM ******/
CREATE DATABASE [BookstoreManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BookstoreManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.NEARSQL\MSSQL\DATA\BookstoreManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BookstoreManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.NEARSQL\MSSQL\DATA\BookstoreManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
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
ALTER DATABASE [BookstoreManagement] SET  DISABLE_BROKER 
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
ALTER DATABASE [BookstoreManagement] SET  MULTI_USER 
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
	[MinStockAfterSale] [int] NULL,
	[MaxDebt] [int] NULL,
	[ConstrantDebtCollection] [bit] NULL
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Author]    Script Date: 6/3/2018 11:36:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Author](
	[ID] [nchar](10) NOT NULL,
	[Name] [nchar](30) NULL,
 CONSTRAINT [PK_Author] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Category]    Script Date: 6/3/2018 11:37:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [nchar](10) NOT NULL,
	[Name] [nchar](30) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
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
	[ID] [nchar](10) NOT NULL,
	[Name] [nchar](50) NULL,
	[AuthorID] [nchar](10) NULL,
	[CategoryID] [nchar](10) NULL,
	[Stock] [int] NULL,
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
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([ID])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_Category]
GO

/****** Object:  Table [dbo].[StockReport]    Script Date: 6/3/2018 11:41:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockReport](
	[ID] [nchar](10) NOT NULL,
	[Month] [int] NULL,
	[Year] [int] NULL,
 CONSTRAINT [PK_StockReport] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[StockReportInfo]    Script Date: 6/3/2018 11:41:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockReportInfo](
	[ID] [nchar](10) NOT NULL,
	[StockReportID] [nchar](10) NULL,
	[BookID] [nchar](10) NULL,
	[OpeningStock] [int] NULL,
	[IncurredStock] [int] NULL,
	[ClosingStock] [int] NULL,
 CONSTRAINT [PK_StockReportInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[StockReportInfo]  WITH CHECK ADD  CONSTRAINT [FK_StockReportInfo_Book] FOREIGN KEY([BookID])
REFERENCES [dbo].[Book] ([ID])
GO
ALTER TABLE [dbo].[StockReportInfo] CHECK CONSTRAINT [FK_StockReportInfo_Book]
GO
ALTER TABLE [dbo].[StockReportInfo]  WITH CHECK ADD  CONSTRAINT [FK_StockReportInfo_StockReport] FOREIGN KEY([StockReportID])
REFERENCES [dbo].[StockReport] ([ID])
GO
ALTER TABLE [dbo].[StockReportInfo] CHECK CONSTRAINT [FK_StockReportInfo_StockReport]
GO

/****** Object:  Table [dbo].[BookImport]    Script Date: 6/3/2018 11:43:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookImport](
	[ID] [nchar](10) NOT NULL,
	[Date] [smalldatetime] NULL,
 CONSTRAINT [PK_BookImport] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[BookImportInfo]    Script Date: 6/3/2018 11:45:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookImportInfo](
	[ID] [nchar](10) NOT NULL,
	[BookImportID] [nchar](10) NULL,
	[BookID] [nchar](10) NULL,
	[Quantity] [int] NULL,
	[StockBeforeImport] [int] NULL,
	[Price] [int] NULL,
 CONSTRAINT [PK_BookImportInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BookImportInfo]  WITH CHECK ADD  CONSTRAINT [FK_BookImportInfo_Book] FOREIGN KEY([BookID])
REFERENCES [dbo].[Book] ([ID])
GO
ALTER TABLE [dbo].[BookImportInfo] CHECK CONSTRAINT [FK_BookImportInfo_Book]
GO
ALTER TABLE [dbo].[BookImportInfo]  WITH CHECK ADD  CONSTRAINT [FK_BookImportInfo_BookImport] FOREIGN KEY([BookImportID])
REFERENCES [dbo].[BookImport] ([ID])
GO
ALTER TABLE [dbo].[BookImportInfo] CHECK CONSTRAINT [FK_BookImportInfo_BookImport]
GO

/****** Object:  Table [dbo].[Customer]    Script Date: 6/3/2018 11:46:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[ID] [nchar](10) NOT NULL,
	[Name] [nchar](30) NULL,
	[Address] [nchar](50) NULL,
	[Email] [nchar](50) NULL,
	[PhoneNumber] [nchar](20) NULL,
	[Debt] [int] NULL,
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
	[ID] [nchar](10) NOT NULL,
	[Month] [int] NULL,
	[Year] [int] NULL,
 CONSTRAINT [PK_DebtReport] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[DebtReportInfo]    Script Date: 6/3/2018 11:47:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DebtReportInfo](
	[ID] [nchar](10) NOT NULL,
	[DebtReportID] [nchar](10) NULL,
	[CustomerID] [nchar](10) NULL,
	[OpeningDebt] [int] NULL,
	[IncurredDebt] [int] NULL,
	[ClosingDebt] [int] NULL,
 CONSTRAINT [PK_DebtReportInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DebtReportInfo]  WITH CHECK ADD  CONSTRAINT [FK_DebtReportInfo_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([ID])
GO
ALTER TABLE [dbo].[DebtReportInfo] CHECK CONSTRAINT [FK_DebtReportInfo_Customer]
GO
ALTER TABLE [dbo].[DebtReportInfo]  WITH CHECK ADD  CONSTRAINT [FK_DebtReportInfo_DebtReport] FOREIGN KEY([DebtReportID])
REFERENCES [dbo].[DebtReport] ([ID])
GO
ALTER TABLE [dbo].[DebtReportInfo] CHECK CONSTRAINT [FK_DebtReportInfo_DebtReport]
GO


/****** Object:  Table [dbo].[DebtCollectReceipt]    Script Date: 6/3/2018 11:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DebtCollectReceipt](
	[ID] [nchar](10) NOT NULL,
	[CustomerID] [nchar](10) NULL,
	[Date] [smalldatetime] NULL,
	[DebtBeforeCollection] [int] NULL,
	[Amount] [int] NULL,
 CONSTRAINT [PK_DebtCollectReceipt] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DebtCollectReceipt]  WITH CHECK ADD  CONSTRAINT [FK_DebtCollectReceipt_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([ID])
GO
ALTER TABLE [dbo].[DebtCollectReceipt] CHECK CONSTRAINT [FK_DebtCollectReceipt_Customer]
GO

/****** Object:  Table [dbo].[Invoice]    Script Date: 6/3/2018 11:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[ID] [nchar](10) NOT NULL,
	[CustomerID] [nchar](10) NULL,
	[Date] [smalldatetime] NULL,
	[Value] [int] NULL,
	[DebtBeforeSale] [int] NULL,
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


/****** Object:  Table [dbo].[InvoiceInfo]    Script Date: 6/3/2018 11:48:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceInfo](
	[ID] [nchar](10) NOT NULL,
	[InvoiceID] [nchar](10) NULL,
	[BookID] [nchar](10) NULL,
	[Quantity] [int] NULL,
	[StockBeforeSale] [int] NULL,
	[Price] [int] NULL,
 CONSTRAINT [PK_InvoiceInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InvoiceInfo]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceInfo_Book] FOREIGN KEY([BookID])
REFERENCES [dbo].[Book] ([ID])
GO
ALTER TABLE [dbo].[InvoiceInfo] CHECK CONSTRAINT [FK_InvoiceInfo_Book]
GO
ALTER TABLE [dbo].[InvoiceInfo]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceInfo_Invoice] FOREIGN KEY([InvoiceID])
REFERENCES [dbo].[Invoice] ([ID])
GO
ALTER TABLE [dbo].[InvoiceInfo] CHECK CONSTRAINT [FK_InvoiceInfo_Invoice]
GO

