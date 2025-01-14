USE [master]
GO
/****** Object:  Database [DB_ProcuremtMgt]    Script Date: 29/07/2024 07:37:08 ******/
CREATE DATABASE [DB_ProcuremtMgt]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_ProcuremtMgt', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\DB_ProcuremtMgt.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DB_ProcuremtMgt_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\DB_ProcuremtMgt_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DB_ProcuremtMgt] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_ProcuremtMgt].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_ProcuremtMgt] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_ProcuremtMgt] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_ProcuremtMgt] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_ProcuremtMgt] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_ProcuremtMgt] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_ProcuremtMgt] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DB_ProcuremtMgt] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_ProcuremtMgt] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_ProcuremtMgt] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_ProcuremtMgt] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_ProcuremtMgt] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_ProcuremtMgt] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_ProcuremtMgt] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_ProcuremtMgt] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_ProcuremtMgt] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DB_ProcuremtMgt] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_ProcuremtMgt] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_ProcuremtMgt] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_ProcuremtMgt] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_ProcuremtMgt] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_ProcuremtMgt] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_ProcuremtMgt] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_ProcuremtMgt] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DB_ProcuremtMgt] SET  MULTI_USER 
GO
ALTER DATABASE [DB_ProcuremtMgt] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_ProcuremtMgt] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_ProcuremtMgt] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_ProcuremtMgt] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DB_ProcuremtMgt] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DB_ProcuremtMgt] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DB_ProcuremtMgt] SET QUERY_STORE = ON
GO
ALTER DATABASE [DB_ProcuremtMgt] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DB_ProcuremtMgt]
GO
/****** Object:  Table [dbo].[Tbl_Invoice]    Script Date: 29/07/2024 07:37:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Invoice](
	[InvoiceId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NULL,
	[InvoiceAmount] [decimal](18, 2) NULL,
	[InvoiceDescription] [varchar](max) NULL,
	[InvoiceHoldReason] [varchar](max) NULL,
	[InvoiceStatus] [varchar](50) NULL,
	[InvoiceRef] [varchar](50) NULL,
	[InvoiceDate] [datetime] NULL,
 CONSTRAINT [PK_dbo.Tbl_Invoice] PRIMARY KEY CLUSTERED 
(
	[InvoiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Orders]    Script Date: 29/07/2024 07:37:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[SupplierId] [int] NULL,
	[OrderRef] [varchar](50) NULL,
	[OrderStatus] [varchar](50) NULL,
	[OrderTotalAmount] [decimal](18, 2) NULL,
	[OrderDate] [datetime] NULL,
 CONSTRAINT [PK_dbo.Tbl_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Orders_Line]    Script Date: 29/07/2024 07:37:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Orders_Line](
	[OrderId] [int] NULL,
	[OrderLineId] [int] NULL,
	[OrderRef] [varchar](50) NULL,
	[OrderDescription] [varchar](max) NULL,
	[OrderLineAmount] [decimal](18, 2) NULL,
	[OrderDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Suppliers]    Script Date: 29/07/2024 07:37:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Suppliers](
	[SupplierId] [int] IDENTITY(1,1) NOT NULL,
	[SupplierName] [varchar](50) NULL,
	[SupplierContactAddress] [varchar](max) NULL,
	[SupplierContactEmail] [varchar](50) NULL,
	[SupplierContactName] [varchar](50) NULL,
	[SupplierContactNumber] [varchar](50) NULL,
 CONSTRAINT [PK_dbo.Tbl_Suppliers] PRIMARY KEY CLUSTERED 
(
	[SupplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[XXBCM_ORDER_MGT]    Script Date: 29/07/2024 07:37:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XXBCM_ORDER_MGT](
	[ORDER_REF] [varchar](max) NULL,
	[ORDER_DATE] [varchar](max) NULL,
	[SUPPLIER_NAME] [varchar](max) NULL,
	[SUPP_CONTACT_NAME] [varchar](max) NULL,
	[SUPP_ADDRESS] [varchar](max) NULL,
	[SUPP_CONTACT_NUMBER] [varchar](max) NULL,
	[SUPP_EMAIL] [varchar](max) NULL,
	[ORDER_TOTAL_AMOUNT] [varchar](max) NULL,
	[ORDER_DESCRIPTION] [varchar](max) NULL,
	[ORDER_STATUS] [varchar](max) NULL,
	[ORDER_LINE_AMOUNT] [varchar](max) NULL,
	[INVOICE_REFERENCE] [varchar](max) NULL,
	[INVOICE_DATE] [varchar](max) NULL,
	[INVOICE_STATUS] [varchar](max) NULL,
	[INVOICE_HOLD_REASON] [varchar](max) NULL,
	[INVOICE_AMOUNT] [varchar](max) NULL,
	[INVOICE_DESCRIPTION] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Tbl_Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Invoice_Tbl_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Tbl_Orders] ([OrderId])
GO
ALTER TABLE [dbo].[Tbl_Invoice] CHECK CONSTRAINT [FK_Tbl_Invoice_Tbl_Orders]
GO
ALTER TABLE [dbo].[Tbl_Orders]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Orders_Tbl_Suppliers] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Tbl_Suppliers] ([SupplierId])
GO
ALTER TABLE [dbo].[Tbl_Orders] CHECK CONSTRAINT [FK_Tbl_Orders_Tbl_Suppliers]
GO
ALTER TABLE [dbo].[Tbl_Orders_Line]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Orders_Line_Tbl_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Tbl_Orders] ([OrderId])
GO
ALTER TABLE [dbo].[Tbl_Orders_Line] CHECK CONSTRAINT [FK_Tbl_Orders_Line_Tbl_Orders]
GO
/****** Object:  StoredProcedure [dbo].[SP_2nd_Highest_Order]    Script Date: 29/07/2024 07:37:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_2nd_Highest_Order]
AS
BEGIN
    -- Select the 2nd highest OrderTotalAmount along with relevant details
    SELECT TOP 1 OrderTotalAmount
    FROM (
        SELECT 
            -- Extract the part after 'PO' from OrderRef as Order Reference
            LTRIM(SUBSTRING(OrderRef, CHARINDEX('PO', OrderRef) + 2, LEN(OrderRef))) AS [Order Reference],
            OrderTotalAmount,
            -- Format OrderDate as 'MMM dd yyyy'
            FORMAT(OrderDate, 'MMM dd yyyy') AS [Order Period],
            -- Convert SupplierName to upper case
            UPPER(SupplierName) AS [Supplier Name],
            -- Include Invoice Reference
            InvoiceRef AS [Invoice References],
            -- Assign a row number based on descending OrderTotalAmount
            ROW_NUMBER() OVER (ORDER BY OrderTotalAmount DESC) AS rn
        FROM Tbl_Orders a
        INNER JOIN Tbl_Suppliers b ON a.SupplierId = b.SupplierId
        INNER JOIN Tbl_Invoice c ON a.OrderId = c.OrderId
    ) AS ranked
    WHERE rn = 2;
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_Dist_Invoice]    Script Date: 29/07/2024 07:37:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Dist_Invoice]
AS
BEGIN
    -- Selecting distinct invoice data with supplier and order details
    SELECT DISTINCT
        -- Splitting OrderRef to extract the part after 'PO'
        LTRIM(SUBSTRING(b.OrderRef, CHARINDEX('PO', b.OrderRef) + 2, LEN(b.OrderRef))) AS [Order Reference],
        FORMAT(b.OrderDate, 'MMM-yyyy') AS [Order Period], 
        -- Converting SupplierName to sentence case
        CONCAT(UPPER(LEFT(a.SupplierName, 1)), LOWER(SUBSTRING(a.SupplierName, 2, LEN(a.SupplierName)))) AS [Supplier Name],
        -- Ensuring OrderTotalAmount and InvoiceAmount are in number format
        CAST(b.OrderTotalAmount AS DECIMAL(18, 2)) AS [Order Total Amount],
        b.OrderStatus AS [Order Status],
        c.InvoiceRef AS [Invoice Reference],
        CAST(c.InvoiceAmount AS DECIMAL(18, 2)) AS [Invoice Total Amount],
        -- Setting Action based on InvoiceStatus
        CASE
            WHEN c.InvoiceStatus = 'Pending' THEN 'To follow up'
            WHEN c.InvoiceStatus = '' OR c.InvoiceStatus IS NULL THEN 'To verify'
            ELSE 'OK'
        END AS [Action]
    FROM Tbl_Suppliers a
    INNER JOIN Tbl_Orders b ON a.SupplierId = b.SupplierId
    INNER JOIN Tbl_Invoice c ON b.OrderId = c.OrderId
    -- Ensure distinctness at the end to correctly aggregate and determine Action
    GROUP BY
        LTRIM(SUBSTRING(b.OrderRef, CHARINDEX('PO', b.OrderRef) + 2, LEN(b.OrderRef))),
        FORMAT(b.OrderDate, 'MMM-yyyy'),
        CONCAT(UPPER(LEFT(a.SupplierName, 1)), LOWER(SUBSTRING(a.SupplierName, 2, LEN(a.SupplierName)))),
        CAST(b.OrderTotalAmount AS DECIMAL(18, 2)),
        b.OrderStatus,
        c.InvoiceRef,
        CAST(c.InvoiceAmount AS DECIMAL(18, 2)),
        CASE
            WHEN c.InvoiceStatus = 'Pending' THEN 'To follow up'
            WHEN c.InvoiceStatus = '' OR c.InvoiceStatus IS NULL THEN 'To verify'
            ELSE 'OK'
        END;
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_Dist_Supplier]    Script Date: 29/07/2024 07:37:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_Dist_Supplier]
AS
BEGIN
    -- Insert distinct supplier data from XXBCM_ORDER_MGT into Tbl_Suppliers
    INSERT INTO Tbl_Suppliers (
        SupplierName,
        SupplierContactAddress,
        SupplierContactEmail,
        SupplierContactName,
        SupplierContactNumber
    )
    SELECT DISTINCT 
        SUPPLIER_NAME,
        SUPP_ADDRESS,
        SUPP_EMAIL,
        SUPP_CONTACT_NAME,
        SUPP_CONTACT_NUMBER
    FROM [dbo].[XXBCM_ORDER_MGT]
    WHERE NOT EXISTS (
        SELECT 1
        FROM Tbl_Suppliers
        WHERE SupplierName = [dbo].[XXBCM_ORDER_MGT].SUPPLIER_NAME
          AND SupplierContactAddress =[dbo].[XXBCM_ORDER_MGT].SUPP_ADDRESS
          AND SupplierContactEmail = [dbo].[XXBCM_ORDER_MGT].SUPP_EMAIL
          AND SupplierContactName = [dbo].[XXBCM_ORDER_MGT].SUPP_CONTACT_NAME
          AND SupplierContactNumber = [dbo].[XXBCM_ORDER_MGT].SUPP_CONTACT_NUMBER
    );
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_InvoiceMgt]    Script Date: 29/07/2024 07:37:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InvoiceMgt]
AS
BEGIN
    -- Insert new invoice data into Tbl_Invoice from XXBCM_ORDER_MGT and Tbl_Orders
    INSERT INTO Tbl_Invoice (
        OrderId,
        InvoiceAmount,
        InvoiceDescription,
        InvoiceHoldReason,
        InvoiceStatus,
        InvoiceRef,
        InvoiceDate
    )
    SELECT 
        s.OrderId,
        TRY_CAST(o.INVOICE_AMOUNT AS DECIMAL(18, 2)) AS InvoiceAmount,
        o.INVOICE_DESCRIPTION,
        o.INVOICE_HOLD_REASON,
        o.INVOICE_STATUS,
        o.INVOICE_REFERENCE AS InvoiceRef,
        TRY_CAST(o.INVOICE_DATE AS DATE) AS InvoiceDate
    FROM [dbo].[XXBCM_ORDER_MGT] o
    INNER JOIN [dbo].[Tbl_Orders] s ON o.ORDER_REF = s.OrderRef
    WHERE 
        TRY_CAST(o.INVOICE_AMOUNT AS DECIMAL(18, 2)) IS NOT NULL
        AND TRY_CAST(o.INVOICE_DATE AS DATE) IS NOT NULL
        AND NOT EXISTS (
            SELECT 1
            FROM [dbo].[Tbl_Invoice] t
            WHERE t.InvoiceAmount = TRY_CAST(o.INVOICE_AMOUNT AS DECIMAL(18, 2))
              AND t.InvoiceDescription = o.INVOICE_DESCRIPTION
              AND t.InvoiceHoldReason = o.INVOICE_HOLD_REASON
              AND t.InvoiceStatus = o.INVOICE_STATUS
              AND t.InvoiceRef = o.INVOICE_REFERENCE
              AND t.InvoiceDate = TRY_CAST(o.INVOICE_DATE AS DATE)
              AND t.OrderId = s.OrderId
        );
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_No_Orders]    Script Date: 29/07/2024 07:37:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_No_Orders]
AS
BEGIN
    -- Selecting distinct invoice data with supplier and order details
    SELECT 
        SupplierName AS [Supplier Name], 
        SupplierContactName, 
        SupplierContactNumber, 
        COUNT(OrderID) AS OrderCount, 
        SUM(OrderTotalAmount) AS TotalOrderAmount
    FROM Tbl_Suppliers a 
    INNER JOIN Tbl_Orders b ON a.SupplierId = b.SupplierId
    GROUP BY 
        SupplierName, 
        SupplierContactName, 
        SupplierContactNumber;
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_OrderLineMgt]    Script Date: 29/07/2024 07:37:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[SP_OrderLineMgt]
AS
BEGIN
    -- Insert new order line data into Tbl_Orders_Line from XXBCM_ORDER_MGT and Tbl_Orders
    INSERT INTO Tbl_Orders_Line (
        OrderId,
        OrderLineId,
        OrderRef,
        OrderDescription,
        OrderLineAmount,
        OrderDate
    )
    SELECT 
        s.OrderId,
        TRY_CAST(
            (SELECT value
             FROM (
                 SELECT value,
                        ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS rn
                 FROM STRING_SPLIT(o.ORDER_REF, '-')
             ) AS split_values
             WHERE rn = 2
            ) AS INT
        ) AS OrderLineId,
        o.ORDER_REF,
        o.ORDER_DESCRIPTION,
        TRY_CAST(o.ORDER_LINE_AMOUNT AS DECIMAL(18, 2)) AS OrderLineAmount,
        TRY_CAST(o.ORDER_DATE AS DATETIME) AS OrderDate
    FROM [dbo].[XXBCM_ORDER_MGT] o
    INNER JOIN [dbo].[Tbl_Orders] s ON o.ORDER_REF = s.OrderRef
    WHERE 
        -- Ensure that OrderLineId is not NULL (i.e., conversion was successful)
        TRY_CAST(
            (SELECT value
             FROM (
                 SELECT value,
                        ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS rn
                 FROM STRING_SPLIT(o.ORDER_REF, '-')
             ) AS split_values
             WHERE rn = 2
            ) AS INT
        ) IS NOT NULL
        AND TRY_CAST(o.ORDER_LINE_AMOUNT AS DECIMAL(18, 2)) IS NOT NULL
        AND TRY_CAST(o.ORDER_DATE AS DATETIME) IS NOT NULL
        AND NOT EXISTS (
            SELECT 1
            FROM [dbo].[Tbl_Orders_Line] t
            WHERE t.OrderRef = o.ORDER_REF
              AND t.OrderDescription = o.ORDER_DESCRIPTION
              AND t.OrderLineAmount = TRY_CAST(o.ORDER_LINE_AMOUNT AS DECIMAL(18, 2))
              AND t.OrderDate = TRY_CAST(o.ORDER_DATE AS DATETIME)
              AND t.OrderId = s.OrderId
        );
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_OrderMgt]    Script Date: 29/07/2024 07:37:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_OrderMgt]
AS
BEGIN
    -- Insert new order data into Tbl_Orders from XXBCM_ORDER_MGT and Tbl_Suppliers
    INSERT INTO Tbl_Orders (
        OrderRef,
        OrderStatus,
        OrderTotalAmount,
        OrderDate,
        SupplierId
    )
    SELECT 
        o.ORDER_REF,
        o.ORDER_STATUS,
        CAST(o.ORDER_TOTAL_AMOUNT AS DECIMAL(18, 2)) AS OrderTotalAmount,
        CAST(o.ORDER_DATE AS DATETIME) AS OrderDate,
        s.SupplierId
    FROM [dbo].[XXBCM_ORDER_MGT] o
    INNER JOIN [dbo].[Tbl_Suppliers] s ON o.SUPP_EMAIL = s.SupplierContactEmail
    WHERE NOT EXISTS (
        SELECT 1
        FROM [dbo].[Tbl_Orders] t
        WHERE t.OrderRef = o.ORDER_REF
          AND t.OrderStatus = o.ORDER_STATUS
          AND t.OrderTotalAmount = CAST(o.ORDER_TOTAL_AMOUNT AS DECIMAL(18, 2))
          AND t.OrderDate = CAST(o.ORDER_DATE AS DATETIME)
          AND t.SupplierId = s.SupplierId
    );
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_Supplier]    Script Date: 29/07/2024 07:37:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_Supplier]
    @SupplierName VARCHAR(50),
    @SupplierContactAddress TEXT,
    @SupplierContactEmail VARCHAR(50),
    @SupplierContactName VARCHAR(50),
    @SupplierContactNumber VARCHAR(50)
AS
BEGIN
    INSERT INTO Tbl_Suppliers (
        SupplierName,
        SupplierContactAddress,
        SupplierContactEmail,
        SupplierContactName,
        SupplierContactNumber
    )
    VALUES (
        @SupplierName,
        @SupplierContactAddress,
        @SupplierContactEmail,
        @SupplierContactName,
        @SupplierContactNumber
    );
END;
GO
USE [master]
GO
ALTER DATABASE [DB_ProcuremtMgt] SET  READ_WRITE 
GO
