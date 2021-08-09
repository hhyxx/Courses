<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="example5-11.aspx.cs" Inherits="WebSite5.example5_11" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:AdRotator ID="AdRotator1" runat="server" DataSourceID="XmlDataSource1" />
        <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/App_Data/AdDataSource.xml"></asp:XmlDataSource>
    
    </div>
    </form>
</body>
</html>
