<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateProgressExample1.aspx.cs" Inherits="WebSite10.UpdateProgressExample1" %>

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
         
          <br />
          <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>   <br />
          <asp:Button ID="Button1" runat="server" Text="Button" onclick="Button1_Click" />
          <br />
      </ContentTemplate>
    </asp:UpdatePanel>  <br /> <br />
    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
      <ProgressTemplate>
            正在更新……<br />
            <asp:Image ID="Image1" runat="server" ImageUrl="progress.gif" Width="180px" /><br />
      </ProgressTemplate>
    </asp:UpdateProgress>

    </div>
    </form>
</body>
</html>
