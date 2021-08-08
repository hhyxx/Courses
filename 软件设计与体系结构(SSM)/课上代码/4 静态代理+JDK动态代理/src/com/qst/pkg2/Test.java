package com.qst.pkg2;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

public class Test {

	public static void main(String[] args) {

		UserDao ud = new UserDaoImpl();	
		
		UserDao ud2 = (UserDao)Proxy.newProxyInstance(
				ud.getClass().getClassLoader(), 
				ud.getClass().getInterfaces(), 
				new InvocationHandler() {
					@Override
					public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
						System.out.println("before");
						Object o = method.invoke(ud, args);
						System.out.println("after");
						return o;
					}					
				});
		
		ud2.add();
	}

}











