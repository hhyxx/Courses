package method;

import java.sql.SQLException;

import com.GetDBConnection;

public class change_goods_message {
	public static void main(String args[]) {
		getchange("201811050392","侯宇轩","信控学院","软件186");
	}
	
	public static void getchange(String gno,String gname,String gprice,String gcount){
		  java.sql.Connection con;
          java.sql.PreparedStatement preSql;  //预处理语句对象
		  con = GetDBConnection.connectDB();
		  if(con == null ) return;
		  String sqlStr ="update database.goods set gno=?,gname=?,gprice=?,gcount=? where (gno=?)";
		  try { 
		      preSql = con.prepareStatement(sqlStr);
		      preSql.setString(5,gno); 
		      preSql.setString(1,gno);
			  preSql.setString(2,gname);
			  preSql.setString(3,gprice);
			  preSql.setString(4,gcount);   
			  int ok = preSql.executeUpdate();       //预处理语句调用方法执行
			  con.close();
		  }
		  catch(SQLException e) {  
		      System.out.println("记录中Sno值不能重复"+e);
		  }
	}
}
