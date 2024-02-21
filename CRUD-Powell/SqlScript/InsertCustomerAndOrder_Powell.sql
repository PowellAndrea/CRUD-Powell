USE [GourmetShop]
GO

/****** Object:  StoredProcedure [dbo].[InsertCustomerAndOrder_Powell]    Script Date: 2/21/2024 10:32:58 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[InsertCustomerAndOrder_Powell]
	@FirstName NVARCHAR(50),
	@LastName NVARCHAR(50),
	@City NVARCHAR(20) = null,
	@Country NVARCHAR(20) = null,
	@Phone NVARCHAR(20) = null,
	@ProductID int,
	@OrderQty int,
	@UnitPrice float
as
begin
DECLARE 
	@CustomerID int,
	@OrderNumber nvarchar(10),
	@OrderID int

Set @OrderNumber = CAST(FLOOR(RAND()*(1000) + 1) AS nvarchar(4)) + LEFT(@LastName,2)

INSERT INTO dbo.Customer(
	FirstName,
	LastName,
	City,
	Country,
	Phone)
VALUES (
	@FirstName,
	@LastName,
	@City,
	@Country,
	@Phone)

SET @CustomerID = SCOPE_IDENTITY();

INSERT INTO [Order](
	OrderDate,
	OrderNumber,
	CustomerID,
	TotalAmount)
VALUES (
	GETDATE(),
	@OrderNumber,
	@CustomerID,
	@OrderQty * @OrderQty)

SET @OrderID = SCOPE_IDENTITY();

INSERT INTO [OrderItem](
	OrderId,
	ProductId,
	UnitPrice,
	Quantity
	)
VALUES(
	@OrderID,
	@ProductID,
	@UnitPrice,
	@OrderQty
	)

end
GO

