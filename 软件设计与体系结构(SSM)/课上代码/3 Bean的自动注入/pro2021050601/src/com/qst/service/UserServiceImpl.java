package com.qst.service;

import com.qst.bean.User;
import com.qst.dao.UserDao;
import com.qst.dao.UserDaoImpl;

public class UserServiceImpl implements UserService {
	
	public UserServiceImpl() {
		System.out.println("创建UserServiceImpl对象");
	}

//	UserDao ud = new UserDaoImpl();
	
//	UserDao ud = new UserDaoImpl2();
	
	UserDao ud; 
		
	public UserDao getUd() {
		return ud;
	}

	public void setUd(UserDao ud) {
		this.ud = ud;
	}

	public void add(User u) {
		ud.add(u);
	}

	public void del(int id) {
		ud.del(id);
	}

	public void modify(User u) {
		ud.modify(u);
	}

	public User findById(int id) {		
		return ud.findById(id);
	}

}
