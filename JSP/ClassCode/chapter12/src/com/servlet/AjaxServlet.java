package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
@WebServlet("/AjaxServlet")
public class AjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AjaxServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		Map<String, String> mp = new HashMap<String ,String>();
		mp.put("0532", "{\"province\":\"山东\",\"city\":\"青岛\"}");
		mp.put("0502", "{\"province\":\"山东\",\"city\":\"济南\"}");
		String zipcd = request.getParameter("zipcode");
		
		String res = mp.get(zipcd);
		
		if(res == null) {
			res = "{\"province\":\"error\",\"city\":\"error\"}";
		}
		response.getWriter().write(res);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
