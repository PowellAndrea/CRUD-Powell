<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductOrder.aspx.cs" Inherits="CRUD_Powell.ProductOrder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div id="customer" class="container">
            <h2>Who are you?</h2>
            First Name: <asp:TextBox ID="ctrlFirstName" runat="server" Text="Andrea" AutoPostBack="true"/><br />
            Last Name: <asp:TextBox ID="ctrlLastName" runat="server" Text="Powell" AutoPostBack="true" /><br />
            City: <asp:TextBox ID="ctrlCity" runat="server" Text="Centralia" AutoPostBack="true" /><br />
            Country: <asp:TextBox ID="ctrlCountry" runat="server" Text="USA" AutoPostBack="true" /><br />
            Phone: <asp:TextBox ID="ctrlPhone" runat="server" Text="(360)555-1234" AutoPostBack="true" /><br />
            </div>
        <H3>
            Order Quantity and Product
        </H3>
            Quantity: <asp:TextBox ID = "ctrlQuantity" runat = "server" Visible="true" Width="50px" Text=0 TextMode = "Number" />

            <asp:DropDownList ID="ctrlProduct"
                runat="server" 
                AutoPostBack="True" 
                DataSourceID="GourmetShop" 
                DataTextField = "ProductName"  
                DataValueField="Id"/>

        <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Order Now" />
                    <asp:SqlDataSource ID="GourmetShop" runat="server" ConnectionString="<%$ ConnectionStrings:GourmetShopConnectionString %>" ProviderName="<%$ ConnectionStrings:GourmetShopConnectionString.ProviderName %>" SelectCommand="ProductList_Powell" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

    </form>


</body>
</html>
