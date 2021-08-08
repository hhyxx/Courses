package com.qst.test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.qst.bean.User;
import com.qst.dao.UserDao;
import com.qst.dao.UserDaoImpl2;
import com.qst.service.UserServiceImpl;

public class Test {
	
	public static void main(String[] args) {
		
		ApplicationContext ctx = new ClassPathXmlApplicationContext("5.xml");		
		UserDaoImpl2 ud =  (UserDaoImpl2)ctx.getBean("myUserDaoImpl2");

		System.out.println(ud);
	}
	
	
	
	public static void main5(String[] args) {
	
		ApplicationContext ctx = new ClassPathXmlApplicationContext("4.xml");		
		UserServiceImpl us =  (UserServiceImpl)ctx.getBean("myUserService");
//		UserDao ud = (UserDao)ctx.getBean("myUserDao");
//		us.setUd(ud);
		us.add(null);		
	}
	
	
	public static void main4(String[] args) {
		
		ApplicationContext ctx = new ClassPathXmlApplicationContext("3.xml");
		User u1 = (User)ctx.getBean("myUser1");
		System.out.println(u1);
		
		User u2 = (User)ctx.getBean("myUser2");
		System.out.println(u2);		
		
	}
	
	public static void main3(String[] args) {
		
//		1、Spring的构造方法注入，类似
		User u1 = new User(1,"admin","123","123@qq.com",100);
		
//		2、Spring的属性注入，类似
//		User u2 = new User();
//		等效<bean id="myUser2" class="com.qst.bean.User"></bean>
		User u2 = new User();
		u2.setId(2);
		u2.setName("abc");
		
		
//	<bean id="myUser2" class="com.qst.bean.User">
//		<property name="id" value="4"></property>
//		<property name="money" value="1000"></property>
//	</bean>
//		等效
//		User u2 = new User();
//		u2.setId(2);
//		u2.setName("abc");

		

	}
	
	public static void main2(String[] args) {			
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("1.xml"); 
		User u = (User)ctx.getBean("myUser1");
		u.add();
	}
	
	public static void main1(String[] args) {		
		User u = new User();		
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("1.xml"); 
		UserServiceImpl us = (UserServiceImpl)ctx.getBean("MyUserService");	
		UserDao ud = (UserDao)ctx.getBean("MyUserDao");			
		us.setUd(ud);
		us.add(u);
	}
	
	
}









