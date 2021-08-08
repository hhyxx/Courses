package com.hyx.class02;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// http://localhost:8080:/jsp02/test2
@WebServlet("/LinkRequestServlet")
public class LinkRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public LinkRequestServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uname = request.getParameter("uname"); // 传回的键的信息
		response.getWriter().write("uname = " + uname);
		String pwd = request.getParameter("pwd"); // 传回的键的信息
		response.getWriter().write("\npassword = " + pwd+"\n");
		String []hobby = request.getParameterValues("hobby");
		// 空指针、数组越界
		response.getWriter().write(hobby[0] + "\n");
		response.getWriter().write(hobby[1] + "\n");
		response.getWriter().write(hobby[2] + "\n");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
