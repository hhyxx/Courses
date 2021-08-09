package method;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.GetDBConnection;

public class insert_usr {
	public static void main(String args[]) {
		Insert_usr("201811050392","侯宇轩");
	}
	public static void Insert_usr(String uno,String upassword) {
		  java.sql.Connection con;
          java.sql.PreparedStatement preSql;  //预处理语句对象
		  con = GetDBConnection.connectDB();
		  
		  if(con == null ) return;
		  
		  
		  //插入一个新的用户
		  String sqlStr ="insert into database.usr values(?,?)";
		  try { 
		      preSql = con.prepareStatement(sqlStr);
			  preSql.setString(1,uno);
			  preSql.setString(2,upassword);
			  int ok = preSql.executeUpdate();       //预处理语句调用方法执行
			  con.close();
		  }
		  catch(SQLException e) { 
		      System.out.println("记录中usrid值不能重复"+e);
		  }
	}
}
