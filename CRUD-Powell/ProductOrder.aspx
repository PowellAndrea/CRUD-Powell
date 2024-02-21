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
                <td><asp:TextBox ID="FirstName" runat="server" Text="Andrea" AutoPostBack="true"/></td>
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
                    <td><asp:TextBox ID="Phone" runat="server" Text="(360)555-1234" AutoPostBack="true" /></td>
                </tr>

            </table>
            </div>
       
        <h2>Product List</h2>
        <p>
            <asp:Button type="submit" runat="server" OnClick="Submit" Text="Submit Order" />
        </p>
        <asp:Repeater ID="ProductRepeater" runat="server">
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
                        <asp:Label ID="key" runat="server" Visible="false" Text='<%#Eval("Id") %>' />
                        <asp:TextBox ID="Quantity" runat="server" size="2" TextMode="Number" AutoPostBack="true"/>
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
