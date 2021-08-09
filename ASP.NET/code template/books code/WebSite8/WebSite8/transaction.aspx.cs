using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite8
{
    public partial class transaction : System.Web.UI.Page
    {
        protected void Button1_Click(object sender, EventArgs e)
        {
            string sqlconnstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection sqlconn = new SqlConnection(sqlconnstr);
            sqlconn.Open();
            //开始事务
            SqlTransaction tran = sqlconn.BeginTransaction();
            SqlCommand sqlcommand = new SqlCommand();
            sqlcommand.Connection = sqlconn;
            sqlcommand.Transaction = tran;
            try
            {
                sqlcommand.CommandText = "update student set Adress='beijing' where No=1";
                sqlcommand.ExecuteNonQuery();
                sqlcommand.CommandText = "update student set Adress='zhengzhou' where No=2";
                sqlcommand.ExecuteNonQuery();
                tran.Commit();
                Label1.Text = "事务提交成功";
            }
            catch (Exception ex)
            {
                tran.Rollback(); // 提交失败就回滚撤销此次操作
                Label1.Text = "事务提交失败：" + ex.Message;
            }
            finally
            {
                sqlcommand = null;
                sqlconn.Close();
                sqlconn = null;
            }
        }

    }
}