USE [GourmetShop]
GO

/****** Object:  StoredProcedure [dbo].[InsertCustomerAndOrder_Powell]    Script Date: 2/23/2024 10:04:38 AM ******/
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

	@CustomerID int = null OUTPUT,

	@ProductID int,
	@OrderQty int
as
begin
DECLARE 
	@OrderNumber nvarchar(10),
	@OrderID int,
	@UnitPrice decimal = 0

SET @UnitPrice = (Select UnitPrice FROM [Product] WHERE Product.ID = @ProductID)

SET @OrderNumber = CAST(FLOOR(RAND()*(10000) + 1) AS nvarchar(5)) + LEFT(@LastName,2)

BEGIN Transaction
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

SET @CustomerID = SCOPE_IDENTITY()

	INSERT INTO [Order](
		OrderDate,
		OrderNumber,
		CustomerID,
		TotalAmount)
	VALUES (
		GETDATE(),
		@OrderNumber,
		@CustomerID,
		@OrderQty * @UnitPrice)

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
COMMIT
end
GO

