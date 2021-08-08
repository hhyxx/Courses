<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户留言板</title>
<script type="text/javascript">
	function validate() {
		var uname = document.getElementById("username");
		var message = document.getElementById("message");
		if (uname.value == "") {
			alert("请填写您的名字！");
			uname.focus();
			return false;
		} else if (message.value == "") {
			alert("请填写留言");
			message.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<p>请留言</p>
	<form action="guestBook.jsp" method="post"
		onsubmit="return validate();">
		<p>
			输入您的名字：<input name="username" id="username" type="text">
		</p>
		<p>
			输入您的留言：
			<textarea name="message" id="message" cols="50" rows="3"></textarea>
		</p>
		<p>
			<input type="submit" value="提交留言">
		</p>
	</form>
	<hr>
	<p>留言内容</p>
	<%
		//获取留言信息
		request.setCharacterEncoding("UTF-8");
		String username = request.getParameter("username");
		String message = request.getParameter("message");
		//从application域属性messageBook中获取留言本
		Vector<String> book = (Vector<String>) application
				.getAttribute("messageBook");
		if (book == null)//若留言本不存在则新创建一个
			book = new Vector<String>();
		//判断用户是否提交了留言，若已提交，则将提交信息加入留言本，存入application域属性中
		if (username != null && message != null) {
			String info = username + "#" + message;
			book.add(info);
			application.setAttribute("messageBook", book);
		}
		//遍历显示出所有的用户留言
		if (book.size() > 0) {
			for (String mess : book) {
				String[] arr = mess.split("#");
				out.print("<p>姓名：" + arr[0] + "<br>留言：" + arr[1] + "</p>");
			}
		} else {
			out.print("还没有留言！");
		}
	%>
</body>
</html>