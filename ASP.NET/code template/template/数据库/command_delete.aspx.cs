using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite8{
    public partial class command_delete : System.Web.UI.Page{
        protected void Button1_Click(object sender, EventArgs e){
            int intDeleteCount;
            string sqlconnstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection sqlconn = new SqlConnection(sqlconnstr);
            //建立Command对象
            SqlCommand sqlcommand = new SqlCommand();
            //给Command对象的Connection和CommandText属性赋值
            sqlcommand.Connection = sqlconn;
            sqlcommand.CommandText = "delete from student where no=@no";
            sqlcommand.Parameters.AddWithValue("@no", TextBox1.Text);
            try{
                sqlconn.Open();
                // 返回的是删除的记录个数
                intDeleteCount = sqlcommand.ExecuteNonQuery();
                if (intDeleteCount > 0)
                    Label1.Text = "成功删除记录";
                else
                    Label1.Text = "该记录不存在";
            }
            catch (Exception ex){
                Label1.Text = "错误原因：" + ex.Message;
            }
            finally{
                sqlcommand = null;
                sqlconn.Close();
                sqlconn = null;
            }
        }
    }
}