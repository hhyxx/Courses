<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdatePanel_test.aspx.cs" Inherits="WebSite10.UpdatePanel_test" %>

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
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <asp:Label ID="Label1" runat="server" Text="当前时间："></asp:Label>
        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
        <br /> <br />
        <asp:Button ID="Button1" runat="server" Text="Button1" onclick="Button1_Click" />
        <br />
    </ContentTemplate>
    <Triggers>
          <asp:PostBackTrigger ControlID="Button1" />
          <asp:AsyncPostBackTrigger ControlID="Button2"  />
  </Triggers>
 </asp:UpdatePanel>
<br />
<asp:Button ID="Button2" runat="server" Text="Button2" onclick="Button2_Click" /> 
   </div>
    </form>
</body>
</html>
