package com.qst.dao;

import java.util.List;

import com.qst.bean.User;

public interface UserDao {
	
	void addUser(User u);
	void delUser(int id);
	void modifyUser(User u);
	User queryUserById(int id);
	List<User> queryAll();

}

















