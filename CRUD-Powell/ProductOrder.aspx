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
                    <td><asp:TextBox ID="ctrlLastName" runat="server" Text="Powell"                       AutoPostBack="true" /></td>
                </tr>

                <tr>
                    <td>City:</td>
                    <td><asp:TextBox ID="ctrlCity" runat="server" Text="Centralia" AutoPostBack="true" /></td>
                </tr>

                <tr>
                    <td>Country:</td>
                    <td><asp:TextBox ID="ctrlCountry" runat="server" Text="USA"                       AutoPostBack="true" /></td>
                </tr>
                <tr>
                    <td>Phone:</td>
                    <td><asp:TextBox ID="ctrlPhone" runat="server" Text="(360)555-1234" AutoPostBack="true" /></td>
                </tr>

            </table>
            </div>
       
        <h2>Product List</h2>
        <p>
            <asp:DropDownList ID="ctrlProduct"
                runat="server" 
                AutoPostBack="True" 
                DataSourceID="GourmetShop" 
                DataTextField="ProductName" 
                DataValueField="Id">
            </asp:DropDownList>
        </p>
        <p>
            &nbsp;</p>

        <asp:Repeater ID="ProductRepeater" runat="server">
            <HeaderTemplate>
                <table class="table">
                        <thead>
                            <tr>
                                <th scope="col"></th>
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
                        <asp:Label ID="lblProductID" runat="server" Visible="false" Text='<%#Eval("Id") %>' />
                        <asp:TextBox ID="ctrlQuantity" runat="server" size="2" TextMode="Number" />
                    </td>
                    <td>
                        <asp:Label ID="lblProductName" runat="server" Text='<%#Eval("ProductName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblPackage" runat="server" Text='<%#Eval("Package") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblUnitPrice" runat="server" Text='<%#Eval("UnitPrice") %>' />
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
