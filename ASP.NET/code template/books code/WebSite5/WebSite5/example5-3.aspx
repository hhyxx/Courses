<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="example5-3.aspx.cs" Inherits="WebSite5.example5_3_1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="http://www.baidu.com/">百度一下</asp:HyperLink>

&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/music.aspx" onclick="LinkButton1_Click">音 乐</asp:LinkButton>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

        <asp:Button ID="Button1" runat="server" Text="Button" onclick="Button1_Click" />
        <br />
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:ImageButton ID="ImageButton1" runat="server" Height="209px" ImageUrl="~/Images/dog.jpg" PostBackUrl="~/dog.aspx" Width="205px" onclick="ImageButton1_Click" AlternateText="this is a ImageButton."/>
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text="按钮应用演示"></asp:Label>
    
    </div>
    </form>
</body>
</html>
