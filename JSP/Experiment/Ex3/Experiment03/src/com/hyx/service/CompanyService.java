package com.hyx.service;
import com.hyx.dao.CompanyDao;
import com.hyx.javabean.Company;
public class CompanyService {
	public boolean addCompany(Company company) {
		// 进行业务处理
		// 调用DAO实现数据插入
		CompanyDao comDao=new CompanyDao();
		boolean flag=comDao.insert(company);
		return flag;
	}
}
