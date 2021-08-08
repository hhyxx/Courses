package com.qst.test;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.qst.dao.Dept1Mapper;
import com.qst.dao.Emp1Mapper;


public class Test {
	
	public static void main(String[] args) throws IOException {		
		String fileName = "mybatisConfig.xml";		
		InputStream in = Resources.getResourceAsStream(fileName);		
		SqlSessionFactory f = new SqlSessionFactoryBuilder().build(in);		
		SqlSession s = f.openSession(true);				
		Emp1Mapper em = s.getMapper(Emp1Mapper.class);
//		System.out.println(em.queryEmp1ById(7369));		
		System.out.println(em.queryEmp1ById(7369).getEname());		
	}

	
	
	public static void main1(String[] args) throws IOException {		
		String fileName = "mybatisConfig.xml";		
		InputStream in = Resources.getResourceAsStream(fileName);		
		SqlSessionFactory f = new SqlSessionFactoryBuilder().build(in);		
		SqlSession s = f.openSession(true);				
		Dept1Mapper dm = s.getMapper(Dept1Mapper.class);
		System.out.println(dm.queryDept1ById(10));		
	}
	
}





