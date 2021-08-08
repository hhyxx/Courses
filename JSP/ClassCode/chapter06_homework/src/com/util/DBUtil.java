package com.util;


import java.io.IOException;
import java.sql.*;


public class DBUtil {
	// 连接服务器的参数信息
	public static String url="jdbc:mysql://localhost/itoffer";  
	public static String usr="root";  	
	public static String pwd="qwerasdf811013";  
	// 静态语句块，在类加载（编译后的字节码加载到内存中）的时候只执行一次
	static {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	public static java.sql.Connection getConnection() {
		java.sql.Connection conn = null;
		try {
			conn = DriverManager.getConnection(url, usr, pwd);
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	public static void closeJDBC(ResultSet rs, Statement st, java.sql.Connection con) {
		if(rs!=null) {
			try {
				rs.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		if(st!=null){   
			try {
				st.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}  
		} 
		if(con!=null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	public static void main(String[] args) {
		System.out.println("打开连接2");
		java.sql.Connection conn=DBUtil.getConnection();
		System.out.println(conn);
		System.out.println("关闭连接");
		DBUtil.closeJDBC(null,null,conn);
	}
}