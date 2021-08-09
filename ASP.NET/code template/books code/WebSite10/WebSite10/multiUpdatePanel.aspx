<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="multiUpdatePanel.aspx.cs" Inherits="WebSite10.multiUpdatePanel" %>

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


<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
  <ContentTemplate>
    <fieldset style="width:180px;">               
    <legend >UpdatePanel1</legend>      
    <asp:ListBox ID="ListBox1" runat="server"  Width="170px"></asp:ListBox>
    <asp:Label ID="Label1" runat="server" ><%=DateTime.Now %></asp:Label>
    </fieldset>
      <br />
  </ContentTemplate>

  <Triggers>
     <asp:AsyncPostBackTrigger ControlID="InsertButton" EventName="Click" />
  </Triggers>


 </asp:UpdatePanel>   
<asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
  <ContentTemplate>         
    <fieldset style="width:160px;">
  <legend >UpdatePanel2</legend>      
  <asp:TextBox ID="TextBox1" runat="server" EnableTheming="True"></asp:TextBox>
<asp:Button ID="InsertButton" runat="server" Text="新增"  OnClick="InsertButton_Click" />
&nbsp;&nbsp;
  <asp:Button ID="Cancelbutton" runat="server" Text="取消" OnClick="Cancelbutton_Click" />
     <asp:Label ID="Label2" runat="server" ><%=DateTime.Now %></asp:Label>
  </fieldset>          
 </ContentTemplate>
</asp:UpdatePanel>

    
    </div>
    </form>
</body>
</html>
