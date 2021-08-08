package com.qst;

import java.io.IOException;
import java.io.InputStream;
import java.net.URL;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ContextFileResourceServlet")
public class ContextFileResourceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;  
    public ContextFileResourceServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext context = request.getServletContext();
		InputStream a = context.getResourceAsStream("/images/....");
		URL url = context.getResource("/images/....");
		InputStream b = url.openStream();
		boolean isequal = a.available() == b.available();
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
