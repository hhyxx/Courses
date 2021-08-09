package method;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.GetDBConnection;

public class get_order_num {
	public static void main(String args[]) {
		get();
	}
	public static int get(){//static 可以直接调用函数，不用创建对象
		java.sql.Connection con;
        java.sql.Statement sql; 
        ResultSet rs;
        int number=0;
        con = GetDBConnection.connectDB();
        try { 
            sql=con.createStatement();
            rs = sql.executeQuery("select count(*) from database.records");
            while(rs.next()) {
            	String tmp=rs.getString(1);
            	number=Integer.parseInt(tmp);
            }
            con.close();
        }
        catch(SQLException e) {}
        return number;
	}
}
