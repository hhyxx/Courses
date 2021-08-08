package com.qst.test;

import com.qst.dao.UserDao;
import com.qst.dao.UserDaoImpl;

public class Test {

	public static void main(String[] args) {
	     UserDao ud = new UserDaoImpl();
	     System.out.println(ud.transfer(1, 2, 100));
	}
	
}





