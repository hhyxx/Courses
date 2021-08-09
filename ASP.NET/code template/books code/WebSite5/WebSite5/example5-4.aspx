<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="example5-4.aspx.cs" Inherits="WebSite5.example5_4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="Label1" runat="server" Text="初始内容："></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server" Height="25px"></asp:TextBox>
        <asp:Label ID="Label2" runat="server" Text="克隆内容："></asp:Label>
        <asp:TextBox ID="TextBox2" runat="server" Height="26px"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" style="font-size: medium" Text="克隆" />
    </div>

        <br />
        <asp:Label ID="Label3" runat="server" Text="请在下方输入用户名和密码"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label4" runat="server" Text="用户名："></asp:Label>
        <asp:TextBox ID="TextBox3" runat="server" Height="25px" Width="234px"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label5" runat="server" Text="密  码："></asp:Label>
&nbsp;<asp:TextBox ID="TextBox4" runat="server" Height="26px" TextMode="Password" Width="233px"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" style="font-size: medium" Text="登  录" />
    </form>
</body>
</html>
