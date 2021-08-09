package com;
import java.sql.*;
public class GetDBConnection {
    public static Connection connectDB() {
        try{  //建立JDBC-MySQL8.0连接:
        	 Class.forName("com.mysql.jdbc.Driver");     //加载MYSQL JDBC驱动程序      
             System.out.println("Success loading Mysql Driver!");  
        }
        catch(Exception e){
            System.out.print("Error loading Mysql Driver!");//连接失败
        }
        Connection con = null;
        try{
        	con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/mySql","root","qwerasdf811013");  
            System.out.println("Success connect Mysql server!");  
        }
        catch(SQLException e){
            System.out.println(e);
        }
        return con;
   }
}
