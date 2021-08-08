<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>在线人数统计</title>
</head>
<body>
	<p>当前在线人数为：${applicationScope.onlineUserNum}</p>
	<a href="logout.jsp">安全退出</a>
</body>
</html>