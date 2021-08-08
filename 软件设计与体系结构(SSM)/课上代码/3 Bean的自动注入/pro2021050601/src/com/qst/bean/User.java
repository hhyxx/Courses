package com.qst.bean;

import org.springframework.stereotype.Component;

@Component
public class User {
	
	private int id;
	private String name;
	private String pwd;
	private String email;
	private int money;
	
	public User() {
		System.out.println("创建User对象");
	}
	
	public User(int id, String name, String pwd, String email, int money) {
		super();
		this.id = id;
		this.name = name;
		this.pwd = pwd;
		this.email = email;
		this.money = money;
	}

	public void add() {
		System.out.println("Add...");
	}

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

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", pwd=" + pwd + ", email=" + email + ", money=" + money + "]";
	}
	
}
