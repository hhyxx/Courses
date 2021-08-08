package com.qst.bean;

import org.hibernate.validator.constraints.NotBlank;

public class User {
	private int id;
	
	@NotBlank(message="用户名不能为空！")
	private String name;
	
	@NotBlank(message="密码不能为空！")
	private String pwd;
	
	private String email;
	private String role;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", pwd=" + pwd + ", email=" + email + ", role=" + role + "]";
	}
	
}
