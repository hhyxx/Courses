package com.hyx.servlet;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.hyx.javabean.Company;
import com.hyx.service.CompanyService;

@WebServlet("/CompanyAddServlet")
@MultipartConfig
public class CompanyAddServlet extends HttpServlet {

    public CompanyAddServlet() {
        super();
    }
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String companyName = request.getParameter("companyName");
		String companyArea = request.getParameter("companyArea");
		String companySize = request.getParameter("companySize");
		String companyType = request.getParameter("companyType");
		String companyBrief = request.getParameter("companyBrief");
		Integer companyState=(request.getParameter("companyState")==null)?1:Integer.parseInt(request.getParameter("companyState"));
		Integer companySort=(request.getParameter("companySort")==null)?0:Integer.parseInt(request.getParameter("companySort"));
		// 获取文件上传域
		Part part = request.getPart("companyPic");
		String tmp = part.getHeader("Content-Disposition");
		String fileName = tmp.substring(tmp.lastIndexOf("=")+2, tmp.length()-1);
//		String fileName = part.getSubmittedFileName();

		// 重构文件名 
		String newFileName = System.currentTimeMillis()+fileName.substring(fileName.indexOf('.'));
		// 将上传的文件保存在服务器
		String filepath = getServletContext().getRealPath("/");
		filepath=filepath+"upload/companyPic";
		
		Company company = new Company(companyName,companyArea,companySize,companyType,companyBrief,
				companyState,companySort,newFileName);
		System.out.println(company);
		getServletContext().log("上传路径为："+filepath);
		System.out.println("上传路径为"+filepath);
		
		File f=new File(filepath);
		if(!f.exists())  f.mkdirs();
		part.write(filepath+"/"+newFileName);

		CompanyService comService = new CompanyService(); 
		Boolean flag = comService.addCompany(company);
		if(flag) {
			response.sendRedirect("manage/companyList.html"); 
		} else {
			response.getWriter().write("<script>alert('插入失败');location='manage/companyList.html';</script>");
		}
	}
}