package com.qst;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ContextAppinfoServlet")
public class ContextAppinfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ContextAppinfoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 设置编码
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8"); // 生成页面的字符集

		// 获得Context 对象
		ServletContext context = this.getServletContext();

		// 调用方法
		String path = context.getContextPath();
		String name = context.getServletContextName();
		RequestDispatcher disp = context.getNamedDispatcher("hallo");
		disp.forward(request, response);
		System.out.println(path + "\n");
		System.out.println(name);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	public static void main(String[] args) {
		System.out.println("test");
	}
}
