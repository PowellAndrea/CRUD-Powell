<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductOrder.aspx.cs" Inherits="CRUD_Powell.ProductOrder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>New Account Product Order Page</title>
</head>
<body>
    <form id="form1"
        method="post"
        runat="server">
        <div id="customer" class="container">
            <h2>Who are you?</h2>
            <br />
            <table class="table">
                <tr>
                <td>First Name:</td>
                <td><asp:TextBox ID="FirstName" runat="server" Text="Andrea3"/></td>
                </tr>

                <tr>
                    <td>First Name:</td>
                    <td><asp:TextBox ID="LastName" runat="server" Text="Powell"                       AutoPostBack="true" /></td>
                </tr>

                <tr>
                    <td>City:</td>
                    <td><asp:TextBox ID="City" runat="server" Text="Centralia"                       AutoPostBack="true" /></td>
                </tr>

                <tr>
                    <td>Country:</td>
                    <td><asp:TextBox ID="Country" runat="server" Text="USA"                       AutoPostBack="true" /></td>
                </tr>
                <tr>
                    <td>Phone:</td>
                    <td><asp:TextBox ID="Phone" runat="server" Text="(360)555-1234"                       AutoPostBack="true" /></td>
                </tr>

            </table>
            </div>
       
        <asp:button ID="btnSubmit"
            runat="server" 
            Text="Order Now"  
            OnClick="Submit"
            CausesValidation="false"/>

        <h2>Product List</h2>
        <asp:Repeater ID="ProductRepeater" runat="server" 
            OnItemDataBound="ProductRepeater_ItemDataBound"
            OnItemCommand="ProductRepeater_ItemCommand">
            <HeaderTemplate>
                <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Quantity</th>
                                <th scope="col">Product Name</th>
                                <th scope="col">Packaging</th>
                                <th scope="col">UnitPrice</th>
                            </tr>
                        </thead>
                    <tbody>                
            </HeaderTemplate>

            <ItemTemplate>
                <tr>
                    <td>
                        <asp:TextBox ID="Quantity"
                            runat="server"
                            TextMode="Number"
                            AutoPostBack="true" />
                    </td>
                    <td>
                        <asp:Label ID="ProductName" runat="server" Text='<%#Eval("ProductName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Package" runat="server" Text='<%#Eval("Package") %>' />
                    </td>
                    <td>
                        <asp:Label ID="UnitPrice" runat="server" Text='<%#Eval("UnitPrice") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Key" runat="server" Text='<%#Eval("Id") %>' />
                    </td>
                </tr>
            </ItemTemplate>

            <FooterTemplate>

                </tbody>
                </table>
            </FooterTemplate>
        </asp:Repeater>


        <asp:SqlDataSource ID="GourmetShop" runat="server" ConnectionString="<%$ ConnectionStrings:GourmetShopConnectionString %>" ProviderName="<%$ ConnectionStrings:GourmetShopConnectionString.ProviderName %>" SelectCommand="ProductList_Powell" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    </form>
</body>
</html>
