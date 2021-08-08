package com.hyx.javabean;

import java.util.ArrayList;
import java.util.List;

import com.hyx.javabean.ResumeBasicinfo;
import com.hyx.dao.ResumeBasicinfoDao;
import com.hyx.dao.UserDao;

public class PageBean<T> {
	// 每页显示记录数
	private int pageSize = 10;
	// 当前页码
	private int pageNo = 1;
	// 总页数
	private int totalPages;
	// 总记录数
	private int recordCount;
	// 每页数据记录集合
	private List<T> pageData = new ArrayList<T>(); // 泛型数据

	// 是否有下一页
	private boolean hasNextPage;
	// 是否有上一页
	private boolean hasPreviousPage;
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getTotalPages() {
		// 实现上取整
		return (recordCount + pageSize - 1) / pageSize;
	}
	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}
	public int getRecordCount() {
		return recordCount;
	}
	public void setRecordCount(int recordCount) {
		this.recordCount = recordCount;
	}
	public List<T> getPageData() {
		return pageData;
	}
	public void setPageData(List<T> pageData) {
		this.pageData = pageData;
	}
	public boolean isHasNextPage() {
		return hasNextPage;
	}
	public void setHasNextPage(boolean hasNextPage) {
		this.hasNextPage = hasNextPage;
	}
	public boolean isHasPreviousPage() {
		return hasPreviousPage;
	}
	public void setHasPreviousPage(boolean hasPreviousPage) {
		this.hasPreviousPage = hasPreviousPage;
	}
	public PageBean(int pageSize, int pageNo, int totalPages, int recordCount, List<T> pageData, boolean hasNextPage,
			boolean hasPreviousPage) {
		super();
		this.pageSize = pageSize;
		this.pageNo = pageNo;
		this.totalPages = totalPages;
		this.recordCount = recordCount;
		this.pageData = pageData;
		this.hasNextPage = hasNextPage;
		this.hasPreviousPage = hasPreviousPage;
	}
	public PageBean() {
		super();
	}
	



}
