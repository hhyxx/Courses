package com.qst.service;

import com.qst.bean.User;

public interface UserService {
	
	void add(User u);
	void del(int id);
	void modify(User u);
	User findById(int id);

}
