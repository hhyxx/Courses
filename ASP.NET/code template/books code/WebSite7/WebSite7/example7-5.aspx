<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="example7-5.aspx.cs" Inherits="WebSite7.example7_5" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
  <title></title>
  <style>
    body{ text-align:center; }
    #sample
    {
       border: 2px solid #CCC;
          margin: 10px;
          padding: 20px 10px 10px 20px;
          background: #fefefe url('images/bg_image1.gif') no-repeat right bottom;
          color: #666; 	
          text-align: center; 
          line-height: 120px;
       width:51%;
          height: 169px;
      }
  </style>
</head>
<body>
<form id="form1" runat="server">
<div id="sample">这是一个层布局的例子</div>
 </form>
</body>

</html>
