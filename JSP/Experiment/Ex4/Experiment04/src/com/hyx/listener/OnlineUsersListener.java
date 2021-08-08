package com.hyx.listener;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;

import com.hyx.javabean.User;

@WebListener
public class OnlineUsersListener implements HttpSessionAttributeListener {	
    public OnlineUsersListener() {}

    
    public void attributeAdded(HttpSessionBindingEvent se)  {    	
    	if("SESSION_USER".equals(se.getName())) {
    		User user = (User) se.getValue();
        	ServletContext application = se.getSession().getServletContext();
        	
    		Map <String, User> onlineUserMap = (Map<String, User>) application.getAttribute("ONLINE_USER");
    		if(onlineUserMap == null) {
    			onlineUserMap = new HashMap<String, User>();
    		}
    		onlineUserMap.put(user.getUserLogname(), user);
			application.setAttribute("ONLINE_USER", onlineUserMap);
    	}
    	System.out.println("Listener work");
    }
    public void attributeRemoved(HttpSessionBindingEvent se)  { 
    }
    public void attributeReplaced(HttpSessionBindingEvent se)  { 
    	
    }
}
