<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="example5-12.aspx.cs" Inherits="WebSite5.example5_12" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:RadioButton ID="radioEncode" runat="server" GroupName="LiteralMode" Checked="True" 
    Text="Encode" AutoPostBack="True" />
    <asp:RadioButton ID="radioPassthrough" runat="server" GroupName="LiteralMode" 
    Text="PassThrough" AutoPostBack="True" />
        <br />
        <asp:Literal ID="Literal1" runat="server"></asp:Literal>
        <br />
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </div>
    </form>
</body>
</html>
