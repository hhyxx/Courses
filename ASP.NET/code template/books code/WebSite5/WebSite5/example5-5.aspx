<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="example5-5.aspx.cs" Inherits="WebSite5.example5_5" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        请选择汽车品牌：<br />
        <br />
&nbsp;
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" Height="55px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Width="101px">
            <asp:ListItem>宝马</asp:ListItem>
            <asp:ListItem>奔驰</asp:ListItem>
            <asp:ListItem>丰田</asp:ListItem>
            <asp:ListItem>一汽</asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        请选择型号：<br />
        <br />
&nbsp;
        <asp:ListBox ID="ListBox1" runat="server" Height="82px" SelectionMode="Multiple" Width="97px"></asp:ListBox>
        <br />
&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" style="font-size: medium" Text="确 定" />
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    
    </div>
    </form>
</body>
</html>
