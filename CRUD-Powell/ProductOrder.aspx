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
            <br />
            <table class="table">
                <tr>
                    <td>First Name:</td>
                    <td><asp:TextBox ID="ctrlFirstName" runat="server" Text="Andrea" AutoPostBack="true"/></td>
                </tr>
                <tr>
                    <td>First Name:</td>
                    <td><asp:TextBox ID="ctrlLastName" runat="server" Text="Powell" AutoPostBack="true" /></td>
                </tr>

                <tr>
                    <td>City:</td>
                    <td><asp:TextBox ID="ctrlCity" runat="server" Text="Centralia" AutoPostBack="true" /></td>
                </tr>

                <tr>
                    <td>Country:</td>
                    <td><asp:TextBox ID="ctrlCountry" runat="server" Text="USA" AutoPostBack="true" /></td>
                </tr>
                <tr>
                    <td>Phone:</td>
                    <td><asp:TextBox ID="ctrlPhone" runat="server" Text="(360)555-1234" AutoPostBack="true" /></td>
                </tr>

            </table>
            </div>
        <H3>
            Order Quantity and Product
        </H3>
            Quantity: <asp:TextBox ID = "ctrlQuantity" runat = "server" Visible="true" Width="50px" TextMode = "Number" AutoPostBack="true" />


            <asp:Label ID = "lblProductName" runat = "server" Visible="false" Text = '<%#Eval("ProductName") %>' />
            <asp:Label ID = "lblUnitPrice" runat = "server" Visible="false" Text = '<%#Eval("UnitPrice") %>' />
            <asp:Label ID = "lblProductID" runat="server" Visible="false" Text='<%#Eval("Id") %>' />
            <asp:Label ID = "lblPackage" runat = "server" Visible="false" Text = '<%#Eval("Package")%>' />


        <p>
            <asp:DropDownList ID="ctrlProduct"
                runat="server" 
                AutoPostBack="True" 
                DataSourceID="GourmetShop" 
                DataTextField = "ProductName"  
                DataValueField="Id"/>
        </p>

        <p>
            <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Order Now" />
        </p>
            <asp:SqlDataSource ID="GourmetShop" runat="server" ConnectionString="<%$ ConnectionStrings:GourmetShopConnectionString %>" ProviderName="<%$ ConnectionStrings:GourmetShopConnectionString.ProviderName %>" SelectCommand="ProductList_Powell" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

    </form>


</body>
</html>
