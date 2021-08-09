<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="example7-6.aspx.cs" Inherits="WebSite7.example7_6" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
   <style>
#left,#right{background-color:#eeeeee;border:1px solid #33ccff;height:200px; }
#left{width:180px; float:left; }
#bottom{ background-color:#eeeeee; border:1px solid #33ccff; height:50px; clear:both; }
   </style>
</head>
<body>
  <form id="form1" runat="server">
    <div id="left">当前层的ID是left</div>
    <div id="right">当前层的ID是right</div>
    <div id="bottom">当前层的ID是bottom</div>
  </form>
</body>

</html>
