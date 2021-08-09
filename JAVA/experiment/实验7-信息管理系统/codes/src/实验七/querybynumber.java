package 实验七;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class querybynumber {
	public static void main(String args[]) {
		getquerybynumber("201811050392");
	}
	public static ArrayList<String> getquerybynumber(String str){//static 可以直接调用函数，不用创建对象
		ArrayList<String>list=new ArrayList<String>();
		java.sql.Connection con;
        java.sql.Statement sql; 
        ResultSet rs;
        
        con = GetDBConnection.connectDB();
        try { 
            sql=con.createStatement();
            rs = sql.executeQuery("select * from database.Student where Sno=\""+str+"\"");
            while(rs.next()) {
            	String Sno=rs.getString(1);
            	String Sname=rs.getString(2);
            	String Sdept=rs.getString(3);
            	String Smajor=rs.getString(4);
            	String record = Sno +"\t" + Sname + "\t" + Sdept +"\t" + Smajor;
            	list.add(record);
            }
            con.close();
        }
        catch(SQLException e) {}
        return list;
	}
}
