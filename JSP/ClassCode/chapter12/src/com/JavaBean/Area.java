package com.JavaBean;

public class Area {
	String zip;
	String province;
	String city;
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public Area(String zip, String province, String city) {
		super();
		this.zip = zip;
		this.province = province;
		this.city = city;
	}
	
}
