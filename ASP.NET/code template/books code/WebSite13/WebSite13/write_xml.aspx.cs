using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite13
{
    public partial class write_xml : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //从Web.Config中取出数据库连接串
            string sqlconnstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            //创建连接对象
            SqlConnection sqlconn = new SqlConnection(sqlconnstr);
            //创建DataSet对象
            DataSet ds = new DataSet();
            //打开连接
            sqlconn.Open();
            //创建适配器对象
            SqlDataAdapter sqld = new SqlDataAdapter("select no,name,sex, CONVERT(char(10), birth,20) AS birth,address from student", sqlconn);
            //利用适配器方法添加数据给DataSet
            sqld.Fill(ds, "student");
            //将DataSet数据写成XML文本
            ds.WriteXml(Server.MapPath("students.xml"));
            sqlconn.Close();
            Label1.Text = "写入成功";
        }

    }
}