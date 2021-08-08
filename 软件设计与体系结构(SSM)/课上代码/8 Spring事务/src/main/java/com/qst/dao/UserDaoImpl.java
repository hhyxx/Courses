package com.qst.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.qst.bean.User;

@Component
public class UserDaoImpl implements UserDao {
	
	@Autowired
	private JdbcTemplate jt;
	
	public boolean add(User u) {
		String sql = "insert into user(name,pwd,money) values(?,?,?)";
		Object[] args = {u.getName(),u.getPwd(),u.getMoney()};		
		return jt.update(sql,args)>0;
	}
	
	public boolean del(int id) {
		String sql = "delete from user where id=?";
		Object[] args = {id};
		return jt.update(sql,args)>0;
	}
	
	public boolean modify(User u) {
		String sql = "update user set name=?,pwd=?,money=? where id=?";
		Object[] args = {u.getName(),u.getPwd(),u.getMoney(),u.getId()};
		return jt.update(sql,args)>0;	
	}
	
	public User queryByNamePwd(String name, String pwd) {
		String sql = "select * from user where name=? and pwd=?";
		Object[] args = {name,pwd};
		return jt.queryForObject(sql, args, new RowMapper<User>() {
			public User mapRow(ResultSet rs, int arg1) throws SQLException {
				User u = new User();
				u.setId(rs.getInt("id"));
				u.setName(rs.getString("name"));
				u.setPwd(rs.getString("pwd"));
				u.setMoney(rs.getInt("money"));
				return u;}});	
	}
	
	public List<User> queryAll() {
		String sql = "select * from user ";
		return jt.query(sql, new RowMapper<User>() {
			public User mapRow(ResultSet rs, int arg1) throws SQLException {
				User u = new User();
				u.setId(rs.getInt("id"));
				u.setName(rs.getString("name"));	
				u.setPwd(rs.getString("pwd"));
				u.setMoney(rs.getInt("money"));
				return u;}});	
	}

	@Transactional
	public boolean transfer(int from, int to, int money) {
		String sql = "update user set money=money-? where id=?";
		Object[] args = {money,from};
		boolean f1 = jt.update(sql,args)>0;
		
//		int x = 1/0;
		
		sql = "update user set money=money+? where id=?";
		Object[] args2 = {money,to};
		boolean f2 = jt.update(sql,args2)>0;
		
		return f1&&f2;		
	}
}