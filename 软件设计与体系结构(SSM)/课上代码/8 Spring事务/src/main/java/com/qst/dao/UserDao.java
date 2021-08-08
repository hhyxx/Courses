package com.qst.dao;

import java.util.List;

import com.qst.bean.User;

public interface UserDao {
	public boolean add(User u);
	public boolean del(int id);
	public boolean modify(User u);
	public User queryByNamePwd(String name, String pwd);
	public List<User> queryAll();
	public boolean transfer(int from, int to, int money);
}

