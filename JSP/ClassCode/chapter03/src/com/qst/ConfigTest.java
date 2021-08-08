package com.qst;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(
		name = "houyuxuan",
		urlPatterns = {"/ConfigTest"},
		loadOnStartup = 0
)
public class ConfigTest extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ConfigTest() {
        super();
    }
    public void init(ServletConfig config) throws ServletException {
    	super.init();
    	// 在 Web.xml 文件中设置这两个属性
    	String uname = config.getInitParameter("uname");
    	String pwd = config.getInitParameter("pwd");
    	System.out.println("UserName is : "+uname);
    	System.out.println("UserPassword is : "+pwd);
 
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
