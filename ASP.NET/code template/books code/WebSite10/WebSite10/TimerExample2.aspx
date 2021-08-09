<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TimerExample2.aspx.cs" Inherits="WebSite10.TimerExample2" %>

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
  <asp:Timer ID="Timer1" runat="server" Interval="2000" ontick="Timer1_Tick">
 </asp:Timer>
<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
      <ContentTemplate>
           <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
      </ContentTemplate>
      <Triggers>
          <asp:AsyncPostBackTrigger ControlID="Timer1" />
      </Triggers>
 </asp:UpdatePanel>
 <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
      <ContentTemplate>
          <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
      </ContentTemplate>
      <Triggers>
          <asp:AsyncPostBackTrigger ControlID="Timer1" />
      </Triggers>
 </asp:UpdatePanel>

    </div>
    </form>
</body>
</html>
