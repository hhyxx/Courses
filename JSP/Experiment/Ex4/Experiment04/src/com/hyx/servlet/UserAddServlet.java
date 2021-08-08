package com.hyx.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hyx.javabean.User;
import com.hyx.service.UserService;

@WebServlet("/UserAddServlet")
public class UserAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public UserAddServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 设置编码
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		
		// 读取信息
		String userLogname = request.getParameter("userLogname");
		String userPwd = request.getParameter("userPwd");
		String userRealname = request.getParameter("userRealname");
		String userEmail = request.getParameter("userEmail");
		int userRole=(request.getParameter("userRole")==null)?3:Integer.parseInt(request.getParameter("userRole"));
		int userState=(request.getParameter("userState")==null)?1:Integer.parseInt(request.getParameter("userState"));
		
		User user=new User(userLogname,userPwd,userRealname,userEmail,userRole,userState);	
		// 调用业务层
		UserService userService=new UserService();
		boolean flag=userService.addUser(user);
		
		// 根据结果跳转到不同的页面
		if(flag) {
			response.sendRedirect("manage/userList.html"); 
			// 相对的是当前的 servlet 的根路径，即应用的根路径 Webcontent
		} else {
			response.getWriter().write("<script>alert('插入失败');location='manage/userList.html';</script>");
			// 浏览器的路径是
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
