package com.hyx.listener;

import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.hyx.javabean.User;


@WebListener
public class LogoutUserListener implements HttpSessionListener {

    public LogoutUserListener() {}

    public void sessionCreated(HttpSessionEvent se)  {}

    public void sessionDestroyed(HttpSessionEvent se)  { 
    	User user = (User) se.getSession().getAttribute("SESSION_USER");
    	if(user != null) {
    		ServletContext application = se.getSession().getServletContext();
    		Map<String, User> onlineUserMap = (Map<String, User>) application.getAttribute("ONLINE_USER");
    		if(onlineUserMap != null) {
    			onlineUserMap.remove(user.getUserLogname());
    			application.setAttribute("ONLINE_USER", onlineUserMap);
    		}
    	}
    }
	
}
