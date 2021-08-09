package method;

import java.sql.SQLException;

import com.GetDBConnection;

public class delete_goods {
	public static void main(String args[]) {
		getdelete("201811050392");
	}
	
	public static void getdelete(String no) {
	    java.sql.Connection con;
        java.sql.Statement sql; 
        con = GetDBConnection.connectDB();
        try { 
        	  sql=con.createStatement();
        	  sql.executeUpdate("delete from database.goods where gno=\""+no+"\"");
        	  con.close();
        	  }
        catch(SQLException e) {}
	}
}


