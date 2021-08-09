package 实验七;

import java.beans.Statement;
import java.sql.*;
import java.util.ArrayList;

public class queryall {
	public static void main(String args[]){
		getqueryall();
	}
	public static ArrayList<String> getqueryall() {//static 可以直接调用函数，不用创建对象
		ArrayList<String>list=new ArrayList<String>();
		java.sql.Connection con;
	    java.sql.Statement sql; 
	    ResultSet rs;
	    
	    con = GetDBConnection.connectDB();
	    try { 
	        sql=con.createStatement();
	        rs = sql.executeQuery("select * from database.Student");
	        while(rs.next()) {
	        	String Sno=rs.getString(1);
	        	String Sname=rs.getString(2);
	        	String Sdept=rs.getString(3);
	        	String Smajor=rs.getString(4);
	        	String record = Sno +"\t" + Sname + "\t" + Sdept +"\t" + Smajor;
	        	list.add(record);
	        }
	        con.close();
	    }
	    catch(SQLException e) {}
	    return list;
	}
}
