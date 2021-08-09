package 实验七;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class getInsert {
	public static void main(String args[]) {
		get_Insert("201811050392","侯宇轩","信控学院","软件186");
	}
	public static void get_Insert(String Sno,String Sname,String Sdept,String Smajor) {
		  java.sql.Connection con;
        
          java.sql.PreparedStatement preSql;  //预处理语句对象
		  con = GetDBConnection.connectDB();
		  if(con == null ) return;
		  String sqlStr ="insert into database.Student values(?,?,?,?)";
		  try { 
		      preSql = con.prepareStatement(sqlStr);
		      preSql.setString(1,Sno); 
			  preSql.setString(2,Sname);
			  preSql.setString(3,Sdept);
			  preSql.setString(4,Smajor);   
			  int ok = preSql.executeUpdate();       //预处理语句调用方法执行
			  con.close();
		  }
		  catch(SQLException e) { 
		      System.out.println("记录中Sno值不能重复"+e);
		  }
	}
}
