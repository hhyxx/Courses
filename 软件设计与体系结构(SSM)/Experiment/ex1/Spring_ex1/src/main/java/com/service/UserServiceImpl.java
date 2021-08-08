package com.service;

import com.bean.User;
import com.dao.UserDao;
import com.dao.UserDaoImpl;

public class UserServiceImpl implements UserService{
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
	public void delete(int id) {
		ud.delete(id);
	}
	public void modify(User u) {
		ud.modify(u);
	}
	public User query(int id) {
		return ud.query(id);
	}	
}
