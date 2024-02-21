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
            <div class="table">
                <div class="row">
                    <div class="column">First Name:</div>
                    <input id="FirstName" type="text" value="Your_FirstName" />
                </div>
                
                <div class="row">
                    <div class="column">Last Name:</div>
                    <input id="LastName" type="text" value="Your_LastName" />
                </div>
                <div class="row">
                    <div class="column">City:</div>
                    <input id="City" type="text" value="Chehalis" />
                </div>
                <div class="row">
                    <div class="column">Country</div>
                    <input id="Country" type="text" value="USA" />
                </div>
                <div class="row">
                    <div class="column">Phone:</div>
                    <input id="Phone" type="text" value="(360) 555-1234" />
                </div>
            </div>
        </div>
       
        <h2>Product List</h2>
        <p>
            <asp:Button type="submit" runat="server" OnClick="OrderNow" Text="Submit Order" />
        </p>
        <asp:Repeater ID="ProductRepeater" runat="server" OnItemCommand="ProductRepeater_ItemCommand">
            <HeaderTemplate>
                <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">  </th>
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
                        <asp:CheckBox runat="server" />
                    </td>
                    <td>
                        <input ID="Quantity" runat="server" size="4"/>
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
                        <asp:Label ID="Id" runat="server" Text='<%#Eval("Id") %>' />
                    </td>>
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
