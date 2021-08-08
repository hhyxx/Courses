<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id = "product" class = "chapter07.ProductBean"/>

<jsp:setProperty name = "product" property = "num" param = "2"> 
<jsp:setProperty property="num" value="2" name = "product" />
<jsp:getProperty property="totalPrice" name = "product" />



<!-- <jsp:setProperty property="price" value="23.5" name = "product" /> -->
<%-- <jsp:setProperty name = "product" property = "num" param = "2">  --%>

</body>

</html>