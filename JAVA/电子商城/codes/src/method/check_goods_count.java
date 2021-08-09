package method;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.GetDBConnection;

public class check_goods_count {
	public static int get(String gno){//static 可以直接调用函数，不用创建对象
		java.sql.Connection con;
        java.sql.Statement sql; 
        ResultSet rs;
        int cnt=0;
        con = GetDBConnection.connectDB();
        try { 
            sql=con.createStatement();
            rs = sql.executeQuery("select gcount from database.goods where gno=\""+gno+"\"");
            while(rs.next()) {
            	String tmp=rs.getString(1);
            	cnt=Integer.parseInt(tmp);
            }
            con.close();
        }
        catch(SQLException e) {}
        
        return cnt;
	}
}
