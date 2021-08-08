package com.service;

import com.bean.User;

public interface UserService {
	public void add(User u);
	public void delete(int id);
	public void modify(User u);
	public User query(int id);
}
