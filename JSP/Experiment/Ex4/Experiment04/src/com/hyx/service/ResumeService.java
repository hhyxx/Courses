package com.hyx.service;

import java.util.List;

import com.hyx.dao.ResumeBasicinfoDao;
import com.hyx.javabean.ResumeBasicinfo;

public class ResumeService {

	public List<ResumeBasicinfo> get(int pageNo, int pageSize) {
		ResumeBasicinfoDao dao = new ResumeBasicinfoDao();                                     
		return dao.select(pageNo, pageSize);
	}

	public int getCount() {
		// 调用数据层得到
		ResumeBasicinfoDao dao = new ResumeBasicinfoDao();
		return dao.selectCount();
	}
	
}
