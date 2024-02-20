USE [GourmetShop]
GO

/****** Object:  StoredProcedure [dbo].[ProductList_Powell]    Script Date: 2/19/2024 8:49:32 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[ProductList_Powell]
as
begin
	select Product.Id, Product.ProductName, Product.UnitPrice, Product.Package
	from Product
	Where IsDiscontinued = 'False'
end
GO

