package com.hyx;

import javax.servlet.ServletContext;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;



@WebListener
public class OnlineUserNumberListener implements HttpSessionListener {

	private int num; // 统计在线人数

	public OnlineUserNumberListener() {

	}

	/**
	 * 会话创建时的监听方法
	 */
	public void sessionCreated(HttpSessionEvent se) {
		// 会话创建时，人数加1
		num++;
		ServletContext context = se.getSession().getServletContext();
		// 将在线人数存入应用域属性
		context.setAttribute("onlineUserNum", num);
	}

	/**
	 * 会话销毁时的监听方法
	 */
	public void sessionDestroyed(HttpSessionEvent se) {
		// 会话销毁时，人数减1
		num--;
		ServletContext context = se.getSession().getServletContext();
		// 将在线人数存入应用域属性
		context.setAttribute("onlineUserNum", num);
	}

}
