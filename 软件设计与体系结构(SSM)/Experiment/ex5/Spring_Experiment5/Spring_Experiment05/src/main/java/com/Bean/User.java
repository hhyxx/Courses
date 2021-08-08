package com.Bean;

import java.io.Serializable;

public class User implements Serializable { // 实现序列化
    private int uid;
    private String uname;
    private String pwd;
    private String usex;
    private int money;

    public User() {}

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    @Override
    public String toString() {
        return "User{" +
                "uid=" + uid +
                ", uname='" + uname + '\'' +
                ", pwd='" + pwd + '\'' +
                ", usex='" + usex + '\'' +
                ", money=" + money +
                '}';
    }

    public User(String uname, String pwd, String usex, int money) {
        this.uname = uname;
        this.pwd = pwd;
        this.usex = usex;
        this.money = money;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
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

    public int getMoney() {
        return money;
    }

    public void setMoney(int money) {
        this.money = money;
    }
}
