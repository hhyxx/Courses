package com.qst;

import java.awt.print.Printable;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RequestLineServlet")
public class RequestLineServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;   
    public RequestLineServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset = UTF-8");
		
		String method = request.getMethod();
		String uri = request.getRequestURI();
		String protocol = request.getProtocol();
		String queryString = request.getServletPath(); 
		String contextpath = request.getContextPath();
		
		response.getWriter().write("<p>请求的 HTTP 方法: " + method + "</p>");
		response.getWriter().write("<p>请求行中的资源名部分: " + uri + "</p>");
		response.getWriter().write("<p>请求行中的协议及版本号: " + protocol + "</p>");
		response.getWriter().write("<p>请求行中的查询字符串为: " + queryString + "</p>");
		response.getWriter().write("<p>请求行中的Web应用路径: " + contextpath + "</p>");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
