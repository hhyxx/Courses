<%@ Page Language="C#" AutoEventWireup="true" CodeFile="example3-6.aspx.cs" Inherits="example3_6" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <br />
        <asp:Button ID="Button1" runat="server" Text="写入Cookie" OnClick="Button1_Click" />
        <br />
        <asp:Button ID="Button2" runat="server" Text="读取Cookie" OnClick="Button2_Click" />
    
    </div>
    </form>
</body>
</html>
