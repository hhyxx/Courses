package com.qst.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class MyController1 {

	@RequestMapping(value="/upload",method=RequestMethod.POST)
	public String upload(@RequestParam("f1") MultipartFile file) throws Exception {
       if(!file.isEmpty()) {
    	   String fileName=file.getOriginalFilename();
           File target=new File("c://temp//"+fileName);
           file.transferTo(target);
           System.out.println("success");
           return "success.jsp";
        }
        return "error.jsp";
	}
	
	@RequestMapping(value="/download")
	protected void download(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fileName = request.getParameter("fileName");	
		fileName = new String(fileName.getBytes("iso-8859-1"),"utf-8");	
		File f = new File("c://temp//"+fileName);		
		if(f.exists()) {
			response.setHeader("content-disposition", "attachment;filename="+fileName);
			FileInputStream in = new FileInputStream(f);
			OutputStream out = response.getOutputStream();
			byte[] buffer = new byte[1024];
			int len=0;
			while((len=(in.read(buffer)))>0) {
				out.write(buffer,0,len);
			}
			out.flush();
			out.close();
			in.close();	
		}else {
			response.sendRedirect("download.jsp");
		}
	}	
	
	@RequestMapping(value="/f1")
	public String f1() {
		return "success.jsp";
	}

}






























