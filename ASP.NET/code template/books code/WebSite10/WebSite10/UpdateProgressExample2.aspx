<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateProgressExample2.aspx.cs" Inherits="WebSite10.UpdateProgressExample2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
     <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
      <ContentTemplate>
         <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>    <br />
         <asp:Button ID="Button1" runat="server" Text="Button1" onclick="Button1_Click" /><br />
      </ContentTemplate>
   </asp:UpdatePanel>    <br />
   <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
       <ProgressTemplate>
            正在更新UpdatePanel1……<br />
            <asp:Image ID="Image1" runat="server" ImageUrl="progress.gif" Width="180px" /><br />
       </ProgressTemplate>
   </asp:UpdateProgress>      <br />
   <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>      <br />
            <asp:Button ID="Button2" runat="server" Text="Button2" onclick="Button2_Click" /> <br />
        </ContentTemplate>
   </asp:UpdatePanel>    <br /> 
   <asp:UpdateProgress ID="UpdateProgress2" runat="server" AssociatedUpdatePanelID="UpdatePanel2">
        <ProgressTemplate>
              正在更新UpdatePanel2……<br />
              <asp:Image ID="Image2" runat="server" ImageUrl="progress1.gif" Width="180px" /><br />
        </ProgressTemplate>
   </asp:UpdateProgress>

    </div>
    </form>
</body>
</html>
