package method;

import java.beans.Statement;
import java.math.BigInteger;
import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;

import com.GetDBConnection;

public class Query_all {
	public static void main(String args[]){
		get_queryall();
	}

	public static ArrayList<String> get_queryall() {//static 可以直接调用函数，不用创建对象
		ArrayList<String>list=new ArrayList<String>();
		java.sql.Connection con;
	    java.sql.Statement sql; 
	    ResultSet rs;
	    String title="商品号"+"\t"+"商品名" + "\t" + "商品价格" + "\t" + "商品数量";
	    list.add(title);
	    con = GetDBConnection.connectDB();
	    try { 
	        sql=con.createStatement();
	        // 查询结果按照商品价格排序
	        rs = sql.executeQuery("select * from database.goods order by gprice+0");
	        while(rs.next()) {
	        	String gno=rs.getString(1);
	        	String gname=rs.getString(2);
	        	String gprice=rs.getString(3);
	        	String gcount=rs.getString(4);
	        	String record = gno +"\t" + gname + "\t" + gprice+ "\t" + gcount;
	        	list.add(record);
	        }
	        con.close();
	    }
	    catch(SQLException e) {}

	    return list;
	}
}
