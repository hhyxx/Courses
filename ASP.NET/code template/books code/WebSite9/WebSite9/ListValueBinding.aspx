<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListValueBinding.aspx.cs" Inherits="WebSite9.ListValueBinding" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <div>
        <table style="width: 480px;">
            <tr>
                <td>
                    <asp:Panel ID="Panel1" runat="server" Height="190px" Width="160px" 
                        BorderStyle="Groove">
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                            Height="53px" Width="150px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                            
                        </asp:DropDownList> 
                        <br />
                        <asp:Label ID="Label1" runat="server" Text="已选择" Width="92%"></asp:Label>
                        <br />
                        <asp:TextBox ID="TextBox1" runat="server" Width="150px"></asp:TextBox>
                        <br />
                    </asp:Panel>
                </td>
                <td>
                    <asp:Panel ID="Panel2" runat="server" Height="190px" Width="160px" 
                        BorderStyle="Groove" >
                        <asp:CheckBoxList ID="CheckBoxList1" runat="server" Height="98px" Width="100%">
                            <asp:ListItem>未绑定</asp:ListItem>
                        </asp:CheckBoxList>
                        <br />
                        <asp:Button ID="Button1" runat="server" Text="确  定" Width="150px" OnClick="Button1_Click" />
                        <br />
                        <asp:TextBox ID="TextBox2" runat="server" Width="150px" ></asp:TextBox>
                        <br />
                    </asp:Panel>
                </td>
                <td>
                   <asp:Panel ID="Panel3" runat="server" Height="190px" Width="200px" 
                        BorderStyle="Groove">
                        <asp:BulletedList ID="BulletedList1" runat="server" 
                            Height="160px" Target="_blank" Width="73%" BulletStyle="Disc">
                        </asp:BulletedList>
                   </asp:Panel>
                </td>
            </tr>
        </table>
    </div>
    </div>
    </form>
</body>
</html>
