package method;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.GetDBConnection;

public class check_admin {

	public static void main(String args[]) {
		Check("201811050392","侯宇轩");
	}
	public static boolean Check(String adminid,String password){//static 可以直接调用函数，不用创建对象
		java.sql.Connection con;
        java.sql.Statement sql; 
        ResultSet rs;
        boolean ok=false;
        con = GetDBConnection.connectDB();
        try { 
            sql=con.createStatement();
            
            rs = sql.executeQuery("select * from database.admin where ano = '"+adminid+"' and apassword = '"+password+"'");
            if(rs.next()) 
            	ok=true;
            con.close();
        }
        catch(SQLException e) {}
        return ok;
	}
}
