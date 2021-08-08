package com.hyx.servlet;

import java.io.IOException;

import javax.lang.model.element.TypeElement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hyx.service.ResumeService;
import com.hyx.javabean.PageBean;
import com.hyx.javabean.ResumeBasicinfo;
import java.util.*;

@WebServlet("/ResumeServlet")
public class ResumeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ResumeServlet() {
        super();
    }
    
//    URl 参数
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 接受请求参数
		request.setCharacterEncoding("utf-8");
		String type = request.getParameter("type");

		// type = list 查找所有简历 
		if("list".equals(type)) {
			String t = request.getParameter("pageNo");
			String str = t == null ? "1" : t; 
			int pageNo = Integer.valueOf(str);
			
			ResumeService service = new ResumeService();
			
			List <ResumeBasicinfo> list = service.get(pageNo, 2);
			PageBean <ResumeBasicinfo> pageBean = new PageBean<>();
			int count = service.getCount();
			
			pageBean.setPageNo(pageNo);
			pageBean.setRecordCount(count);
			pageBean.setPageData(list);
			
			request.setAttribute("pageBean", pageBean);
			request.getRequestDispatcher("manage/resumeList.jsp").forward(request, response);
		}
		// 查找 指定 id 简历
		else {
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
