package com.qst.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/my2")
public class MyController2 {
	
	@RequestMapping(value="/f1")
	public void f1(@RequestParam(name="user",required=false,defaultValue="cgs") String name, 
			String pwd, HttpServletResponse res) throws IOException {
		res.getWriter().write("name="+name+",pwd="+pwd);
	}
	
	@RequestMapping(value="/f2")
	public void f2(@RequestBody String str, HttpServletResponse res) throws IOException {
		res.getWriter().write(str);
	}
	
	@RequestMapping(value="/f3/{id}/{name}/{pwd}")
	public String f3(@PathVariable String id,@PathVariable String name,@PathVariable String pwd) {		
		System.out.println(id);
		System.out.println(name);
		System.out.println(pwd);
		return "2";
	}
	
	@RequestMapping(value="/f4")
	public void f4(@RequestHeader("Accept-Language") String str, HttpServletResponse res) throws IOException {
		res.getWriter().write(str);
	}
	
	@RequestMapping(value="/f5")
	public void f5(@CookieValue("JSESSIONID") String str, HttpServletResponse res) throws IOException {
		res.getWriter().write(str);
	}
	
	
}
















