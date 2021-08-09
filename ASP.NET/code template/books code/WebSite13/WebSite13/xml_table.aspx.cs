using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//引用命名空间
using System.Data.SqlClient;
using System.Data;
using System.Configuration;


namespace WebSite13
{
    public partial class xml_table : System.Web.UI.Page
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
            SqlDataAdapter sqld = new SqlDataAdapter("select * from student", sqlconn);
            //利用适配器方法添加数据给DataSet
            sqld.Fill(ds, "student");
            DataTable dt = ds.Tables["student"];
            //读取XML
            dt.ReadXml(Server.MapPath("studentinfo.xml"));
            //自动生成提交语句
            SqlCommandBuilder objcb = new SqlCommandBuilder(sqld);
            //提交数据库
            sqld.Update(ds, "student");
            //绑定数据源
            GridView1.DataSource = ds.Tables["student"].DefaultView;
            GridView1.DataBind();
        }

    }
}