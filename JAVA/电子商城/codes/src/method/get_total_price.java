package method;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.GetDBConnection;

public class get_total_price {
	public static void main(String args[]) {
		get(0,"201811050392 侯宇轩");
	}
	public static int get(int cnt,String gno){//static 可以直接调用函数，不用创建对象
		java.sql.Connection con;
        java.sql.Statement sql; 
        ResultSet rs;
        int single=0;
        con = GetDBConnection.connectDB();
        try { 
            sql=con.createStatement();
            rs = sql.executeQuery("select gprice from database.goods where gno=\""+gno+"\"");
            while(rs.next()) {
            	String tmp=rs.getString(1);
            	single=Integer.parseInt(tmp);
            }
            con.close();
        }
        catch(SQLException e) {}
        int tot = single * cnt;
        return tot;
	}
	
}
