using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite9{
    public partial class GridViewBingding_1 : System.Web.UI.Page{
        protected void Page_Load(object sender, EventArgs e){
            //查询student数据库获取结果集ds
            string sqlconnstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            DataSet ds = new DataSet();

            using (SqlConnection sqlconn = new SqlConnection(sqlconnstr)){
                SqlDataAdapter sqld = new SqlDataAdapter("select * from student", sqlconn);
                sqld.Fill(ds, "tabstudent");
            }
            //以数据集中名为tabstudent的DataTable作为数据源，为控件绑定数据
            GridView1.DataSource = ds.Tables["tabstudent"].DefaultView;
            GridView1.DataBind();
            //label中显示运行状态
            Label1.Text = "查找成功";
        }
    }
}