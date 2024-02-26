USE [GourmetShop]
GO

/****** Object:  StoredProcedure [dbo].[NewCustomerSummary_Powell]    Script Date: 2/25/2024 7:24:49 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[NewCustomerSummary_Powell]
	@CustomerID int = 7

as
BEGIN


Select TOP 10 OrderDate, OrderNumber, ProductName, TotalAmount 
	from [Order]
	INNER JOIN OrderItem on [Order].ID = OrderItem.OrderId
	INNER JOIN Product on OrderItem.ProductId = Product.ID
	WHERE CustomerId = @CustomerID
	ORDER BY OrderDate DESC

END
GO

