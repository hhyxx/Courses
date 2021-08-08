package com.qst.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.qst.bean.User3;
import com.qst.bean.User4;

@Controller
@RequestMapping("/my5")
public class MyController5 {

//	使用数组接收前端发送过来的数据
	@RequestMapping(value="/f1")
	public void f1(String[] hobby) {
		System.out.println(Arrays.toString(hobby));		
	}
	
//	使用POJO接收前端发送过来的数据
	@RequestMapping(value="/f2")
	public void f2(User3 u) {
		System.out.println(u);		
	}
	
	@RequestMapping(value="/f3")
	public void f3(List<Integer> id) {
		System.out.println(id);		
	}
	
	@RequestMapping(value="/f4")
	public void f4(Map id) {
		System.out.println(id);		
	}
	
	@RequestMapping(value="/f5")
	public void f5(User4 u) {
		System.out.println("f5");
		System.out.println(u);		
	}
	
}








