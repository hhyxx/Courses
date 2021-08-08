package com.qst.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.qst.bean.User;
import com.qst.dao.UserDao;

@Service(value="myUserServiceImpl")
public class UserServiceImpl implements UserService {
		
	public UserServiceImpl() {
		System.out.println("创建UserServiceImpl对象");
	}
	
	@Autowired
	@Qualifier("ud1")
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
