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
  public partial class command_insert : System.Web.UI.Page
  {
    protected void Button1_Click(object sender, EventArgs e)
    {
      string sqlconnstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
      SqlConnection sqlconn = new SqlConnection(sqlconnstr);

      //建立Command对象
      SqlCommand sqlcommand = new SqlCommand();
      sqlcommand.Connection = sqlconn;
      //把SQL语句赋给Command对象

      // 语句的具体值为文本输入的内容
      sqlcommand.CommandText = "insert into student(No,Name,Sex,birthday,Adress,Photo) values (@No,@Name,@Sex,@birthday,@Adress,@Photo)";
      sqlcommand.Parameters.AddWithValue("@No",TextBox1.Text);    
      sqlcommand.Parameters.AddWithValue("@Name",TextBox2.Text);    
      sqlcommand.Parameters.AddWithValue("@Sex",DropDownList1.Text);    
      sqlcommand.Parameters.AddWithValue("@birthday",TextBox3.Text);    
      sqlcommand.Parameters.AddWithValue("@Adress",TextBox4.Text);    
      sqlcommand.Parameters.AddWithValue("@Photo",FileUpload1.FileName);  
      try
      {
           //打开连接
           sqlconn.Open();
           //执行SQL命令
           sqlcommand.ExecuteNonQuery(); // 执行无返回值的SQL 命令
           
           //把学生的照片上传到网站的images文件夹中
          if (FileUpload1.HasFile == true) // 如果有文件的话
           {
               FileUpload1.SaveAs(Server.MapPath(("~/image/") + FileUpload1.FileName));
           }
           Label1.Text = "成功增加记录"; 
      }
      catch (Exception ex)
      {
           Label1.Text = "错误原因："+ ex.Message;
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