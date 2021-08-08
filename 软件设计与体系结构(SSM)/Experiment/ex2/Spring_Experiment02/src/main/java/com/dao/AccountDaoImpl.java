package com.dao;

import com.bean.Account;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class AccountDaoImpl implements AccountDao{
    @Autowired
    private JdbcTemplate jt;

    public boolean add(Account a) {
        String sql = "insert into Spring.Account(id, uname, balance) values(?,?,?)";
        Object[] args = {a.getId(), a.getUname(), a.getBalance()};
        return jt.update(sql, args) > 0;
    }
    public boolean delete(int id) {
        String sql = "delete from Spring.Account where id = ?";
        Object[] args = {id};
        return jt.update(sql, args) > 0;
    }
    public boolean modify(Account a) {
        String sql = "update Spring.Account set uname = ?, balance = ? where id = ?";
        Object[] args = {a.getUname(), a.getBalance(), a.getId()};
        return jt.update(sql, args) > 0;
    }

    public Account query(int id) {
        String sql="select * from Spring.Account where id = ?";
        Object[] args = {id};
        return jt.queryForObject(sql, args, new RowMapper<Account>() {
            public Account mapRow(ResultSet rs, int arg1) throws SQLException {
                Account a = new Account();
                a.setId(rs.getInt("id"));
                a.setUname(rs.getString("uname"));
                a.setBalance(rs.getInt("balance"));
                return a;}});
    }
    public List<Account> queryAll() {
        String sql = "select * from Spring.Account ";
        return jt.query(sql, new RowMapper<Account>() {
            public Account mapRow(ResultSet rs, int arg1) throws SQLException {
                Account a = new Account();
                a.setId(rs.getInt("id"));
                a.setUname(rs.getString("uname"));
                a.setBalance(rs.getInt("balance"));
                return a;}});
    }

    @Transactional
    public boolean transfer(int from, int to, int balance) {
        String sql = "update Spring.Account set balance = balance - ? where id = ?";
        Object[] args = {balance, from};
        boolean f1 = jt.update(sql, args)>0;

		int res = 1/0;

        sql = "update Spring.Account set balance = balance + ? where id = ?";
        Object[] args2 = {balance,to};
        boolean f2 = jt.update(sql,args2)>0;

        return f1&&f2;
    }
}
