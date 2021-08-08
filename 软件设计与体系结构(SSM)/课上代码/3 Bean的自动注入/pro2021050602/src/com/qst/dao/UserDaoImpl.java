package com.qst.dao;

import org.springframework.stereotype.Component;

import com.qst.bean.User;

//假设该UserDaoImpl连接mysql数据库

@Component(value="ud1")
public class UserDaoImpl implements UserDao {
	
	public UserDaoImpl() {
		System.out.println("创建UserDaoImpl对象");
	}

	public void add(User u) {		
		System.out.println("add User11111111");		
	}

	public void del(int id) {
		// TODO Auto-generated method stub
		
	}

	public void modify(User u) {
		// TODO Auto-generated method stub
		
	}

	public User findById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

}
