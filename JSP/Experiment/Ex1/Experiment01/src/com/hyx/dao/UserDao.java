package com.hyx.dao;
import java.sql.SQLException;
import com.hyx.javabean.User;
import com.hyx.util.DBUtil;
import com.sun.jdi.connect.spi.Connection;

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
}