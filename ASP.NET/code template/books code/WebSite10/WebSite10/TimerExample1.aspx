﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TimerExample1.aspx.cs" Inherits="WebSite10.TimerExample1" %>

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
               <asp:Timer ID="Timer1" runat="server" Interval="1000" ontick="Timer1_Tick">
               </asp:Timer>
               <asp:Image ID="Image1" runat="server" ImageUrl="TimerExample1.gif"/>
            </ContentTemplate>
        </asp:UpdatePanel>    
    </div>
    </form>
</body>
</html>
