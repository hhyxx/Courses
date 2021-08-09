package method;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.GetDBConnection;

public interface check_usr {
	public static void main(String args[]) {
		Check_("201811050392","侯宇轩");
	}
	public static boolean Check_(String uno,String password){//static 可以直接调用函数，不用创建对象
		java.sql.Connection con;
        java.sql.Statement sql; 
        ResultSet rs;
        boolean ok=false;
        con = GetDBConnection.connectDB();
        try { 
            sql=con.createStatement();
            rs = sql.executeQuery("select * from database.usr where uno = '"+uno+"' and upassword = '"+password+"'");
            if(rs.next()) 
            	ok=true;
            con.close();
        }
        catch(SQLException e) {}
        return ok;
	}
}
