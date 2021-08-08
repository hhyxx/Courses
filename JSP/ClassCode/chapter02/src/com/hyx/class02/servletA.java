package com.hyx.class02;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet( // 必须配置,否则404错误, servlet 容器读取不到相关信息
		loadOnStartup=0, // 表示服务器启动的时候是否加载
		value = { "/servletA" },  
		name="HouyuxuanServlet1"
	)
public class servletA extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public servletA() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		// 把 attrobj 属性值 test 存储到 request 对象中
		request.setAttribute("attrobj", "test");
		System.out.println("重定向前");
		// 进行重定向
		response.sendRedirect(request.getContextPath() + "/ServletB");
		System.out.println("重定向后");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
