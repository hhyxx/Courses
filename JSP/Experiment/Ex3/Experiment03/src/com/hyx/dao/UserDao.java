package com.hyx.dao;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.hyx.javabean.User;
import com.hyx.util.DBUtil;

public class UserDao { // 数据库的增删改查
	public boolean insert(User user) {
		boolean flag=false;
		java.sql.Connection conn = DBUtil.getConnection();
		java.sql.PreparedStatement pstmt = null;
		
		String sql="INSERT INTO ITOFFER.TB_USERS("
				+ "USER_LOGNAME,"
				+ "USER_PWD,"
				+ "USER_REALNAME,"
				+ "USER_EMAIL,"
				+ "USER_ROLE,"
				+ "USER_STATE) "
				+ "VALUES(?,?,?,?,?,?)";
		try { 
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserLogname());
			pstmt.setString(2, user.getUserPwd());
			pstmt.setString(3, user.getUserRealname());
			pstmt.setString(4, user.getUserEmail());
			pstmt.setInt(5, user.getUserRole());
			pstmt.setInt(6, user.getUserState());
			pstmt.executeUpdate();
			flag = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(null, pstmt, conn);
		}
		return flag;
	}

	public User select(String uname, String pwd) {
		java.sql.Connection conn = DBUtil.getConnection();
		java.sql.PreparedStatement pstmt = null;
		
		User u = null;
		String sql="SELECT USER_ID,USER_REALNAME,USER_EMAIL,USER_ROLE,"
				+ "USER_STATE FROM ITOFFER.TB_USERS WHERE USER_LOGNAME=? and USER_PWD=?";
		try { 
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uname);
			pstmt.setString(2, pwd);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				u = new User();
				u.setUserId( rs.getInt(1) );
				u.setUserRealname(rs.getString(2));
				u.setUserEmail(rs.getString(3));
				u.setUserRole(rs.getInt(4));
				u.setUserState( rs.getInt(5));
			}
			if(u != null) {
				u.setUserLogname(uname);
				u.setUserPwd(pwd);
			} 
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return u;
	}
}