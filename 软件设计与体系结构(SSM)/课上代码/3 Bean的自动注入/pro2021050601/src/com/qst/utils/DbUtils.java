package com.qst.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DbUtils 
{	
	private static final String driver  = "org.gjt.mm.mysql.Driver";
	private static final String url = "jdbc:mysql://localhost/test?&useUnicode=true&characterEncoding=utf-8";	
	static 
	{
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}	
	
	private DbUtils(){}
	
	public static Connection getConn() throws SQLException
	{
		return DriverManager.getConnection(url, "root", "root123");
	}
	
	public static void close(ResultSet rs)
	{			
		try {
			if(rs!=null)
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static void close(PreparedStatement pstm)
	{			
		try {
			if(pstm!=null)
				pstm.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static void close(Connection conn)
	{			
		try {
			if(conn!=null )
				conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void main(String[] args) throws SQLException 
	{
		System.out.println(DbUtils.getConn());
	}
}
