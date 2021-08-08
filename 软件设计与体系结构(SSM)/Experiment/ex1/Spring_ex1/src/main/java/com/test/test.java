package com.test;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.bean.User;
import com.dao.UserDao;
import com.service.UserService;
import com.service.UserServiceImpl;

public class test {
	public static void main(String[] args) {
		User add = new User(5, "侯宇轩", "男");
		int delete = 2;
		User modify = new User(3, "李刚", "男");
		int query = 5;
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("ApplicationContext.xml");
		UserServiceImpl us = (UserServiceImpl)ctx.getBean("MyUserService");
		UserDao ud = (UserDao)ctx.getBean("MyUserDao");
		us.setUd(ud);
		
		// 执行插入操作
//		us.add(add);
		
		// 执行删除操作
//		us.delete(delete);
//		// 执行修改操作
//		us.modify(modify);
//		// 执行查询操作
		User res = us.query(query);
		System.out.println("id is : " + res.getUid());
		System.out.println("name is : " + res.getUname() );
		System.out.println("sex is : " + res.getUsex());
	}
}
