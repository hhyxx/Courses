package com.qst.test;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.qst.bean.User;
import com.qst.dao.UserDao;

public class Test {
		
	public static void main(String[] args) throws IOException {		
		String fileName = "mybatisConfig.xml";		
		InputStream in = Resources.getResourceAsStream(fileName);		
		SqlSessionFactory f = new SqlSessionFactoryBuilder().build(in);		
		SqlSession s = f.openSession(true);		
		
		UserDao ud = s.getMapper(UserDao.class);
		
//		User u = new User();
//		u.setId(5);
//		u.setName("abc");
//		u.setPwd("222222");
//		ud.modifyUser(u);
		
		System.out.println(ud.queryAll());
//		System.out.println(ud.queryUserById(1));
		
	}

}





