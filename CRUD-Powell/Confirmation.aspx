<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Confirmation.aspx.cs" Inherits="CRUD_Powell.Confirmation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Welcome <asp:Label ID="lblFirstName" runat="server" Text='<%#Eval("FirstName") %>'></asp:Label>
            Your Customer Number is
            <asp:Label ID="lblCustomerID" runat="server"  Text='<%#Eval("CustomerId") %>'></asp:Label>
            and yourd order number is
            <asp:Label ID="lblOrderNumber" runat="server" Text='<%#Eval("OrderNumber") %>'></asp:Label>.

            <H1>
                Your order of 
                <asp:Label ID="lblProductName" runat="server"></asp:Label>
                is on the way.
            </H1>
        </div>
        <hr />
        <h3>Order History</h3>


        <asp:Repeater ID="OrderRepeater" runat="server">
        </asp:Repeater>
        <br />

    </form>
</body>
</html>
