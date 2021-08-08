package com.qst.dao;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import com.qst.bean.User;

//假设该UserDaoImpl连接oracle数据库

public class UserDaoImpl2 implements UserDao {
	
	private String[] myStrs;
	private List<String> myList;
	private Set<String> mySet;
	private Map<String,String> myMap;
	private Properties myProps;		
	
	public String[] getMyStrs() {
		return myStrs;
	}

	public void setMyStrs(String[] myStrs) {
		this.myStrs = myStrs;
	}

	public List<String> getMyList() {
		return myList;
	}

	public void setMyList(List<String> myList) {
		this.myList = myList;
	}

	public Set<String> getMySet() {
		return mySet;
	}

	public void setMySet(Set<String> mySet) {
		this.mySet = mySet;
	}

	public Map<String, String> getMyMap() {
		return myMap;
	}

	public void setMyMap(Map<String, String> myMap) {
		this.myMap = myMap;
	}

	public Properties getMyProps() {
		return myProps;
	}

	public void setMyProps(Properties myProps) {
		this.myProps = myProps;
	}

	@Override
	public String toString() {
		return "UserDaoImpl2 [myStrs=" + Arrays.toString(myStrs) + ", myList=" + myList + ", mySet=" + mySet
				+ ", myMap=" + myMap + ", myProps=" + myProps + "]";
	}

	public void add(User u) {		
		System.out.println("add User22222222222");		
	}

	public void del(int id) {
		// TODO Auto-generated method stub
		
	}

	public void modify(User u) {
		// TODO Auto-generated method stub
		
	}

	public User findById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

}