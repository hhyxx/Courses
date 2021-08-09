<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="example5-13.aspx.cs" Inherits="WebSite5.example5_13" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        生成TextBoxes：<asp:DropDownList ID="DropDownList1" runat="server">
        </asp:DropDownList>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="刷新Pannel" />
        <br />
        <br />
        <asp:CheckBox ID="CheckBoxChangeFont" runat="server" Text="设置字体" />
        <asp:CheckBox ID="CheckBoxChangeBkGround" runat="server" Text="设置背景" />
        <br />
        <asp:Literal ID="Literal1" runat="server"></asp:Literal>
        <br />
        <asp:Literal ID="Literal2" runat="server"></asp:Literal>
    <asp:panel id="myPanel" runat="server" backcolor="#eeeeee" width="300px"
    GroupingText="Panel控件">
    <p>作为动态生成的文本框的容器…… </p>
</asp:panel>

    </div>
    </form>
</body>
</html>
