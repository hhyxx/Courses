package com.qst.test;

import java.beans.PropertyVetoException;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import com.qst.bean.User;
import com.qst.dao.UserDao;

public class Test {
	

	public static void main2(String[] args) {
	     ApplicationContext ac = new ClassPathXmlApplicationContext("1.xml");	
	     UserDao ud = (UserDao)ac.getBean("userDaoImpl");
//	     System.out.println(ud.transfer(1,2,100));
	     System.out.println(ud.queryByNamePwd("a", "222"));
	}
	
	
	public static void main1(String[] args) throws SQLException {
		ApplicationContext ctx = new ClassPathXmlApplicationContext("1.xml");		
		JdbcTemplate jt = (JdbcTemplate)ctx.getBean("jt");
		System.out.println(jt);

	}

}
