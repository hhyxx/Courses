using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite8{
    public partial class DataAdapter_insert : System.Web.UI.Page{
        protected void Page_Load(object sender, EventArgs e){}
        protected void Button1_Click(object sender, EventArgs e){
            string sqlconnstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection sqlconn = new SqlConnection(sqlconnstr);
            DataSet ds = new DataSet();//建立DataSet对象
            DataTable dtable;//建立DataTable对象
            DataRow drow;//建立DataRow对象
            sqlconn.Open();//打开连接
            //建立DataAdapter对象
            SqlDataAdapter sqld = new SqlDataAdapter("select * from student", sqlconn);
            //建立 CommandBuilder 对象来自动生成 DataAdapter 的 Command 命令，否则就要自己编写
            //Insertcommand ,deletecommand , updatecommand 命令。
            SqlCommandBuilder cb = new SqlCommandBuilder(sqld);
            //用Fill方法返回的数据，填充DataSet，数据表取名为tabstudent
            sqld.Fill(ds, "tabstudent");
            //将数据表tabstudent的数据复制到DataTable对象
            dtable = ds.Tables["tabstudent"];
            //增加新记录
            drow = ds.Tables["tabstudent"].NewRow();
            //给该记录赋值
            drow[0] = "19";
            drow[1] = "陈峰";
            drow[2] = "男";
            ds.Tables["tabstudent"].Rows.Add(drow);
            //提交更新
            sqld.Update(ds, "tabstudent");
            sqlconn.Close();
            sqlconn = null;
            Label1.Text = "增加成功";
        }
    }
}