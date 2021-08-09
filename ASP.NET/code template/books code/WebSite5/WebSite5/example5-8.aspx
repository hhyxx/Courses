<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="example5-8.aspx.cs" Inherits="WebSite5.example5_8" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 123px;
            border: 1px solid #FF00FF;
        }
        .auto-style3 {
            width: 543px;
        }
        .auto-style4 {
            width: 181px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        请在下方输入个人信息<br />
        <br />
        姓名：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        性别：<asp:RadioButton ID="RadioButtonMale" GroupName="sex" runat="server" Text="男" Checked="True" />
        <asp:RadioButton ID="RadioButtonFemale" GroupName="sex" runat="server" Text="女" />
        <br />
        <br />
        请选择要看的行星<br />
        <span lang="EN-US" style="font-size:10.5pt;mso-bidi-font-size:
10.0pt;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;;mso-fareast-font-family:宋体;
mso-ansi-language:EN-US;mso-fareast-language:ZH-CN;mso-bidi-language:HE">RadioButtonList Example</span><table cellpadding="2" cellspacing="0" class="auto-style1">
            <tr>
                <td class="auto-style4">
                    <asp:RadioButtonList id="myList" RepeatColumns="2" runat="server" Height="16px" Width="204px">
                        <asp:ListItem Selected="True" Value="~\Images\dq.jpeg">地球</asp:ListItem>
                        <asp:ListItem Value="~\Images\hx.jpeg">火星</asp:ListItem>
                        <asp:ListItem Value="~\Images\mx.jpeg">木星</asp:ListItem>
                        <asp:ListItem Value="~\Images\sx.jpeg">水星</asp:ListItem>
                        <asp:ListItem Value="~\Images\hwx.jpeg">海王星</asp:ListItem>
                        <asp:ListItem Value="~\Images\mw.jpeg">冥王星</asp:ListItem>
                        <asp:ListItem Value="~\Images\tx.jpeg">土星</asp:ListItem>
                        <asp:ListItem Value="~\Images\twx.jpeg">天王星</asp:ListItem>
                        <asp:ListItem Value="~\Images\jx.jpeg">金星</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td class="auto-style3">
                    <asp:Label id="msg" runat="server" Text="Label"></asp:Label>
                    <br />
                    <asp:Image id="Image" runat="server" />
                    <br />
                    <asp:Button ID="Button1" runat="server" Text="View" />
&nbsp;
                    <asp:Button ID="ButtonOK" onclick="ButtonOK_Click" runat="server" Text="确 定" />
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
