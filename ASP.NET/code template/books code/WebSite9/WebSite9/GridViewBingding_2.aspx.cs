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
    public partial class GridViewBingding_2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) bindgrid();
        }
        void bindgrid()
        {
            string sqlconnstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString; ;
            DataSet ds = new DataSet();
            using (SqlConnection sqlconn = new SqlConnection(sqlconnstr))
            {
                SqlDataAdapter sqld = new SqlDataAdapter("select * from student", sqlconn);
                sqld.Fill(ds, "tabstudent");
            }
            //判断是否已经进行排序，如果是则按照ViewState中存储的信息生成排序后的DataView对象
            if (ViewState["SortDirection"] == null)
                GridView1.DataSource = ds.Tables["tabstudent"].DefaultView;
            else
            {
                DataView SortedDV = new DataView(ds.Tables["tabstudent"]);
                SortedDV.Sort = ViewState["SortExpression"].ToString() + " " + ViewState["SortDirection"].ToString();
                GridView1.DataSource = SortedDV;
            }
            GridView1.DataBind();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            bindgrid();
        }
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string sqlconnstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString; ;
            SqlConnection sqlconn = new SqlConnection(sqlconnstr);
            //提交行修改
            sqlconn.Open();
            SqlCommand Comm = new SqlCommand();
            Comm.Connection = sqlconn;
            Comm.CommandText = "update student set Name=@Name,birthday=@birthday,Adress=@Adress where No=@No";
            Comm.Parameters.AddWithValue("@No", GridView1.DataKeys[e.RowIndex].Value.ToString());
            Comm.Parameters.AddWithValue("@Name", ((TextBox)GridView1.Rows[e.RowIndex].Cells[1].Controls[0]).Text);
            Comm.Parameters.AddWithValue("@birthday", ((TextBox)GridView1.Rows[e.RowIndex].Cells[2].Controls[0]).Text);
            Comm.Parameters.AddWithValue("@Adress", ((TextBox)GridView1.Rows[e.RowIndex].Cells[3].Controls[0]).Text);
            Comm.ExecuteNonQuery();
            sqlconn.Close();
            sqlconn = null;
            Comm = null;
            GridView1.EditIndex = -1;
            bindgrid();
        }
        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            bindgrid();
        }
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //设置数据库连接
            string sqlconnstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString; ;
            SqlConnection sqlconn = new SqlConnection(sqlconnstr);
            sqlconn.Open();
            //删除行处理
            String sql = "delete from student where No='" + GridView1.DataKeys[e.RowIndex].Value.ToString() + "'";
            SqlCommand Comm = new SqlCommand(sql, sqlconn);
            Comm.ExecuteNonQuery();
            sqlconn.Close();
            sqlconn = null;
            Comm = null;
            GridView1.EditIndex = -1;
            bindgrid();
        }
        protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
        {
            if (ViewState["SortDirection"] == null) ViewState["SortDirection"] = "DESC";
            if (ViewState["SortDirection"].ToString() == "ASC")
                ViewState["SortDirection"] = "DESC";
            else
                ViewState["SortDirection"] = "ASC";
            ViewState["SortExpression"] = e.SortExpression;
            this.DataBind();
        }	


    }
}