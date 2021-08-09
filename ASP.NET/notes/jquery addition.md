 ## 表格颜色交替、选中高亮



```html
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="example11-5.aspx.cs" Inherits="WebSite11.example11_5" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="css/style.css" rel="stylesheet" type="text/css" />
<!--   引入jQuery -->
<script src="../scripts/jquery-2.1.3.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function () {
        $("tbody>tr:odd").addClass("odd"); //先排除第一行,然后给奇数行添加样式
        $("tbody>tr:even").addClass("even"); //先排除第一行,然后给偶数行添加样式
        $('tbody>tr').click(function () {
            $(this)
				.addClass('selected')
				.siblings().removeClass('selected')
				.end()
				.find(':radio').attr('checked', true);
        });
        // 如果单选框默认情况下是选择的，则高色.
        // $('table :radio:checked').parent().parent().addClass('selected');
        //简化:
        $('table :radio:checked').parents("tr").addClass('selected');
        //再简化:
        //$('tbody>tr:has(:checked)').addClass('selected');

    })
</script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table>
		<thead>
			<tr><th> </th><th>姓名</th><th>性别</th><th>暂住地</th></tr>
		</thead>
		<tbody>
			<tr><td><input type="radio" name="choice" value=""/></td>
				<td>张山</td><td>男</td><td>浙江宁波</td></tr>
			<tr><td><input type="radio" name="choice" value="" /></td>
				<td>李四</td><td>女</td><td>浙江杭州</td></tr>
			<tr><td><input type="radio" name="choice" value="" checked='checked' /></td>
				<td>王五</td><td>男</td><td>湖南长沙</td></tr>
			<tr><td><input type="radio" name="choice" value="" /></td>
				<td>找六</td><td>男</td><td>浙江温州</td></tr>
			<tr><td><input type="radio" name="choice" value="" /></td>
				<td>Rain</td><td>男</td><td>浙江杭州</td></tr>
			<tr><td><input type="radio" name="choice" value="" /></td>
				<td>MAXMAN</td><td>女</td><td>浙江杭州</td></tr>
		</tbody>
	</table>
    </div>
    </form>
</body>
</html>

```

