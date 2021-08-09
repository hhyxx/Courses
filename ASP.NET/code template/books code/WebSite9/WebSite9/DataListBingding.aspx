<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DataListBingding.aspx.cs" Inherits="WebSite9.DataListBingding" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:DataList ID="DataList1" runat="server" Height="354px" RepeatColumns="5" 
            HorizontalAlign="Justify" RepeatDirection="Horizontal">
            <ItemTemplate>
                <table style="width: 154px; height: 111px">
                    <tr>
                        <td style="width: 100px">
                           <img alt="照片" src='./images/<%# Eval("Photo") %>' /></td>
                    </tr>
                    <tr>
                        <td style="width: 100px">
                            学号：<%# Eval("No") %><br />姓名：<%# Eval("Name") %><br />年龄：<%# Eval("birthday") %><br />住址：<%# Eval("Adress") %></td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
     </div>

    </form>
</body>
</html>
