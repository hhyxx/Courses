<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="example7-2.aspx.cs" Inherits="WebSite7.example7_2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>链接式样式</title>
<style type="text/css">
<!--
h1{ font-weight:bold }
   h2{ color: yellow}
-->
</style>
<link rel="stylesheet" href="style.css" type="text/css" />
    <link href="NewStyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
<form id="form1" runat="server">
<div>
<h1 style=" font-size:small ">欢迎光临</h1>
<h2 style=" font-weight:bold ">这是一个被style修饰的页面</h2>
</div>
</form>
</body>
</html>
