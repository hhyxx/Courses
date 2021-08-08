package com.service;


import com.bean.Account;
import com.dao.AccountDao;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Repository;

@Repository
public class AccountServiceImpl implements AccountService{
    static ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("spring/ApplicationContext.xml");
    static AccountDao ad = (AccountDao) ctx.getBean("accountDaoImpl");

    public int queryRest(int id) {
        return ad.query(id).getBalance();
    }
    public boolean transferAtoB(int A, int B, int balance) {
        return ad.transfer(A, B, balance);
    }
    public boolean TakeAway(int id, int balance) {
        Account a = ad.query(id);
        int tmp = a.getBalance();
        a.setBalance(tmp - balance);
        return ad.modify(a);
    }
    public boolean PutIn(int id, int balance) {
        Account a = ad.query(id);
        int tmp = a.getBalance();
        a.setBalance(tmp + balance);
        return ad.modify(a);
    }
}

