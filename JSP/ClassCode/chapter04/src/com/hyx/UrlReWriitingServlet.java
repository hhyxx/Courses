package com.hyx;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/UrlReWriitingServlet")
public class UrlReWriitingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UrlReWriitingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		// 获取会话对象
		HttpSession session = request.getSession();

		// 对CommonServlet和UseRedirectServlet两个请求地址进行URL重写
		String link1 = response.encodeURL("a.html");
		String link2 = response.encodeURL("UseRedirectServlet");
		// 使用超链接形式对URL重写地址进行请求
		out.println("<a href='" + link1 + ""
				+ "'>对一个普通Servlet的请求</a>");
		out.println("<a href='" + link2 + "'>对一个含有重定向代码的Servlet的请求</a>");
	}

}
