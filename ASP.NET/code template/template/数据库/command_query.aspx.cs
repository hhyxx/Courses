using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;


namespace WebSite8{
    public partial class command_test : System.Web.UI.Page{
        protected void Page_Load(object sender, EventArgs e){
            string sqlconnstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection sqlconn = new SqlConnection(sqlconnstr);
            //建立Command对象
            SqlCommand sqlcommand = new SqlCommand();
            //给sqlcommand的Connection属性赋值
            sqlcommand.Connection = sqlconn;
            //打开连接
            sqlconn.Open();
            //SQL命令赋值

            sqlcommand.CommandText = "select * from student";
            //建立DataReader对象，并返回查询结果
            SqlDataReader sqldatareader = sqlcommand.ExecuteReader();
            //逐行遍历查询结果
            // 下标从0开始，每次读取数据库中表的一行
            while (sqldatareader.Read()){
                Label1.Text += sqldatareader.GetString(0) + "&nbsp;&nbsp;";
                Label1.Text += sqldatareader.GetString(1) + "&nbsp;&nbsp;";
                Label1.Text += sqldatareader.GetString(2) + "&nbsp;&nbsp;";
                Label1.Text += sqldatareader.GetDateTime(3) + "&nbsp;&nbsp;";
                Label1.Text += sqldatareader.GetString(4) + "&nbsp;&nbsp;";
                Label1.Text += sqldatareader.GetString(5) + "&nbsp;&nbsp;<br>";
            };
            sqlcommand = null; // 置空
            sqlconn.Close();
            sqlconn = null; // 置空
        }
    }
}