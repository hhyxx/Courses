package com.hyx.javabean;

public class Company {
	@Override
	public String toString() {
		return "Company [companyId=" + companyId + ", companyName=" + companyName + ", companyArea=" + companyArea
				+ ", companySize=" + companySize + ", companyType=" + companyType + ", companyBrief=" + companyBrief
				+ ", companyState=" + companyState + ", companySort=" + companySort + ", companyPic=" + companyPic
				+ "]";
	}
	private int companyId;	// 企业标识
	private String companyName;	// 企业名称
	private String companyArea;	// 企业所在地区
	private String companySize;	// 企业规模
	private String companyType;	// 企业性质
	private String companyBrief;	// 企业简介
	private int companyState;	// 招聘状态: 1招聘中 2已暂停 3已结束
	private int companySort;	// 排序序号
	private String companyPic;	// 宣传图片
	public Company() {
		super();
	}
	public Company(String companyName, String companyArea,
			String companySize, String companyType, String companyBrief,
			int companyState, int companySort, String name) {
		this.companyName = companyName;
		this.companyArea = companyArea;
		this.companySize = companySize;
		this.companyType = companyType;
		this.companyBrief = companyBrief;
		this.companyState = companyState;
		this.companySort = companySort;
		this.companyPic = name;
	}

	public int getCompanyId() { return companyId; }
	public void setCompanyId(int companyId) { this.companyId = companyId; }
	
	public String getCompanyName() {return companyName;}
	public void setCompanyName(String companyName) { this.companyName = companyName; }
	
	public String getCompanyArea() { return companyArea; }
	public void setCompanyArea(String companyArea) { this.companyArea = companyArea; }
	
	public String getCompanySize() { return companySize; }
	public void setCompanySize(String companySize) { this.companySize = companySize; }
	
	public String getCompanyType() { return companyType; }
	public void setCompanyType(String companyType) { this.companyType = companyType; }
	
	public String getCompanyBrief() { return companyBrief; }
	public void setCompanyBrief(String companyBrief) { this.companyBrief = companyBrief; }
	
	public int getCompanyState() { return companyState; }
	public void setCompanyState(int companyState) { this.companyState = companyState; }
	
	public int getCompanySort() { return companySort; }
	public void setCompanySort(int companySort) { this.companySort = companySort; }

	public String getCompanyPic() { return companyPic; }
	public void setCompanyPic(String companyPic) { this.companyPic = companyPic; }
	
}
