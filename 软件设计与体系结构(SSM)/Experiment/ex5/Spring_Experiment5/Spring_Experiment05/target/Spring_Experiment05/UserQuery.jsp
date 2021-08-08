<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page isELIgnored="false" %>



<html>
<body>
    <h2><a href = "All">查询所有用户</a></h2><br/><br/>
    <span>${msg1}</span><br>
    <hr>

    <h2>根据 id 查询：</h2><br/>
    <form action = "Id" method = "post">
        用户ID：<input type = "text" name = "uid"><span>${msg2}</span><br>
        <input type = "submit" value = "提交"><br>
    </form><br/>
    <span>${msg3}</span><br/>
    <hr>

    <h2>根据用户名和密码查询：</h2><br/>
    <form action = "NamePwd" method = "post">
        用户名：<input type = "text" name = "uname"><span>${msg4}</span><br>
        密码：<input type = "password" name = "pwd"><span>${msg5}</span><br>
        <input type = "submit" value = "提交"><br>
    </form>
    <span>${msg6}</span><br>
</body>
</html>
