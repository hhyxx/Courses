package com.controller;

import com.bean.Account;
import com.dao.AccountDao;
import com.service.AccountService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class test {
    public static void main(String[] args) {
        ApplicationContext ctx = new ClassPathXmlApplicationContext("spring/ApplicationContext.xml");
        AccountService as = (AccountService) ctx.getBean("accountServiceImpl");

        System.out.println("存入前余额为：    " + as.queryRest(1));
        as.PutIn(1, 100);
        System.out.println("存入前余额为：    " + as.queryRest(1));

        System.out.println("取出前余额为：    " + as.queryRest(1));
        as.TakeAway(1, 100);
        System.out.println("取出后余额为：    " + as.queryRest(1));

        System.out.println("转账前 A 账户金额为：  " + as.queryRest(1) + "   转账前 B 账户金额为：  " + as.queryRest(2));
        as.transferAtoB(1, 2, 100);
        System.out.println("转账后 A 账户金额为：  " + as.queryRest(1) + "   转账后 B 账户金额为：  " + as.queryRest(2));
    }
}
