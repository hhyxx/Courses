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

	<form:form action="login2" method="post" modelAttribute="user" >
		name:<form:input path="name"/>
		     <form:errors path="name" cssStyle="color:red"/><br/>
		pwd:<form:input path="pwd"/>
		    <form:errors path="pwd" cssStyle="color:red"/><br/>
		    <input type="submit">
	</form:form>

</body>
</html>



