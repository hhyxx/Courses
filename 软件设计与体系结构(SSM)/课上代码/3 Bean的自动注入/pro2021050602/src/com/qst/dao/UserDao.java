package com.qst.dao;

import com.qst.bean.User;

public interface UserDao {
	
	void add(User u);
	void del(int id);
	void modify(User u);
	User findById(int id);
	
}
