package com.qst;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ContextLogInfoServlet")
public class ContextLogInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ContextLogInfoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext context = request.getServletContext();
		String info = context.getServerInfo();
		int miniver = context.getMinorVersion();
		int mxver = context.getMajorVersion();
		context.log( "selfdefine logs" , new Exception ("error msg"));
		System.out.println( info );
		System.out.println( miniver );
		System.out.println( mxver );
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	public static void main(String[] args) {
		
	}
}
