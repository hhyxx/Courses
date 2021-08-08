package com.hyx.class02;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet(
		name="houyuxuan_servlet",
		urlPatterns={"/FormRequestServlet"},
		loadOnStartup=0
)
public class FormRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FormRequestServlet() {
        super();
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 设置响应的文本类型为HTML，字符编码为UTF-8
		request.setCharacterEncoding("utf-8"); // 通过URL传递参数必须使用 GET 方法
		response.setContentType("text/html;charset=UTF-8");
		
		// 2. 获取请求数据
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String[] channel = request.getParameterValues("channel");
		Enumeration<String> elem = request.getParameterNames();
		
		// 3. 获取输出流
		PrintWriter out = response.getWriter();
		
		// 4. 响应输出数据
		out.print("<p>注册的用户名是："+username+"</p>");
		out.print("<p>注册的密码是："+password+"</p>");
		out.print("<p>注册的信息来源是：");
		for(String c:channel)
			out.print(c+"&nbsp;");
		out.print("</p><p>所有客户请求的参数名是：");
		while(elem.hasMoreElements())
			out.print(elem.nextElement()+"&nbsp;");
		out.print("</p>");
		out.flush();
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
