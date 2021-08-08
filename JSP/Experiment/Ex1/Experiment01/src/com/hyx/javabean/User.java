package com.hyx.javabean;

public class User {
	private String userId;
	private String userLogname;
	private String userPwd;
	private String userRealname;
	private String userEmail;
	private int userRole;
	private int userState;
	public User() {
		
	}
	// 带 id 的构造，查询使用
	public User(String userLogname, String userPwd, String userRealname, String userEmail, int userRole,
			int userState) {
		super();
		this.userLogname = userLogname;
		this.userPwd = userPwd;
		this.userRealname = userRealname;
		this.userEmail = userEmail;
		this.userRole = userRole;
		this.userState = userState;
	}

	// 不带 id 的构造，插入的时候数据库表记录自增
	public User(String userId, String userLogname, String userPwd, String userRealname, String userEmail, int userRole,
			int userState) {
		super();
		this.userId = userId;
		this.userLogname = userLogname;
		this.userPwd = userPwd;
		this.userRealname = userRealname;
		this.userEmail = userEmail;
		this.userRole = userRole;
		this.userState = userState;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserLogname() {
		return userLogname;
	}

	public void setUserLogname(String userLogname) {
		this.userLogname = userLogname;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserRealname() {
		return userRealname;
	}

	public void setUserRealname(String userRealname) {
		this.userRealname = userRealname;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public int getUserRole() {
		return userRole;
	}

	public void setUserRole(int userRole) {
		this.userRole = userRole;
	}

	public int getUserState() {
		return userState;
	}

	public void setUserState(int userState) {
		this.userState = userState;
	}

	
}
