package method;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.GetDBConnection;

public class insert_buy_records {
	public static void main(String args[]) {
		Insert_records("201811050392","侯宇轩","0");
	}
	public static String Insert_records(String uno,String gno,String bcount) {
		  java.sql.Connection con;
		  java.sql.Statement sql; 
		  ResultSet rs;
          java.sql.PreparedStatement preSql;  //预处理语句对象
		  con = GetDBConnection.connectDB();
		  
		  
		  //获得当前存在的订单数量
		  
		  int number=get_order_num.get();
		  int cnt=Integer.parseInt(bcount);
		  int tprice=get_total_price.get(cnt,gno);
		  String total_price=String.valueOf(tprice);
		  int num_=number+1;
		  String num=String.valueOf(num_);
		  String tmp="购买成功！\n 订单号:   "+ num + "    商品编号:   " + gno +"    商品数量:   " + bcount + "    订单总金额:   " +total_price;   
		  String sqlStr ="insert into database.records values(?,?,?,?,?)";
		  try { 
		      preSql = con.prepareStatement(sqlStr);
			  preSql.setString(1,num);
			  preSql.setString(2,uno);
			  preSql.setString(3,gno);
			  preSql.setString(4,total_price);
			  preSql.setString(5,bcount);
			  int ok = preSql.executeUpdate();       //预处理语句调用方法执行
			  con.close();
			  System.out.println(num+"   "+ uno + "   " + gno + "   " + total_price + "   " + bcount);
		  }
		  catch(SQLException e) { 
		      System.out.println("记录中rno值不能重复"+e);
		  }
		  return tmp;
	}
}
