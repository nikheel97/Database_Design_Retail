/****** Object:  Database [Blr5] ******/
CREATE DATABASE [Blr5]
 
/****** Object:  UserDefinedFunction [dbo].[Experience]    ******/

CREATE FUNCTION [dbo].[Experience] (@EMpId int)
RETURNS int
as begin
Declare @g float
Declare @Num date
DECLARE @date float
Select @Num=HiredDate from Employee where EmpId=@EMpId 
select @date=(convert(char(8), getdate(), 112)/10000)
Select @g=(Convert(Char(8),@Num,112)/10000) 
return ((@date-@g))  
END
GO

/****** Object:  Table [dbo].[Employee]     ******/

CREATE TABLE [dbo].[Employee](
	[EmpID] [float] NOT NULL,
	[First Name] [nvarchar](255) NULL,
	[Last Name] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[Contact] [float] NULL,
	[StoreID] [float] NOT NULL,
	[Status] [nvarchar](255) NULL,
	[HiredDate] [nvarchar](255) NULL,
	[Full Name]  AS (([First Name]+' ')+[Last Name]) PERSISTED,
 CONSTRAINT [PK_EmpID] PRIMARY KEY CLUSTERED 
(
	[EmpID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Customer]     ******/

CREATE TABLE [dbo].[Customer](
	[CustomerID] [float] NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Contact] [float] NULL,
	[Country] [nvarchar](255) NULL,
 CONSTRAINT [PK_CustomerID] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoice]     ******/

CREATE TABLE [dbo].[Invoice](
	[InvoiceID] [float] NOT NULL,
	[PaymentType] [nvarchar](255) NULL,
	[Date] [datetime] NULL,
	[Price] [float] NULL,
	[OrderID] [float] NOT NULL,
	[CustomerID] [float] NOT NULL,
 CONSTRAINT [PK_InvoiceID] PRIMARY KEY CLUSTERED 
(
	[InvoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Order]     ******/

CREATE TABLE [dbo].[Order](
	[OrderID] [float] NOT NULL,
	[Date] [datetime] NULL,
	[Quantity] [float] NULL,
	[CustomerID] [float] NOT NULL,
	[ProductID] [float] NOT NULL,
 CONSTRAINT [PK_OrderID] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Manufacturer]     ******/

CREATE TABLE [dbo].[Manufacturer](
	[ManufacturerID] [float] NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Location] [nvarchar](255) NULL,
	[ProductID] [float] NOT NULL,
 CONSTRAINT [PK_ManufacturerID] PRIMARY KEY CLUSTERED 
(
	[ManufacturerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Product]     ******/

CREATE TABLE [dbo].[Product](
	[ProductID] [float] NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Type] [nvarchar](255) NULL,
 CONSTRAINT [PK_ProductID] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipment]     ******/

CREATE TABLE [dbo].[Shipment](
	[ManufacturerID] [float] NOT NULL,
	[DistributorID] [float] NOT NULL,
	[Company] [nvarchar](255) NULL,
	[Date] [datetime] NULL
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Distributes]     ******/

CREATE TABLE [dbo].[Distributes](
	[DistributorID] [float] NOT NULL,
	[StoreID] [float] NOT NULL,
	[Date] [datetime] NULL,
	[Quantity] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Distributor]     ******/

CREATE TABLE [dbo].[Distributor](
	[DistributorID] [float] NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Location] [nvarchar](255) NULL,
 CONSTRAINT [PK_DistributorID] PRIMARY KEY CLUSTERED 
(
	[DistributorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empaudit]     ******/

CREATE TABLE [dbo].[Empaudit](
	[EmpID] [float] NOT NULL,
	[First Name] [nvarchar](255) NULL,
	[Last Name] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[Contact] [float] NULL,
	[StoreID] [float] NOT NULL,
	[Status] [nvarchar](255) NULL,
	[HiredDate] [nvarchar](255) NULL,
	[Action] [nvarchar](255) NULL,
	[ActionDate] [datetime] NULL,
 CONSTRAINT [PK3_EmpID] PRIMARY KEY CLUSTERED 
(
	[EmpID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stock]     ******/

CREATE TABLE [dbo].[Stock](
	[ProductID] [float] NOT NULL,
	[StoreID] [float] NOT NULL,
	[Quantity] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Store]     ******/

CREATE TABLE [dbo].[Store](
	[StoreID] [float] NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Location] [nvarchar](255) NULL,
	[CustomerID] [float] NOT NULL,
 CONSTRAINT [PK_StoreID] PRIMARY KEY CLUSTERED 
(
	[StoreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]     ******/

CREATE TABLE [dbo].[Supplier](
	[SupplierID] [float] NOT NULL,
	[ManufacturerID] [float] NOT NULL,
	[Name] [nvarchar](255) NULL,
 CONSTRAINT [PK_SupplierID] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplies]     ******/

CREATE TABLE [dbo].[Supplies](
	[ManufacturerID] [float] NOT NULL,
	[SupplierID] [float] NOT NULL,
	[SuppliedQuant] [float] NULL,
	[Date] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO

/****** Altering table to add foreign key     ******/

ALTER TABLE [dbo].[Distributes]  WITH CHECK ADD  CONSTRAINT [FK1_DistributorID] FOREIGN KEY([DistributorID])
REFERENCES [dbo].[Distributor] ([DistributorID])
GO
ALTER TABLE [dbo].[Distributes] CHECK CONSTRAINT [FK1_DistributorID]
GO
ALTER TABLE [dbo].[Distributes]  WITH CHECK ADD  CONSTRAINT [FK2_StoreID] FOREIGN KEY([StoreID])
REFERENCES [dbo].[Store] ([StoreID])
GO
ALTER TABLE [dbo].[Distributes] CHECK CONSTRAINT [FK2_StoreID]
GO
ALTER TABLE [dbo].[Empaudit]  WITH CHECK ADD  CONSTRAINT [FK4_StoreID] FOREIGN KEY([StoreID])
REFERENCES [dbo].[Store] ([StoreID])
GO
ALTER TABLE [dbo].[Empaudit] CHECK CONSTRAINT [FK4_StoreID]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_StoreID] FOREIGN KEY([StoreID])
REFERENCES [dbo].[Store] ([StoreID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_StoreID]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK1_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK1_OrderID]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK2_CustomerID] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK2_CustomerID]
GO
ALTER TABLE [dbo].[Manufacturer]  WITH CHECK ADD  CONSTRAINT [FK_ProductID] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Manufacturer] CHECK CONSTRAINT [FK_ProductID]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK1_CustomerID] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK1_CustomerID]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK2_ProductID] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK2_ProductID]
GO
ALTER TABLE [dbo].[Shipment]  WITH CHECK ADD  CONSTRAINT [FK1_ManufacturerID] FOREIGN KEY([ManufacturerID])
REFERENCES [dbo].[Manufacturer] ([ManufacturerID])
GO
ALTER TABLE [dbo].[Shipment] CHECK CONSTRAINT [FK1_ManufacturerID]
GO
ALTER TABLE [dbo].[Shipment]  WITH CHECK ADD  CONSTRAINT [FK2_DistributorID] FOREIGN KEY([DistributorID])
REFERENCES [dbo].[Distributor] ([DistributorID])
GO
ALTER TABLE [dbo].[Shipment] CHECK CONSTRAINT [FK2_DistributorID]
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD  CONSTRAINT [FK1_ProductID] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [FK1_ProductID]
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD  CONSTRAINT [FK3_StoreID] FOREIGN KEY([StoreID])
REFERENCES [dbo].[Store] ([StoreID])
GO
ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [FK3_StoreID]
GO
ALTER TABLE [dbo].[Store]  WITH CHECK ADD  CONSTRAINT [FK3_CustomerID] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Store] CHECK CONSTRAINT [FK3_CustomerID]
GO
ALTER TABLE [dbo].[Supplier]  WITH CHECK ADD  CONSTRAINT [FK2_ManufacturerID] FOREIGN KEY([ManufacturerID])
REFERENCES [dbo].[Manufacturer] ([ManufacturerID])
GO
ALTER TABLE [dbo].[Supplier] CHECK CONSTRAINT [FK2_ManufacturerID]
GO
ALTER TABLE [dbo].[Supplies]  WITH CHECK ADD  CONSTRAINT [FK1_SupplierID] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([SupplierID])
GO
ALTER TABLE [dbo].[Supplies] CHECK CONSTRAINT [FK1_SupplierID]
GO
ALTER TABLE [dbo].[Supplies]  WITH CHECK ADD  CONSTRAINT [FK3_ManufacturerID] FOREIGN KEY([ManufacturerID])
REFERENCES [dbo].[Manufacturer] ([ManufacturerID])
GO
ALTER TABLE [dbo].[Supplies] CHECK CONSTRAINT [FK3_ManufacturerID]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [check_status] CHECK  (([Status]='Part-Time' OR [Status]='Full-Time'))
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [check_status]
GO

