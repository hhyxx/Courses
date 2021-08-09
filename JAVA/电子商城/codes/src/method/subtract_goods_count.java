package method;

import java.sql.SQLException;

import com.GetDBConnection;

public class subtract_goods_count {
	public static void main(String args[]) {
		change("201811050392","侯宇轩");
	}
	
	public static void change(String gno,String new_cnt){
		  java.sql.Connection con;
          java.sql.PreparedStatement preSql;  //预处理语句对象
		  con = GetDBConnection.connectDB();
		  if(con == null ) return;
		  String sqlStr ="update database.goods set gcount=? where (gno=?)";
		  try { 
		      preSql = con.prepareStatement(sqlStr);
		      preSql.setString(2,gno); 
			  preSql.setString(1,new_cnt);   
			  int ok = preSql.executeUpdate();       //预处理语句调用方法执行
			  con.close();
		  }
		  catch(SQLException e) {  
		      System.out.println("记录中gno值不能重复"+e);
		  }
	}
}
