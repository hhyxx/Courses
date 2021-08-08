package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.bean.User;
import com.util.DBUtil;

public class UserDaoImpl implements UserDao {
	java.sql.Connection conn = DBUtil.getConnection();
	java.sql.PreparedStatement pstmt = null;
	String sql;
	public void add(User u) {
		sql = "insert into Spring_Experiment.Users("
				+ "uid,"
				+ "uname,"
				+ "usex) "
				+ "values(?,?,?)";
		try { 
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, u.getUid());
			pstmt.setString(2, u.getUname());
			pstmt.setString(3, u.getUsex());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(null, pstmt, conn);
		}
	}

	public void delete(int id) {
		sql = "delete from Spring_Experiment.Users where uid="+id;
		try { 
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(null, pstmt, conn);
		}
	}

	public void modify(User u) {
		sql = "update Spring_Experiment.Users set uname = ?, usex = ? where uid = ?";
		try { 
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, u.getUname());
			pstmt.setString(2, u.getUsex());
			pstmt.setInt(3, u.getUid());
 			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(null, pstmt, conn);
		}
	}

	public User query(int id) {
		User u = null;
		String sql="select uid,uname,usex from Spring_Experiment.Users where uid=?";
		try { 
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				u = new User();
				u.setUid(rs.getInt(1));
				u.setUname(rs.getString(2));
				u.setUsex(rs.getString(3));
			} 
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return u;
	}	

}
