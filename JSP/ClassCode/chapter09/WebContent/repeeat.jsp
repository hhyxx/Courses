<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="chapter09.Book" import = "java.util.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	List<Book>	lst = new ArrayList<Book> ();
	lst.add(new Book("书1"));
	lst.add(new Book("书2"));
	session.setAttribute("bklst", lst);
%>
<c:forEach items="${sessionScope.bklst}" var = "book" varStatus="vst">
<p>序号: ${vst.index} &nbsp; 个数: ${vst.count} &nbsp; 名字 : ${book.name} </p> 
</c:forEach>
</body>
</html>