package com.hyx.class02;
import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet( // 必须配置,否则404错误,servlet 容器读取不到相关信息
		loadOnStartup=0, // 表示服务器启动的时候是否加载， 
		asyncSupported = true,  // 异步
//		description = "描述信息", 
//		urlPatterns = { "/test" }
		value = { "/test" }
//		name="HouyuxuanServlet"
		)
public class test extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public test() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	public void init(ServletConfig config) throws ServletException {
		System.out.println("HouyuxuanServlet初始化");
	}
	public void destroy() {
		System.out.println("HouyuxuanServlet销毁");
	}
	
	// 处理 Http get 请求
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().write("HouyuxuanServlet服务中" + "");
	}
	
	// 处理 Http post 请求
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
}
