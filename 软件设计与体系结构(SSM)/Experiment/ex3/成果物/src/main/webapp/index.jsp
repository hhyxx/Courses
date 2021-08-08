<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page isELIgnored="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<body>
<h2>Register</h2><br>
<form action = "complete" method = "post">
    用户名：<input type = "text" name = "username"><span>${msg1}</span><br>
    密码：<input type = "password" name = "pwd"><span>${msg2}</span></span><br>
    性别：<input type = "text" name = "sex" ><br>
    电子邮件：<input type = "text" name = "email"><br>
    身份：<input type = "text" name = "role"><br>
    所在省：<input type = "text" name = "address.province"><br>
    所在市：<input type = "text" name = "address.city"><br>
    <input type = "submit" value = "提交"><br>
</form>
</body>
</html>