/****** Object:  StoredProcedure [dbo].[info]    ******/

CREATE proc [dbo].[info] (@Name nvarchar(255))
AS BEGIN
select I.CustomerID, C.[Name], I.PaymentType, I.Price
from Invoice I JOIN Customer C
ON I.CustomerID = C.CustomerID
where C.[Name] = @Name 
END
GO

/****** Object:  StoredProcedure [dbo].[MaxQuant]    ******/

create proc [dbo].[MaxQuant]
AS Declare @MAXQ int 
BEGIN 
select @MAXQ = max(Quantity)
from [Order]
select C.CustomerID, C.[Name], O.Quantity
from Customer C Join [Order] O on C.CustomerID = O.CustomerID
where O.Quantity = @MAXQ
end
GO

/****** Object:  StoredProcedure [dbo].[MaxQuantity]     ******/

create proc [dbo].[MaxQuantity]
AS Declare @MAXQUANT int 
BEGIN 
select @MAXQUANT = max(Quantity)
from [Order]
select C.CustomerID, C.[Name]
from Customer C Join [Order] O on C.CustomerID = O.CustomerID
where O.Quantity = @MAXQUANT 
end
GO

/****** Object:  StoredProcedure [dbo].[productinfo]     ******/

create proc [dbo].[productinfo] (@Producttype nvarchar(255))
 as begin
 select P.[Type],M.ManufacturerID, M.[Name], M.[Location] 
 from Manufacturer M join Product P
 On M.ProductID = P.ProductID
 where P.[Type] = @Producttype
 end
