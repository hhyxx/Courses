using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//引用数据库访问名称空间
using System.Data.SqlClient;
using System.Configuration;


namespace WebSite8
{
    public partial class connection : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //从web.config配置文件取出数据库连接串
            string sqlconnstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            //建立数据库连接对象
            SqlConnection sqlconn = new SqlConnection(sqlconnstr);
            //打开连接对象
            sqlconn.Open();
            Label1.Text = "成功建立SQL Server 2012数据库连接";
            //关闭连接对象
            sqlconn.Close();
            sqlconn = null;
        }

    }
}