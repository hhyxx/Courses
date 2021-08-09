<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SingleValueBinding.aspx.cs" Inherits="WebSite9.SingleValueBinding" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>     
        <%# SingleValueBindingStr+"0" %>
     <asp:Label ID="Label1" runat="server" Text=" <%# SingleValueBindingStr+1 %>"></asp:Label>
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <asp:TextBox ID="TextBox2" runat="server" Text="Label2"></asp:TextBox> 
     </div>
    </form>
</body>
</html>
