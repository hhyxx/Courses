package com.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.JavaBean.Area;

@WebServlet("/JackonServlet")
public class JackonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public JackonServlet() {
        super();

    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		Map<String, Area> mp = new HashMap<String ,Area>();
		Area area1 = new Area("0531", "山东", "济南");
		Area area2 = new Area("0532", "山东", "青岛");
		Area area3 = new Area("0533", "山东", "曹县");
		mp.put("0531", area1);
		mp.put("0532", area2);
		mp.put("0533", area3);
		String zipcd = request.getParameter("zipcode");
		Area ans = mp.get(zipcd);
		if(ans == null) {
			ans = new Area("", "未知", "未知");
		}
		
		ObjectMapper mapper = new ObjectMapper(); 
		response.writeValue(response.getWriter(), ans);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
