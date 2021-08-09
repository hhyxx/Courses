<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="example5-2.aspx.cs" Inherits="WebSite5.example5_2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
  <script runat="server">
    protected void AddButton_Click(Object sender, EventArgs e)
    {
        int Answer;
        Answer = Convert.ToInt32(Text1.Value) + Convert.ToInt32(Text2.Value);
        Text3.Value = Answer.ToString();
    }
</script>

</head>
<body>
     <form id="form1" runat="server">
    <div>
    
        <input id="Text1" type="text" maxlength ="3" runat="server"/>+
        <input id="Text2" type="text" maxlength="3" runat="server" />
        <input id="Button1" type="button" value="=" onserverclick="AddButton_Click" runat="server" />
        <input id="Text3" type="text" runat="server" /></div>
    </form>
    <p>
        输入整数到文本框中<br />
        单击“=”按钮进行求和</p>
    <p>
        &nbsp;</p>
</body>
</html>
