<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.File" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
List<String> fileNames = new ArrayList();
File f = new File("c://temp");
String[] names = f.list();
for(int i=0; i<names.length; i++) {
	fileNames.add(names[i]);
}
request.setAttribute("fileNames", fileNames);
%>

<c:forEach items="${fileNames}" var="x">
	<a href="download?fileName=${x}">${x}</a><br>	
</c:forEach>

</body>
</html>








