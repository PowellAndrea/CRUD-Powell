<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Confirmation.aspx.cs" Inherits="CRUD_Powell.Confirmation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Welcome &lt;&gt;, your Customer Number is &lt;x&gt; and yourd order number is &lt;y&gt;<br />
            <br />
            Your order of &lt;product&gt; is on the way.<br />
            <br />
            <br />
            &lt;h2&gt; Order History&lt;/h2&gt;</div>
        <asp:Repeater ID="OrderRepeater" runat="server">
        </asp:Repeater>
    </form>
</body>
</html>
