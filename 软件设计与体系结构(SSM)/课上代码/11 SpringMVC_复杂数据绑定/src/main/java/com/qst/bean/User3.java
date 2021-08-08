package com.qst.bean;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

public class User3 {
	private int[] id1;
	private List<Integer> id2;
	private Map<String,Integer> id3;
	
	public int[] getId1() {
		return id1;
	}
	public void setId1(int[] id1) {
		this.id1 = id1;
	}
	public List<Integer> getId2() {
		return id2;
	}
	public void setId2(List<Integer> id2) {
		this.id2 = id2;
	}
	public Map<String, Integer> getId3() {
		return id3;
	}
	public void setId3(Map<String, Integer> id3) {
		this.id3 = id3;
	}
	@Override
	public String toString() {
		return "User3 [id1=" + Arrays.toString(id1) + ", id2=" + id2 + ", id3=" + id3 + "]";
	}		
}
