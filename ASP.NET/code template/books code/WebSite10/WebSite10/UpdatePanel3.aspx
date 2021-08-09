<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdatePanel3.aspx.cs" Inherits="WebSite10.UpdatePanel3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
       <asp:ScriptManager ID="ScriptManager1" runat="server" 
            onasyncpostbackerror="ScriptManager1_AsyncPostBackError">
       </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                <asp:Label ID="Label1" runat="server" Text="+"></asp:Label>
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                <asp:Label ID="Label2" runat="server" Text="="></asp:Label>
                <asp:Label ID="Label3" runat="server" Text="Label3"></asp:Label>
                <br />
                <asp:Button ID="Button1" runat="server" Text="计  算"  OnClick="Button1_Click"/>
            </ContentTemplate>
        </asp:UpdatePanel>
    
    </div>
    </form>
</body>
</html>
