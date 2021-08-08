<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<h2>你好</h2>
<body>

<h2><%=session.getAttribute("usrname").toString()%>
<a href = "login.jsp">退出</a>
</body>
</html>