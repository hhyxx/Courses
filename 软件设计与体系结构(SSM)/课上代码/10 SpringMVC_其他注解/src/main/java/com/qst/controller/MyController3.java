package com.qst.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/my3")
@SessionAttributes(names="msg")
public class MyController3 {
	
	@RequestMapping(value="/f1")
	public ModelAndView f1() {		
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg","hello");
		mv.setViewName("2");
		return mv;
	}
	
	@RequestMapping(value="/f2")
	public ModelAndView f2() {		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("2");
		return mv;
	}
	
	

}









