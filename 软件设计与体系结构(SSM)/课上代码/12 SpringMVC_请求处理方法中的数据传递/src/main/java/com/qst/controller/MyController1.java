package com.qst.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.qst.bean.User;

@Controller
public class MyController1 {
	
//	1、使用字符串返回逻辑视图名
	@RequestMapping("/f1")
	public String f1() {
		String msg = "1111111";
		return "success.jsp";
	}
	
//	2、使用ModelAndView设置逻辑视图名
	@RequestMapping("/f2")
	public ModelAndView f2() {		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("success.jsp");
		return mv;
	}
	
//	3、使用ModelAndView设置逻辑视图名，存储单条数据并使用EL表达式查看
//	      把数据存入ModelAndView，并返回ModelAndView
	@RequestMapping("/f3")
	public ModelAndView f3() {		
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", "3333333333");
		mv.setViewName("success.jsp");
		return mv;
	}

//	4、使用字符串返回逻辑视图名，使用HttpServletRequest存储单条数据，并使用EL表达式查看
//	   f1的第1次修改，即增加HttpServletRequest参数
	@RequestMapping("/f4")
	public String f4(HttpServletRequest req) {
		req.setAttribute("msg", "44444444");
		return "success.jsp";
	}

//	5、使用字符串返回逻辑视图名，使用Model存储单条数据，并使用EL表达式查看
//	   f1的第2次修改，即增加Model参数，推荐
	@RequestMapping("/f5")
	public String f5(Model m) {
		m.addAttribute("msg", "555555555");
		return "success.jsp";
	}
	
//	6、使用字符串返回逻辑视图名，使用Model存储POJO数据，并使用EL表达式查看
	@RequestMapping("/f6")
	public String f6(Model m) {
		User u = new User();
		u.setId(1);
		u.setName("admin");
		u.setPwd("123");
		u.setEmail("123@qq.com");
		u.setRole("管理员");			
		m.addAttribute("msg", "666666666");
		m.addAttribute("user",u);		
		return "success.jsp";
	}
	 
//	7、使用字符串返回逻辑视图名，使用Model存储POJO数据，并使用Spring的标签库查看
	@RequestMapping("/f7")
	public String f7(Model m) {
		User u = new User();
		u.setId(1);
		u.setName("admin");
		u.setPwd("123");
		u.setEmail("123@qq.com");
		u.setRole("管理员");			
		m.addAttribute("msg", "7777777777");
		m.addAttribute("user",u);		
		return "success2.jsp";
	}
	
	
}











































