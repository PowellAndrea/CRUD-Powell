<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Confirmation.aspx.cs" Inherits="CRUD_Powell.Confirmation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Welcome <asp:Label ID="lblFirstName" runat="server" ></asp:Label>.<br />
            Your customer number is
            <asp:Label ID="lblCustomerID" runat="server"  Text='<%#Eval("CustomerID") %>'></asp:Label>, 
            and your order number is
            <asp:Label ID="lblOrderNumber" runat="server" Text='<%#Eval("OrderNumber") %>'></asp:Label>.

            <H1>
                Your order of 
                <asp:Label ID="lblProductName" runat="server" Text='<%#Eval("ProductName") %>'></asp:Label>
                is on the way.
            </H1>
        </div>


        <h2>Order History</h2>
                        <asp:TextBox ID="tbOrderNumber" runat="server" />
                <asp:TextBox ID="tbOrderDate" runat="server" />
                <asp:TextBox ID="tbProductName" runat="server" />
                <asp:TextBox ID="tbTotalAmount" runat="server" />
        <asp:Repeater ID="OrderRepeater" runat="server" DataSourceID="GourmetShop">
            <ItemTemplate>

            </ItemTemplate>
        </asp:Repeater>

                    <asp:SqlDataSource ID="GourmetShop" runat="server" ConnectionString="<%$ ConnectionStrings:GourmetShopConnectionString %>" SelectCommand="NewCustomerSummary_Powell" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:Parameter Name="CustomerID" Type="Int32" />
                        </SelectParameters>
        </asp:SqlDataSource>

    </form>
</body>
</html>
