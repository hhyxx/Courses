package com.service;
import com.dao.UserDao;
import com.bean.User;
import java.util.*;

public class UserService {
	public boolean login(String uname, String pwd) {
		// 查询验证
		UserDao dao = new UserDao();
		boolean flag = dao.select(uname, pwd);
		return flag;
	}
}