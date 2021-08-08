package com.qst.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.qst.bean.User;
import com.qst.util.C3p0Util1;

public class UserDaoImpl implements UserDao {
	
	public boolean add(User u) {		
		try {
			Connection conn = C3p0Util1.getConn();
			String sql = "insert into user(name,pwd,money) values(?,?,?)";
			PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setObject(1, u.getName());
			pstm.setObject(2, u.getPwd());
			pstm.setObject(3, u.getMoney());
			return pstm.executeUpdate()>0;			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean del(int id) {		
		try {
			Connection conn = C3p0Util1.getConn();
			String sql = "delete from user where id=?";
			PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setObject(1, id);
			return pstm.executeUpdate()>0;			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean modify(User u) {
		try {
			Connection conn = C3p0Util1.getConn();
			String sql = "update user set name=?,pwd=?,money=? where id=?";
			PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setObject(1, u.getName());
			pstm.setObject(2, u.getPwd());
			pstm.setObject(3, u.getMoney());
			pstm.setObject(4, u.getId());			
			return pstm.executeUpdate()>0;			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public User queryByNamePwd(String name, String pwd) {		
		try {
			Connection conn = C3p0Util1.getConn();
			String sql = "select * from user where name=? and pwd=?";
			PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setObject(1, name);
			pstm.setObject(2, pwd);			
			ResultSet rs = pstm.executeQuery();
			User u = null ;
			while(rs.next()) {				
				u = new User();
				u.setId(rs.getInt("id"));
				u.setName(rs.getString("name"));
				u.setPwd(rs.getString("pwd"));
				u.setMoney(rs.getInt("money"));
			}
			return u;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public List<User> queryAll() {		
		try {
			Connection conn = C3p0Util1.getConn();
			String sql = "select * from user ";
			PreparedStatement pstm = conn.prepareStatement(sql);
			ResultSet rs = pstm.executeQuery();
			ArrayList<User> users = new ArrayList<User>();
			while(rs.next()) {				
				User u = new User();
				u.setId(rs.getInt("id"));
				u.setName(rs.getString("name"));
				u.setPwd(rs.getString("pwd"));
				u.setMoney(rs.getInt("money"));
				users.add(u);
			}
			return users;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	public boolean transfer(int from, int to, int money) {
		Connection conn = null;
		try {
			conn = C3p0Util1.getConn();
			
			conn.setAutoCommit(false);	
			
			String sql = "update user set money=money-? where id=?";
			PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setObject(1, money);
			pstm.setObject(2, from);			
			boolean f1 = pstm.executeUpdate()>0;
			
			int a = 1/0;
			
			sql = "update user set money=money+? where id=?";
			pstm = conn.prepareStatement(sql);
			pstm.setObject(1, money);
			pstm.setObject(2, to);			
			boolean f2 = pstm.executeUpdate()>0;
			
			conn.commit();
			
			return f1&&f2;
		} catch (SQLException e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			return false;
		}
	}
}