<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PageOne.aspx.cs" Inherits="PageOne" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Button ID="Button1" runat="server" PostBackUrl="~/PageTwo.aspx" Text="单击Button转到第二个页面" />
        <br />
        <br />
        <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/PageThree.aspx">单击LinkButton转到第三个页面</asp:LinkButton>
        <br />
        <br />
        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="dog.jpg" Height="148px" PostBackUrl="~/PageFour.aspx" Width="147px" />    
    </div>
    </form>
</body>
</html>
