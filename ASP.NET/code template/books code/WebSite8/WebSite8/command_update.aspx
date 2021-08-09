<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="command_update.aspx.cs" Inherits="WebSite8.command_update" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table style="width: 320px; height: 240px">
     <tr>
     <td style="width: 100px; text-align: right"> 学号：</td>
     <td style="width: 220px"> 
<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>  </tr>
     <tr>
     <td style="width: 100px; text-align: right"> 姓名：</td>
     <td style="width: 220px">
 <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>  </tr>
     <tr>
     <td style="width: 100px; text-align: right"> 性别：</td>
     <td style="width: 220px">
       <asp:DropDownList ID="DropDownList1" runat="server">
             <asp:ListItem Selected="True">男</asp:ListItem>
             <asp:ListItem>女</asp:ListItem>
       </asp:DropDownList>  </td>   </tr>
     <tr>
     <td style="width: 100px; text-align: right">  出生日期：</td>
     <td style="width: 220px">
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></td> </tr>
     <tr>
     <td style="width: 100px; text-align: right"> 地址：</td>
     <td style="width: 220px">
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox></td>  </tr>
     <tr>
     <td style="width: 100px; text-align: right"> 照片：</td>
     <td style="width: 220px">
            <asp:FileUpload ID="FileUpload1" runat="server" /></td> </tr>
     <tr>
     <td colspan="2" style="text-align: center">
    <asp:Button ID="Button1" runat="server" Text="提交" OnClick="Button1_Click" /></td> </tr>
   </table>
   <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>

    </div>
    </form>
</body>
</html>
