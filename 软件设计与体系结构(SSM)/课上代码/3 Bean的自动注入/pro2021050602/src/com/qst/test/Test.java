package com.qst.test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.qst.service.UserService;

public class Test {
	
	public static void main(String[] args) {
		
		ApplicationContext ctx = new ClassPathXmlApplicationContext("1.xml");
//		UserService us =  (UserService)ctx.getBean("userServiceImpl");
		UserService us =  (UserService)ctx.getBean("myUserServiceImpl");
		us.add(null);
		
	}
	
	
}









