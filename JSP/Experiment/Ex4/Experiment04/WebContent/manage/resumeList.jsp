<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<% 
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	
%>

<base href="<%=basePath%>">
<title>简历列表</title>
<link href="css/manageadmin.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="place"> <span>位置：</span>
  <ul class="placeul">
    <li><a href="index.html">首页</a></li>
    <li>简历列表</li>
  </ul>
</div>
<div class="rightinfo">
  <div class="tools">
    <ul class="toolbar">
      <li><span><img src="images/t03.png" /></span><a href="#">删除</a></li>
    </ul>
  </div>
  <table class="imgtable">
    <thead>
      <tr>
        <th ><input name="" type="checkbox" value="" checked="checked"/></th>
        <th>姓名</th>
        <th>手机</th>
        <th>Email</th>
        <th>工作经验</th>
        <th>求职意向</th>
        <th>操作</th>
      </tr>
    </thead>

    
    <tbody>
    <c:forEach items = "${requestScope.pageBean.pageData}" var="resume">
    	<tr height = "50px">
    		<td><input name = "" type = "checkbox" value = "" /></td>
    		<td>${resume.realName }</td>
    		<td>${resume.telephone } </td>
    		<td>${resume.email}</td>
    		<td>${resume.jobExperience}</td>
    		<td>${resume.jobIntension}</td>
    		<td><a href = "ResumeServlet?type=select&resumeId=${resume.basicinfoId}" class></td>
    		
    	</tr>
    </c:forEach>
    </tbody>
  </table>
  
  
 <div class="pagin">
    <div class="message">共<i class="blue"> ${pageBean.totalPages } </i>页，当前显示第&nbsp;<i class="blue">${pageBean.pageNo}&nbsp;</i>页</div>
    <ul class="paginList">
      <li class="paginItem"><a href="ResumeServlet?type=list&pageNo=1">首页</a></li>
      <li class="paginItem"><a href="ResumeServlet?type=list&pageNo=${pageBean.pageNo - 1}">上一页<span class="pagepre"></span></a></li>
      <li class="paginItem"><a href="ResumeServlet?type=list&pageNo=${pageBean.pageNo + 1}">下一页<span class="pagenxt"></span></a></li>
       <li class="paginItem"><a href="ResumeServlet?type=list&pageNo=${pageBean.totalPages}">尾页</a></li>
    </ul>
  </div>
</div>
</body>
</html>
