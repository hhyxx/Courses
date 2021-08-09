<%@ Page Language="C#" AutoEventWireup="true" CodeFile="example3-5.aspx.cs" Inherits="example3_5" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:TextBox ID="TextBox1" runat="server" ViewStateMode="Enabled"></asp:TextBox>
        <br />
        <asp:Button ID="Button1" runat="server"  Text="保存ViewState中的值" ViewStateMode="Enabled" OnClick="Button1_Click" />
        <br />
        <asp:Label ID="Label1" runat="server" Text="Label" ViewStateMode="Enabled"></asp:Label>
        <br />
        <asp:Button ID="Button2" runat="server" Text="读取ViewState中的值" ViewStateMode="Enabled" OnClick="Button2_Click" />
    
    </div>
    </form>
</body>
</html>
