package com.qst.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qst.bean.User;

@Controller
public class MyController2 {
	
	@RequestMapping("/login1")
	public String login1(User u) {
		System.out.println("1111111");
		System.out.println(u);
		return "success.jsp";
	}
	
	@RequestMapping("/login2")
	public String login2(@Valid User u, Errors errors) {
		System.out.println("2222222");
		if(errors.hasErrors()) {
			for(ObjectError e : errors.getAllErrors()) 
				System.out.println(e.getDefaultMessage());
			return "relogin2.jsp";
		}
		return "success.jsp";
	}
	
	@RequestMapping("/login3")
	public String login3(@Valid User u, String str, Errors errors) {
		System.out.println("2222222");
		if(errors.hasErrors()) {
			for(ObjectError e : errors.getAllErrors()) 
				System.out.println(e.getDefaultMessage());
			return "relogin2.jsp";
		}
		return "success.jsp";
	}
	
//	1、传统的Servlet方式
	@RequestMapping("/f1")
	public void f1(HttpServletResponse res) throws IOException {
		String str1 = "{\"name\":\"zhang\",\"email\":\"123@163.com\"}";
		System.out.println(str1);
		res.getWriter().write(str1);
	}
	
//	2、SpringMVC方式
	@RequestMapping("/f2")
	public @ResponseBody String f2() {
		String str1 = "{\"name\":\"zhang\",\"email\":\"456@163.com\"}"	;
		System.out.println(str1);
		return str1;
	}	
	
//	2、SpringMVC+第3方jar包
	@RequestMapping("/f3")
	public @ResponseBody User f3() {
		User u = new User();
		u.setId(1);
		u.setName("admin");
		u.setPwd("123");
		u.setEmail("123456@qq.com");
		u.setRole("管理员");
		return u;
	}
	
	@RequestMapping("/f4")
	public @ResponseBody User f4(@RequestBody User u) {		
		u.setId(1);
		u.setEmail("654321@qq.com");
		u.setRole("管理员");
		System.out.println(u);
		return u;
	}
	
	
	
	
	
}











































