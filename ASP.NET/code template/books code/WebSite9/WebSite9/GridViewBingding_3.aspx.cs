using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite9
{
    public partial class GridViewBingding_3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) bindgrid();
        }
        void bindgrid()
        {
            //查询student数据库获取结果集ds
            string sqlconnstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            DataSet ds = new DataSet();
            using (SqlConnection sqlconn = new SqlConnection(sqlconnstr))
            {
                SqlDataAdapter sqld = new SqlDataAdapter("select * from student", sqlconn);
                sqld.Fill(ds, "tabstudent");
            }
            //以数据集中名为tabstudent的DataTable作为数据源，为控件绑定数据
            GridView1.DataSource = ds.Tables["tabstudent"].DefaultView;
            GridView1.DataBind();
        }
        protected void GridView1_DataBound(object sender, EventArgs e)
        {
            //分页数据绑定前设置当前页信息
            Label2.Text = "共" + (GridView1.PageCount).ToString() + "页";
            Label1.Text = "第" + (GridView1.PageIndex + 1).ToString() + "页";
            Label3.Text = string.Format("总页数：{0}，当前页：{1}", GridView1.PageCount, GridView1.PageIndex + 1);
        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            //设置要显示的页的索引并重新绑定数据
            GridView1.PageIndex = e.NewPageIndex;
            bindgrid();
        }
    }
}