GO

/****** Object:  View [dbo].[F]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[F]
AS 
SELECT [Full Name] 
FROM Employee
GO

/****** Object:  Index [IX_Empaudit_FirstName]     ******/
CREATE NONCLUSTERED INDEX [IX_Empaudit_FirstName] ON [dbo].[Empaudit]
(
	[First Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

/****** Object:  Index [IX_Order_OrderDate]     ******/
CREATE NONCLUSTERED INDEX [IX_Order_OrderDate] ON [dbo].[Order]
(
	[Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

/****** Object:  View [dbo].[product_view]     ******/

create view [dbo].[product_view]
AS
SELECT P.ProductID, P.[Name] AS Product_Name, P.[Type], M.[Name] AS Manufacturer_Name, S.Company, S.[Date]
FROM Product P JOIN Manufacturer M
ON P.ProductID = M.ProductID
JOIN Shipment S
ON
M.ManufacturerID = S.ManufacturerID
GO

/****** Object:  View [dbo].[store_view]     ******/

create view [dbo].[store_view]
AS
SELECT C.CustomerID, C.[Name], I.Price, O.Quantity, I.PaymentType, O.OrderID
FROM Invoice I JOIN [Order] O 
ON O.OrderID = I.OrderID
JOIN Customer C 
ON C.CustomerID = O.CustomerID 
GO

/****** Create trigger     ******/
Create TRIGGER History
   ON  dbo.Employee
  FOR INSERT
AS 
BEGIN
insert into dbo.Empaudit
([EmpID],[First Name],[Last Name],[Address],[Contact],[StoreID],[Status],[HiredDate],[Action],[ActionDate])
Select I.[EmpID], I.[First Name], I.[Last Name], I.[Address], I.[Contact], I.[StoreID], I.[Status], I.[HiredDate], 'I', getdate()

from inserted I
where (I.[Contact] IS NULL OR I.[Contact] = 0)
End