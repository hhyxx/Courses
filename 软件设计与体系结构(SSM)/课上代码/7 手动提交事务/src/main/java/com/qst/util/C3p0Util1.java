package com.qst.util;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class C3p0Util1 
{
	private static ComboPooledDataSource ds;
	
	static 
	{
		try {
			Properties p = new Properties();	
			InputStream in = C3p0Util1.class.getClassLoader().getResourceAsStream("com/qst/util/dbinfo1.properties");

			p.load(in);		

			String driver = p.getProperty("driver");
			String url = p.getProperty("url");
			String user = p.getProperty("user");
			String pwd = p.getProperty("pwd");	
			int initialPoolSize = Integer.parseInt(p.getProperty("initialPoolSize"));
			int minPoolSize = Integer.parseInt(p.getProperty("minPoolSize"));
			int maxPoolSize = Integer.parseInt(p.getProperty("maxPoolSize"));
			int maxIdleTime = Integer.parseInt(p.getProperty("maxIdleTime"));
			
			ds = new ComboPooledDataSource();			
			ds.setDriverClass(driver);
			ds.setJdbcUrl(url);
			ds.setUser(user);
			ds.setPassword(pwd);
			ds.setInitialPoolSize(initialPoolSize);
			ds.setMinPoolSize(minPoolSize);
			ds.setMaxPoolSize(maxPoolSize);
			ds.setMaxIdleTime(maxIdleTime);
		
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private C3p0Util1(){}
	
	public static Connection getConn() throws SQLException
	{
		return ds.getConnection();
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
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) throws SQLException 
	{		
		for(int i=0; i<30; i++) {
			Connection c = C3p0Util1.getConn();
			System.out.println(i+"---"+c);
			C3p0Util1.close(c);
		}
	}
}
