package com.qst;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ContextAttributeServlet")


// 累计页面访问量 

public class ContextAttributeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;  

    public ContextAttributeServlet() {
        super();
        
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 设置编码
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");

		// 读取 count 的值
		ServletContext context=this.getServletContext();
		Integer count= (Integer)context.getAttribute("count");

		// 累加
		if(count==null) count=1;
		else count++; 

		// 存回应用域，自动装拆箱
		context.setAttribute("count", count); 

		// 显示访问量
		response.getWriter().write("<h1>访问次数:"+count+"</h1>");

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}



