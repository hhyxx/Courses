package com.hyx.filter;

import java.io.IOException;

import javax.servlet.DispatcherType;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter(
	dispatcherTypes = {
		DispatcherType.REQUEST,
		DispatcherType.FORWARD,
		DispatcherType.INCLUDE,
		DispatcherType.ERROR,
	}
	,
	urlPatterns = {"/manage/*"} ,
	servletNames = {
		"com.hyx.servlet.CompanyAddServlet",
		"com.hyx.servlet.UserAddServlet",
		"com.hyx.servlet.ResumeServlet",
	}
)

public class AuthorityFilter implements Filter {
    public AuthorityFilter() {}
	public void destroy() {}	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		HttpSession session = req.getSession();
		
		// 登陆就放行
		if("/UserServlet".equals(req.getServletPath()) && "type=login".equals(req.getQueryString())) {
			chain.doFilter(request, response);
			return;
		}	
		
		// 是否已经登陆，未登陆跳转登陆页面
		if(session.getAttribute("SESSION_USER") == null) {
			resp.sendRedirect(req.getContextPath() + "/login.html");
		} else {
			chain.doFilter(request, response);
		}
		
		System.out.println("filter execute");
	}

	public void init(FilterConfig fConfig) throws ServletException {
		System.out.println("start filter");
	}
}


