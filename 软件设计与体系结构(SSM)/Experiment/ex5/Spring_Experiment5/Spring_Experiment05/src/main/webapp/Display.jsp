<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html>
<body>
    <h2><span>${user}</span></h2>
    <h2>
        <span>
            <c:forEach items="${userList}" var = "u" varStatus="ust">
                <p>序号: ${ust.index} &nbsp; 用户: ${u}</p>
            </c:forEach>
        </span>
    </h2>
</body>
</html>

