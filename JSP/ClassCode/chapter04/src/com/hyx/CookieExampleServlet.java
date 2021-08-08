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


@WebServlet("/CookieExampleServlet")
public class CookieExampleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CookieExampleServlet() {
        super();
       
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String nowdate = sdf.format(new Date());
		
		PrintWriter out = response.getWriter();
		
		String lastVisitTime = "";
		int VisitCount = 0;
		
		Cookie []cookies = request.getCookies();
		if(cookies != null) {
			for(Cookie it : cookies) {
				if( it.getName().equals("lastVisitTime")) {
					lastVisitTime = it.getValue();
				}
				else if( it.getName().equals("VisitCount")) {
					VisitCount = Integer.valueOf( it.getValue());
				}
			}
		}
		if(!lastVisitTime.equals("")) {
			out.println("上一次的访问时间是："+ lastVisitTime +"\n");
		}
//		VisitCount = VisitCount + 1;
		out.println("访问次数是：" + (VisitCount+1) + "\n");
		Cookie nowLast = new Cookie("lastVisitTime", nowdate);
		nowLast.setMaxAge(365 * 24 * 60 * 60);
		Cookie nowCount = new Cookie("VisitCount", String.valueOf(VisitCount + 1));
		nowCount.setMaxAge(365*24*60*60);
		response.addCookie(nowLast);
		response.addCookie(nowCount);
	}

}
