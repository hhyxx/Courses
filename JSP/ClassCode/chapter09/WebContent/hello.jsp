<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:catch var = "error">
		<%=1/0%>
	</c:catch>
	<c:out value = "${error.message}"></c:out>
	
	<c:set var = "score" value = "70"></c:set>
	<c:choose>
		<c:when test = "${score >= 90}">
			成绩优秀
		</c:when>
		<c:when test = "${score >= 80 && score < 90}">
			成绩良好
		</c:when>
		<c:when test = "${score >= 70 && score < 80}">
			成绩及格
		</c:when>
		<c:otherwise>
			未通过
		</c:otherwise>
	</c:choose>
<br>

</body>
</html>