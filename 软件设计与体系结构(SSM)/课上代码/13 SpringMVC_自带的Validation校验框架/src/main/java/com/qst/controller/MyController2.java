package com.qst.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;

import com.qst.bean.User;
import com.qst.bean.UserValidator;

@Controller
public class MyController2 {
	
	@RequestMapping("/login1")
	public String login1() {
		System.out.println("111111");
		return "success3.jsp";
	}
	
//	1、使用字符串返回逻辑视图名，使用Model存储数据，并使用EL表达式查看
	@RequestMapping("/login2")
	public String login2(User u, Model m) {
		System.out.println("222222");
		if(u.getName().length()==0) 
			m.addAttribute("msg1","用户名不能为空");	
		if(u.getPwd().length()==0) 
			m.addAttribute("msg2","密码不能为空");	
		if((u.getName().length()==0)||(u.getPwd().length()==0) )	
			return "relogin.jsp";
		else
			return "success3.jsp";
	}
	
//	2、使用字符串返回逻辑视图名，使用Model存储数据，并使用Spring标签库查看
	@Autowired
	@Qualifier("userValidator")
	private UserValidator userValidator;	
	@RequestMapping("/login3")
	public String login3(User user, Model model, Errors errors) {
		System.out.println("3333333");
		model.addAttribute("user", user);
		userValidator.validate(user, errors);
		if(errors.hasErrors()) {
			System.out.println("has errors");
			return "relogin2.jsp";
		}			
		else
			return "success3.jsp";
	}
	
	
}











































