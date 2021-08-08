package com.dao;

import com.bean.Account;

import java.util.List;

public interface AccountDao{
    public boolean add(Account u);
    public boolean delete(int id);
    public boolean modify(Account u);
    public Account query(int id);
    public List<Account> queryAll();
    public boolean transfer(int from, int to, int money);
}
