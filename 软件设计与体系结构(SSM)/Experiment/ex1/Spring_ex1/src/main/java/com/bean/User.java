package com.bean;

public class User {
	private Integer uid;
	private String uname;
	private String usex;
	
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	
	public User() {
		super();
	}
	public User(int uid, String uname, String usex) {
		super();
		this.uid = uid;
		this.uname = uname;
		this.usex = usex;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getUsex() {
		return usex;
	}

	public void setUsex(String usex) {
		this.usex = usex;
	}
	
}
