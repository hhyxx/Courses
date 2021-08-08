package com.qst.bean;

import java.util.List;

public class Dept1 {
	
	private int deptno;
	private String dname;
	private String loc;
	private List<Emp1> emps;
	
	public int getDeptno() {
		return deptno;
	}
	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	public List<Emp1> getEmps() {
		return emps;
	}
	public void setEmps(List<Emp1> emps) {
		this.emps = emps;
	}
	@Override
	public String toString() {
		return "Dept1 [deptno=" + deptno + ", dname=" + dname + ", loc=" + loc + ", emps=" + emps + "]";
	}	
}
