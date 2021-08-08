package com.qst.util;

import java.sql.*;

public class DBUtil {

	public static String url = "jdbc:mysql://localhost/itoffer"
			+ "?user=root&password=root"
			+ "&useSSL=false&useUnicode=true&characterEncoding=utf-8";
	
	static {
		try {
			Class.forName("org.gjt.mm.mysql.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	public static Connection getConnection() {
		Connection conn =null;
		try {
			conn=DriverManager.getConnection(url);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public static void closeJDBC(ResultSet rs,Statement stmt,Connection conn) {
		if (rs!=null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (stmt!=null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (conn!=null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public static void main(String[] args) {
		System.out.println("打开连接");
		Connection conn=DBUtil.getConnection();
		System.out.println(conn);
		DBUtil.closeJDBC(null, null, conn);
		System.out.println("关闭连接");

	}

}
