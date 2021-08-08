package com.hyx;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/test")
public class test extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public test() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:"
				+ "mm:ss");
		String nowTime = sdf.format(new Date());

		String lastVistTime = "";
		int vistedCount = 0;
		// 获取客户端浏览器保存的所有Cookie
		Cookie[] cookies = request.getCookies();
		
		if (cookies != null)
			for (Cookie cookie : cookies) {
				// 判断是否为记录最近访问时间的Cookie
				if ("lastVistTime".equals(cookie.getName())) {
					lastVistTime = cookie.getValue();
				}
				// 判断是否为记录访问次数的Cookie
				if ("vistedCount".equals(cookie.getName())) {
					vistedCount = Integer.valueOf(cookie.getValue());
				}
			}
		
		// 若曾经访问过，输出上次访问时间
		if (!"".equals(lastVistTime))
			out.println("您上一次的访问时间是：" + lastVistTime);
		// 输出访问次数
		out.println("您是第" + (vistedCount + 1) + "次访问本网站");
		// 以本次访问时间重建同名新Cookie
		Cookie lastVistTimeC = new Cookie("lastVistTime", nowTime);
		// 设置最大存活时间：一年
		lastVistTimeC.setMaxAge(365 * 24 * 60 * 60);
		// 以新访问次数重建同名新Cookie
		Cookie visitCountC = new Cookie("vistedCount",
				String.valueOf(vistedCount + 1));
		// 设置最大存活时间：一年
		visitCountC.setMaxAge(365 * 24 * 60 * 60);
		// 将上述新建Cookie响应到客户端
		response.addCookie(lastVistTimeC);
		response.addCookie(visitCountC);
	}
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
