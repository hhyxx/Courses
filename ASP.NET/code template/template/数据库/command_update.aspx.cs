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
    public partial class command_update : System.Web.UI.Page{
        protected void Button1_Click(object sender, EventArgs e){
            int intUpdateCount;
            string sqlconnstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection sqlconn = new SqlConnection(sqlconnstr);
            //建立Command对象
            SqlCommand sqlcommand = new SqlCommand();
            sqlcommand.Connection = sqlconn;
            //把存储过程名称赋给Command对象的CommandText属性
            sqlcommand.CommandText = "update_student";
            sqlcommand.CommandType = CommandType.StoredProcedure;//说明命令类型为存储过程
            sqlcommand.Parameters.AddWithValue("@No", TextBox1.Text);
            sqlcommand.Parameters.AddWithValue("@Name", TextBox2.Text);
            sqlcommand.Parameters.AddWithValue("@Sex", DropDownList1.Text);
            sqlcommand.Parameters.AddWithValue("@birthday", TextBox3.Text);
            sqlcommand.Parameters.AddWithValue("@Adress", TextBox4.Text);
            sqlcommand.Parameters.AddWithValue("@Photo", FileUpload1.FileName);
            try{
                sqlconn.Open();//打开连接
                
                intUpdateCount = sqlcommand.ExecuteNonQuery();//执行SQL命令
                //把学生的照片上传到网站的image文件夹中
                if (FileUpload1.HasFile == true){
                    FileUpload1.SaveAs(Server.MapPath(("~/images/") + FileUpload1.FileName));
                }
                if (intUpdateCount > 0)
                    Label1.Text = "成功修改记录";
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