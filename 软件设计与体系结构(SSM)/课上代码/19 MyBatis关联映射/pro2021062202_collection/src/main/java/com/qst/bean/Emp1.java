package com.qst.bean;

public class Emp1 {
	
	private int empno;
	private String ename;
	private String job;
	
	public int getEmpno() {
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	@Override
	public String toString() {
		return "Emp1 [empno=" + empno + ", ename=" + ename + ", job=" + job + "]";
	}	
}
