<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FilteredTextBoxExtender.aspx.cs" Inherits="WebSite10.FilteredTextBoxExtender" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
  </asp:ScriptManager>
  <asp:Label ID="Label1" runat="server" Text="只能输入大写字母或数字："></asp:Label>
  <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox> 
  <cc1:FilteredTextBoxExtender ID="TextBox1_FilteredTextBoxExtender" 
runat="server" Enabled="True" FilterType="Numbers,UppercaseLetters" TargetControlID="TextBox1">
  </cc1:FilteredTextBoxExtender>

    </div>
    </form>
</body>
</html>
