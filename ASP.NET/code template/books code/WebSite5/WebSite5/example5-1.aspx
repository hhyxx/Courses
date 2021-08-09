<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="example5-1.aspx.cs" Inherits="WebSite5.example5_1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script type ="text/javascript">
        function AddButton_Click() {
            alert('You clicked me.');
            var a = document.getElementById("Text1").value;
            var b = document.getElementById("Text2").value;
            // alert(a);  alert(b);
            var answer = parseInt(a) + parseInt(b);
            document.getElementById("Text3").value = answer;
            //alert(answer);
        }
</script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <input id="Text1" type="text" maxlength ="3"/>+
        <input id="Text2" type="text"maxlength ="3" />
        <input id="Button1" type="button" value="=" onclick="AddButton_Click();" />
        <input id="Text3" type="text" /></div>
    </form>
    <p>
        输入整数到文本框中<br />
        单击“=”按钮进行求和</p>
    <p>
        &nbsp;</p>
</body>
</html>
