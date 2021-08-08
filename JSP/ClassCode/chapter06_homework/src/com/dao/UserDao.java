package com.dao;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import com.bean.User;
import com.util.DBUtil;

public class UserDao { // 数据库的增删改查
	public boolean select(String uname, String pwd) {
		java.sql.Connection conn = DBUtil.getConnection();
		java.sql.PreparedStatement pstmt = null;
		
		boolean flag = false;
		String sql="SELECT * FROM ITOFFER.TB_USERS WHERE USER_LOGNAME=? and USER_PWD=?";
		try { 
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uname);
			pstmt.setString(2, pwd);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				flag = true;
			}
			return flag;
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return flag;
	}
}