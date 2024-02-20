<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductOrder.aspx.cs" Inherits="CRUD_Powell.ProductOrder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div id="customer">
            Who are you?<br />
            <br />
            First Name:<input id="txtFirstName" type="text" value="Your_FirstName" /><br />
            Last Name: <input id="txtLastName" type="text" value="Your Last Name" /><br />
            City:      <input id="txtCity" type="text" value="Chehalis" /><br />
            Country:   <input id="txtCountry" type="text" value="USA" /><br />
            Phone      <input id="txtPhone" type="text" value="(360) 555-1234" /><br />

        </div>
        <hr />
        <div id="ProductList">
            Product List
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="GourmetShop" OnItemCommand="Repeater1_ItemCommand">

                <HeaderTemplate>
                    <div id="Header">

                    </div>

                </HeaderTemplate>
                <ItemTemplate>

                </ItemTemplate>

                <FooterTemplate>

                </FooterTemplate>

            </asp:Repeater>



            <asp:SqlDataSource ID="GourmetShop" runat="server" ConnectionString="<%$ ConnectionStrings:GourmetShopConnectionString %>" ProviderName="<%$ ConnectionStrings:GourmetShopConnectionString.ProviderName %>" SelectCommand="ProductList_Powell" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

        </div>
    </form>
</body>
</html>
