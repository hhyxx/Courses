package com.hyx.dao;
import java.sql.SQLException;

import com.hyx.javabean.Company;
import com.hyx.javabean.User;
import com.hyx.util.DBUtil;
import com.sun.jdi.connect.spi.Connection;

public class CompanyDao { 
	public boolean insert(Company company) {
		boolean flag=false;
		java.sql.Connection conn = DBUtil.getConnection();
		java.sql.PreparedStatement pstmt = null;
		String sql="INSERT INTO ITOFFER.TB_COMPANY("
				+"COMPANY_NAME,"
				+"COMPANY_AREA,"
				+"COMPANY_SIZE,"
				+"COMPANY_TYPE,"
				+"COMPANY_BRIEF,"
				+"COMPANY_STATE,"
				+"COMPANT_SORT,"
				+"COMPANY_PIC) "
				+ "VALUES(?,?,?,?,?,?,?,?)";
		
		try { 
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, company.getCompanyName());
			pstmt.setString(2, company.getCompanyArea());
			pstmt.setString(3, company.getCompanySize());
			pstmt.setString(4, company.getCompanyType());
			pstmt.setString(5, company.getCompanyBrief());
			pstmt.setInt(6, company.getCompanyState());
			pstmt.setInt(7, company.getCompanySort());
			pstmt.setString(8, company.getCompanyPic());
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