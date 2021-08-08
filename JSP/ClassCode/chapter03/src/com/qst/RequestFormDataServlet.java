package com.qst;

import java.awt.print.Printable;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/RequestFormDataServlet")
public class RequestFormDataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public RequestFormDataServlet() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; utf-8");
		
		String uname = request.getParameter("uname");
		String password = request.getParameter("pwd");
		System.out.println(uname);
		
		PrintWriter out = response.getWriter();
		out.write(uname+"<br>");
		out.write(password + "<br>");
	}
}
