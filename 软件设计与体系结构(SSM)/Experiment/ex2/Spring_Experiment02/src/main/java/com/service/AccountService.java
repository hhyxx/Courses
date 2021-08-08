package com.service;

import com.bean.Account;

public interface AccountService {
    public int queryRest(int id);
    public boolean transferAtoB(int A, int B, int balance);
    public boolean TakeAway(int id, int balance);
    public boolean PutIn(int id, int balance);
}
