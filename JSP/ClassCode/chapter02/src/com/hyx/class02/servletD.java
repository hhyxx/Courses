package com.hyx.class02;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet( // 必须配置,否则404错误,servlet 容器读取不到相关信息
		loadOnStartup=0, // 表示服务器启动的时候是否加载，   
		value = { "/servletD" },  
		name="HouyuxuanServlet2"
		)
public class servletD extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public servletD() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("跳转到了ServletD");
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
