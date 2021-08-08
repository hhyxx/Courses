<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
</head>
<body>
	<!-- action="loginValidate.jsp" -->
	<form  method="post">
		<p>
			用户名：<input name="username" type="text">
		</p>
		<p>
			密&nbsp;&nbsp;码：<input name="password" type="password">
		</p>
		<p>
			<input name="submit" type="submit" value="登录">
		</p>
	</form>
	<%
		request.setCharacterEncoding("utf-8");
		String usrname = request.getParameter("username");
		String pwd = request.getParameter("password");
		System.out.println(usrname);
		System.out.println(pwd);
		
		if("admin".equals(usrname) && "123".equals(pwd)) {
			session.setAttribute("usrname",usrname);
			response.sendRedirect("main.jsp");
		}
		else {
			System.out.println("有误！");
		}	
	%>
</body>
</html>
</html>