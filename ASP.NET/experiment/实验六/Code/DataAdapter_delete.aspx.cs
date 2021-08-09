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
    public partial class DataAdapter_delete : System.Web.UI.Page{
        protected void Page_Load(object sender, EventArgs e){}

        protected void Button1_Click(object sender, EventArgs e){
            string sqlconnstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection sqlconn = new SqlConnection(sqlconnstr);
            DataSet ds = new DataSet();
            DataTable dtable;
            DataRowCollection coldrow;
            DataRow drow;
            sqlconn.Open();
            //建立DataAdapter对象
            SqlDataAdapter sqld = new SqlDataAdapter("select * from student", sqlconn);
            //建立 CommandBuilder 对象来自动生成 DataAdapter 的 Command 命令，否则就要自己编写
            //Insertcommand ,deletecommand , updatecommand 命令。
            SqlCommandBuilder cb = new SqlCommandBuilder(sqld);
            //用Fill方法返回的数据，填充DataSet，数据表取名为tabstudent
            sqld.Fill(ds, "tabstudent");
            dtable = ds.Tables["tabstudent"];
            coldrow = dtable.Rows;
            //逐行遍历，删除地址为空的记录
            for (int inti = 0; inti < coldrow.Count; inti++){
                drow = coldrow[inti];
                if (drow["Adress"].ToString() == "")
                    drow.Delete();
            }
            //提交更新
            sqld.Update(ds, "tabstudent");
            sqlconn.Close();
            sqlconn = null;
            Label1.Text = "删除成功";
        }
    }
}