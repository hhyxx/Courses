<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="example7-9.aspx.cs" Inherits="WebSite7.example7_9" StyleSheetTheme="Theme2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label3" runat="server" Text="Welcome"></asp:Label>
        <br />
        用户名：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        密 码： 
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="提  交" />
    
    </div>
    </form>
</body>
</html>
