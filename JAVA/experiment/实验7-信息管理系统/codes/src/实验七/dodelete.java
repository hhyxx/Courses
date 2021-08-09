package 实验七;

import java.sql.SQLException;

public class dodelete {
	public static void main(String args[]) {
		getdelete("201811050392");
	}
	
	public static void getdelete(String no) {
	    java.sql.Connection con;
        java.sql.Statement sql; 
        con = GetDBConnection.connectDB();
        try { 
        	  sql=con.createStatement();
        	  sql.executeUpdate("delete from database.Student where Sno=\""+no+"\"");
        	  con.close();
        	  }
        catch(SQLException e) {}
	}
}
