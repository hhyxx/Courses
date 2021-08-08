<!-- 导入包 -->
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- setContentType 等方法 在这里设置 , xml 也可以-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test 1 </title>
</head>
<body>
<%
	SimpleDateFormat form = new SimpleDateFormat("yyyy-MM-dd");
	out.print(form.format( new Date() ) + "<br/>");
	String root_path = request.getRealPath("/");
	out.print(root_path);
%>

	<jsp:include page = "result.jsp">
		
	</jsp:include>
<%="<br/>" + root_path%>
</body>
</html>