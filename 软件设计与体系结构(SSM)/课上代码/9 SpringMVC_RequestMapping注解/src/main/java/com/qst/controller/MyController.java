package com.qst.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MyController {
	
	@RequestMapping(value="/f1",method=RequestMethod.POST,params= {"name=abc","pwd"})
	public String f1() {
		System.out.println("f1");
//		逻辑视图名                 物理视图
//		1.jsp  对应           webapp/1.jsp
		return "1.jsp";
	}
	
	@RequestMapping(value="/f2")
	public String f2() {
		System.out.println("f2");
//		逻辑试图名                   物理视图
//		2.jsp  对应            /WEB-INF/view/2.jsp
		return "/WEB-INF/view/2.jsp";
	}
	
	@RequestMapping(value="/f3")
	public String f3() {
		System.out.println("f3");
		return "2";
	}
	
	@RequestMapping(value="/f4")
	public String f4(HttpServletRequest req, HttpServletResponse res) {
		System.out.println("f4");
		System.out.println("req="+req);
		System.out.println("res="+res);
		System.out.println(req.getParameter("name"));
		return "2";
	}
	
	@RequestMapping(value="/f5")
	public ModelAndView f5() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("2");
		return mv;
	}
	
	@RequestMapping(value="/f6")
	public ModelAndView f6() {
		System.out.println("f6");
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", "hello SpringMVC");
		mv.setViewName("2");
		return mv;
	}
	
	@RequestMapping(value="/f7")
	public String f7() {
		System.out.println("f7");
//		return "forward:2";//报错
//		return "forward:f6";//正确
		return "redirect:f6";
	}
	
	@RequestMapping(value="/f8")
	public void f8(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		System.out.println("f8");
		
//		System.out.println("使用Servlet api进行转发");
//		req.getRequestDispatcher("/WEB-INF/view/2.jsp").forward(req, res);

		System.out.println("使用SpringMVC进行转发");
		req.getRequestDispatcher("f6").forward(req, res);
	}
	
	@RequestMapping(value="/f9")
	public void f9(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
//		System.out.println("使用Servlet api进行重定向，报错");	
//		res.sendRedirect("/WEB-INF/view/2.jsp");
		
		System.out.println("使用SpringMVC进行重定向");
		res.sendRedirect("f6");
	}
}











































