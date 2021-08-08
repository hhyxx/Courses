package com.qst.dao;

import org.springframework.stereotype.Component;

import com.qst.bean.User;

//假设该UserDaoImpl连接oracle数据库

@Component(value="ud2")
public class UserDaoImpl2 implements UserDao {

	public void add(User u) {		
		System.out.println("add User22222222222");		
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