package com.hyx.service;
import com.hyx.dao.UserDao;
import com.hyx.javabean.User;

public class UserService {
	public boolean addUser(User user) {
		// 进行业务处理
		// 调用DAO实现数据插入
		UserDao userDao=new UserDao();
		boolean flag=userDao.insert(user);
		return flag;
	}
}