<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix = "fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	${fn :  escapeXml("<br>")}
	${fn:substring("hallo,everone",0,5)}
	${fn:split("hello,everone",",")[0]}
</body>
</html>