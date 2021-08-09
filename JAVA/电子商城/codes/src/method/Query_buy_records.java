package method;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.GetDBConnection;

public class Query_buy_records {
	public static void main(String args[]){
		get_buy_records("201811050392");
	}
	public static ArrayList<String> get_buy_records(String no){//static 可以直接调用函数，不用创建对象
		ArrayList<String>list=new ArrayList<String>();
		java.sql.Connection con;
        java.sql.Statement sql; 
        ResultSet rs;
        String rec="订单号" +"\t" + "用户号" + "\t" + "商品号" +"\t" + "订单总金额" +"\t"+ "商品总数量";
        list.add(rec);
        con = GetDBConnection.connectDB();
        try { 
            sql=con.createStatement();
            
            //查询结果按照订单编号排序
            rs = sql.executeQuery("select * from database.records where uno=\""+no+"\"" + "order by rno+0");
            while(rs.next()) {
            	String rno=rs.getString(1);
            	String uno=rs.getString(2);
            	String gno=rs.getString(3);
            	String tprice=rs.getString(4);
            	String bcount=rs.getString(5);
            	String record = rno +"\t" + uno + "\t" + gno +"\t" + tprice +"\t"+ bcount;
            	list.add(record);
            }
            con.close();
        }
        catch(SQLException e) {}
        return list;
	}
}
