package com.hyx.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hyx.javabean.User;
import com.hyx.service.UserService;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public UserServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter(); 
		
		
		String op = request.getParameter("type");
		
		if( op.equals("login") ) {
			// 收集信息
			String uname = "", pwd = "", verifyCode = "";
			uname = request.getParameter("userLogname");
			pwd = request.getParameter("userPwd");
			verifyCode = request.getParameter("validateCode");;
			
			// 调用service
			UserService service = new UserService();
			User user = service.login(uname, pwd);
			
			String sessionValidateCode = (String)request.getSession().getAttribute("SESSION_VALIDATECODE");
			if(!sessionValidateCode.equals(verifyCode)){
				out.print("<script type='text/javascript'>");
				out.print("alert('请正确输入验证码！');");
				System.out.print(sessionValidateCode + '\n');
				System.out.print(verifyCode);
				out.print("window.location='login.html';");
				out.print("</script>");
			} 
			else {
				if(user != null) {
					request.getSession().setAttribute("SESSION_USER", user);  // 写入
					response.sendRedirect("manage/main.html");
				} 
				else {
					out.print("<script type = 'text/javascript'> ");
					out.print("alert('用户名或密码错误重新输入！');");
					out.print("window.location = 'login.html';");
					out.print("</script>");
				}
			}
		} 
		 
		else if( op.equals("logout")){
			// 销毁 session
			out.print("<script type = 'text/javascript'> ");
			out.print("alert('111111111');");
			out.print("window.location = 'main.html';");
			out.print("</script>");
			request.getSession().invalidate();
			response.sendRedirect("login.html");
		}
		else {
			out.print("<script type = 'text/javascript'> ");
			out.print("alert('操作有误！');");
			out.print("window.location = 'login.html';");
			out.print("</script>");
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}