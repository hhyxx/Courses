using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite8
{
    public partial class DataAdapter_select : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string sqlconnstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection sqlconn = new SqlConnection(sqlconnstr);
            //建立DataSet对象
            DataSet ds = new DataSet();
            //建立DataTable对象

            DataTable dtable;

            //建立DataRowCollection对象
            DataRowCollection coldrow; // 类似DataRow 的数组

            //建立DataRow对象
            DataRow drow;

            //打开连接
            sqlconn.Open();

            //建立DataAdapter对象
            SqlDataAdapter sqld = new SqlDataAdapter("select * from student", sqlconn);

            //用Fill方法返回的数据，填充DataSet，数据表取名为tabstudent
            sqld.Fill(ds, "tabstudent"); 

            //将数据表tabstudent的数据复制到DataTable对象
            dtable = ds.Tables["tabstudent"];

            //用DataRowCollection对象获取这个数据表的所有数据行
            coldrow = dtable.Rows;

            // 避免使用二维数组，减少空间消耗

            //逐行遍历，取出各行的数据
            for (int i = 0; i < coldrow.Count; i++)
            {
                drow = coldrow[i];

                Label1.Text += "学号：" + drow[0];
                Label1.Text += " 姓名：" + drow[1];
                Label1.Text += " 性别：" + drow[2];
                Label1.Text += " 出生日期：" + drow[3];
                Label1.Text += " 地址：" + drow[4] + "<br />";
            }
            sqlconn.Close();
            sqlconn = null;
        }
    }
}