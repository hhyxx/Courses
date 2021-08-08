package com.hyx.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hyx.javabean.ResumeBasicinfo;
import com.hyx.util.DBUtil;
import com.mysql.cj.protocol.Resultset;



public class ResumeBasicinfoDao {

	public int selectCount() {
		int cnt = 0;
		java.sql.Connection conn = DBUtil.getConnection();
		java.sql.PreparedStatement pstmt = null;
		String sql = "select count(*) from itoffer.tb_resume_basicinfo";
		Resultset rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = (Resultset) pstmt.executeQuery();
			if(((ResultSet) rs).next()) {
				cnt = ((ResultSet) rs).getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	public List<ResumeBasicinfo> select(int pageNo, int pageSize) {
		List <ResumeBasicinfo> list = new ArrayList <ResumeBasicinfo> ();
		java.sql.Connection conn = DBUtil.getConnection();
		java.sql.PreparedStatement pstmt = null;
		
		String sql = "select * from itoffer.tb_resume_basicinfo limit ?,?";
		Resultset rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (pageNo - 1) * pageSize);
			pstmt.setInt(2, pageSize);
			rs = (Resultset) pstmt.executeQuery();
			
			while(((ResultSet) rs).next()) {
				ResumeBasicinfo resume = new ResumeBasicinfo();
				resume.setBasicinfoId(((ResultSet) rs).getInt("basicinfo_id"));
				resume.setRealName(((ResultSet) rs).getString("realname"));
				resume.setTelephone(((ResultSet) rs).getString("telephone"));
				resume.setEmail(((ResultSet) rs).getString("email"));
				resume.setJobExperience(((ResultSet) rs).getString("job_experience"));
				resume.setJobIntension(((ResultSet) rs).getString("job_intension"));
				list.add(resume);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
