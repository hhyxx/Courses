<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="example5-6.aspx.cs" Inherits="WebSite5.example5_6" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <h1><span lang="EN-US" style="font-size:10.5pt;mso-bidi-font-size:
10.0pt;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;;mso-fareast-font-family:宋体;
mso-ansi-language:EN-US;mso-fareast-language:ZH-CN;mso-bidi-language:HE">CheckBoxList</span><span style="font-size:10.5pt;mso-bidi-font-size:10.0pt;font-family:宋体;mso-ascii-font-family:
&quot;Times New Roman&quot;;mso-hansi-font-family:&quot;Times New Roman&quot;;mso-bidi-font-family:
&quot;Times New Roman&quot;;mso-ansi-language:EN-US;mso-fareast-language:ZH-CN;
mso-bidi-language:HE">控件演示程序</span></h1>
        <p>
            请选择您需要学习的计算机语言：<asp:CheckBoxList ID="CheckBoxList1" runat="server" Height="16px" Width="221px">
                <asp:ListItem>Visual Basic</asp:ListItem>
                <asp:ListItem>C#</asp:ListItem>
                <asp:ListItem>C++</asp:ListItem>
                <asp:ListItem>Javascript</asp:ListItem>
                <asp:ListItem>XML</asp:ListItem>
                <asp:ListItem>Java</asp:ListItem>
            </asp:CheckBoxList>
            <asp:Button ID="Button1" runat="server" style="font-size: medium" Text="确  定" />
        </p>
        <p>
            <asp:CheckBox ID="CheckBox1" runat="server" Text="改变显示风格" />
&nbsp;
            <asp:CheckBox ID="CheckBox2" runat="server" Text="改变字体颜色" />
        </p>
    
    </div>
        您选择的计算机语言为：<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </form>
</body>
</html>
