<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AlwaysVisibleControlExtender.aspx.cs" Inherits="WebSite10.AlwaysVisibleControlExtender" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
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
    <asp:Panel ID="Panel1" runat="server"   Width="150px" height="120px" >
          <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="images/1.jpg" Height="123px" Width="143px" /> 
    </asp:Panel>
    <cc1:AlwaysVisibleControlExtender ID="avce" runat="server"
              TargetControlID="Panel1"
              VerticalOffset="10"
              HorizontalOffset="10"
              ScrollEffectDuration=".1" />
    </div>
    </form>
</body>
</html>
