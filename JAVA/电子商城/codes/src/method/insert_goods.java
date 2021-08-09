package method;

import java.sql.SQLException;

import com.GetDBConnection;

public class insert_goods {
	public static void main(String args[]) {
		Insert_goods("201811050392","侯宇轩","信控学院","0");
	}
	public static void Insert_goods(String no,String name,String price,String count) {
		  java.sql.Connection con;
          java.sql.PreparedStatement preSql;  //预处理语句对象
		  con = GetDBConnection.connectDB();
		  if(con == null ) return;
		  String sqlStr ="insert into database.goods values(?,?,?,?)";
		  try { 
		      preSql = con.prepareStatement(sqlStr);
		      preSql.setString(1,no); 
			  preSql.setString(2,name);
			  preSql.setString(3,price);
			  preSql.setString(4,count);
			  int ok = preSql.executeUpdate();       //预处理语句调用方法执行
			  con.close();
		  }
		  catch(SQLException e) { 
		      System.out.println("记录中gno值不能重复"+e);
		  }
	}
}
