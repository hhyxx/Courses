package com.qst.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.qst.bean.User;
import com.qst.bean.User2;

@Controller
@RequestMapping("/my4")
public class MyController4 {

	@RequestMapping(value="/f1")
	public void f1(String name, String pwd, String email, String role) {
		User u = new User();
		u.setName(name);
		u.setPwd(pwd);
		u.setEmail(email);
		u.setRole(role);
		System.out.println(u);		
	}
	
	@RequestMapping(value="/f2")
	public void f2(User u) {
		System.out.println(u);		
	}
	
	@RequestMapping(value="/f3")
	public void f3(User2 u) {
		System.out.println(u);		
	}
	
	@ModelAttribute
	public User2 f33() {
		System.out.println("call f33(), construct User2");
		User2 u = new User2();
		u.setId(1000);
		u.setName("张三");
		u.setPwd("111");
		System.out.println("in f33(),user="+u);
		return u;
	}
	
	
}








