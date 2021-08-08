package com.qst.bean;

import java.util.Date;

public class User4 {	
	private String name;
	private String pwd;
	private Date birthday;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	@Override
	public String toString() {
		return "User4 [name=" + name + ", pwd=" + pwd + ", birthday=" + birthday + "]";
	}	
}
