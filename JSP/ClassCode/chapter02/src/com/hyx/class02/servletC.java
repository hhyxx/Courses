package com.hyx.class02;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet( // 必须配置,否则404错误,servlet 容器读取不到相关信息
		loadOnStartup=0, // 表示服务器启动的时候是否加载，   
		value = { "/servletC" },  
		name="HouyuxuanServlet2"
		)
public class servletC extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public servletC() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 将attrobj属性值test存储到request对象中
		request.setAttribute("attrobj", "test");
		System.out.println("请求转发前");
		RequestDispatcher dispatcher = request
				.getRequestDispatcher("/servletD");
		dispatcher.forward(request, response);
		System.out.println("请求转发后");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
