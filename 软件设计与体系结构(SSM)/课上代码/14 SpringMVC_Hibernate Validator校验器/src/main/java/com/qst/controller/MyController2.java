package com.qst.controller;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
		
	
}











































