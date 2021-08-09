<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="example5-16.aspx.cs" Inherits="WebSite5.example5_16" %>

<%@ Register src="WebUserControl1.ascx" tagname="WebUserControl1" tagprefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <uc1:WebUserControl1 ID="WebUserControl11" runat="server" />
    
    </div>
        <uc1:WebUserControl1 ID="WebUserControl12" runat="server" />
    </form>
</body>
</html>
