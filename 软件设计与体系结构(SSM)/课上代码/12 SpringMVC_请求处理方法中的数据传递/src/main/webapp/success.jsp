<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>1、success</h1>
	
	<h1>2、${msg }</h1>	

	<h1>3、</h1>	
	<form>
		id:<input type="text" value="${user.id }"><br>
		name:<input type="text" value="${user.name }"><br>
		pwd:<input type="text" value="${user.pwd }"><br>
		email:<input type="text" value="${user.email }"><br>
		role:<input type="text" value="${user.role }"><br>	
	</form>
		
</body>
</html>






