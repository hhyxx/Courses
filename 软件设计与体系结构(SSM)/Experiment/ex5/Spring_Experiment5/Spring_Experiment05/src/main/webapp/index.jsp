<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page isELIgnored="false" %>
<html>
<body>
    <form action = "login" method = "post">
        <span>${msg3}</span><br>
        用户名：<input type = "text" name = "uname"><span>${msg1}</span><br>
        密码：<input type = "password" name = "pwd"><span>${msg2}</span></span><br>
        <input type = "submit" value = "登陆"><br>
    </form>
</body>
</html>

