<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="show2.aspx.cs" Inherits="WebSite13.show2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Xml ID="Xml1" runat="server" DocumentSource="~/studentinfo.xml" TransformSource="~/XSLTFile.xslt"></asp:Xml>
    
    </div>
    </form>
</body>
</html>
