<%@ Page Language="C#" AutoEventWireup="true" CodeFile="delete.aspx.cs" Inherits="delete" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {width: 100%;}
        .auto-style2 {width: 62px;}
        .auto-style3 {width: 191px;}
    </style></head><body>
    <form id="form1" runat="server"><div></div>
        <table class="auto-style1"><tr>
                <td class="auto-style2">学号：</td>
                <td class="auto-style3">
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td><td>
                    <asp:Button ID="Button1" runat="server" Text="删除" OnClick="Button1_Click" /></td></tr><tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">
                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label></td><td>&nbsp;</td></tr></table>
    </form>
</body>
</html>
