<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.bean.User" import="java.util.*" import="com.bean.User" import = "com.service.UserService"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
</head>
<body>
	<form action="login.jsp" method="post">
		<p>
			用户名：<input name="username" type="text">
		</p>
		<p>
			密&nbsp;&nbsp;码：<input name="password" type="password">
		</p>
		<p>
			<input name="submit" type="submit" value="登录">
		</p>
	</form>
	
	<%
		//获取留言信息
		request.setCharacterEncoding("UTF-8");
		String username = request.getParameter("username");
		String pwd = request.getParameter("password");
		UserService service = new UserService();
		 
		if(username != null && pwd != null){
			boolean flag = service.login(username, pwd);
		 	if(flag) {
				
		 		Vector<String> book = (Vector<String>) application.getAttribute("userlist"); 
				if (book == null)
					book = new Vector<String>();
				
				if (username != null && pwd != null) {
					String info = username + "#" + pwd;
					book.add(info);
					application.setAttribute("userlist", book);
				}
				//遍历显示出所有的用户留言
				if (book.size() > 0) {
					for (String usr : book) {
						String[] arr = usr.split("#");
						out.print("<p>用户名：" + arr[0] + "</p>");
					}
				} 
			}
			else {
				out.print("<script type = 'text/javascript'> ");
				out.print("alert('用户名或密码错误重新输入！');");
				out.print("window.location = 'login.jsp';");
				out.print("</script>");
			}
		}
		
%>
</body>
</html>
</html>