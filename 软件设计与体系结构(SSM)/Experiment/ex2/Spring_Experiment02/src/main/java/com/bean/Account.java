package com.bean;

public class Account {
    private Integer id;
    private String uname;
    private Integer balance;

    public Account() { }

    public Account(Integer id, String uname, Integer balance) {
        this.id = id;
        this.uname = uname;
        this.balance = balance;
    }

    public Integer getId() {
        return id;
    }
    public String getUname() {
        return uname;
    }
    public void setUname(String uname) {
        this.uname = uname;
    }
    public Integer getBalance() {
        return balance;
    }
    public void setBalance(Integer balance) {
        this.balance = balance;
    }
    public void setId(Integer id) {
        this.id = id;
    }
}
