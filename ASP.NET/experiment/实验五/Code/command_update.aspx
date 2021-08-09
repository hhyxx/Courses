<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {width: 100%;}
        .auto-style2 {width: 76px;}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div></div>
        <table class="auto-style1"><tr>
                <td class="auto-style2">学号：</td>
                    <td><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </td></tr><tr><td class="auto-style2">姓名：</td>
                    <td><asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
            </tr><tr>
                <td class="auto-style2">性别：</td><td>
                    <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem>男</asp:ListItem>
                        <asp:ListItem>女</asp:ListItem>
                    </asp:DropDownList>
                </td></tr><tr><td class="auto-style2">年龄：</td>
                    <td><asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                </td></tr><tr><td class="auto-style2">地址：</td>
                    <td><asp:TextBox ID="TextBox4" runat="server"></asp:TextBox></td></tr><tr>
                <td class="auto-style2">照片：</td><td>
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                </td></tr>
            <tr><td class="auto-style2">&nbsp;</td>
                    <td><asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="提交" /></td></tr>
        </table>
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    </form>
</body>
</html>
