<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="example5-15.aspx.cs" Inherits="WebSite5.example5_15" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
   *密&nbsp;&nbsp; 码：
<asp:TextBox ID="TextBoxPassword"  runat="server"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
    ControlToValidate="TextBoxPassword" ErrorMessage="密码不能为空！" 
    Display="Dynamic" CssClass="auto-style1">密码不能为空！
</asp:RequiredFieldValidator> <br />
&nbsp;*确认密码：
<asp:TextBox ID="TextBoxPasswordConfirm" runat="server"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
    ControlToValidate="TextBoxPasswordConfirm" ErrorMessage="密码不能为空！" 
    Display="Dynamic" CssClass="auto-style1">密码不能为空！
</asp:RequiredFieldValidator> <br /><br />
<asp:CompareValidator ID="CompareValidator1" runat="server" 
    ControlToCompare="TextBoxPassword"  ControlToValidate="TextBoxPasswordConfirm" 
    ErrorMessage="密码不一致，重新输入。" Display="Dynamic" CssClass="auto-style1">密码不一致，重新输入。
</asp:CompareValidator>

    </div>
    </form>
</body>
</html>
