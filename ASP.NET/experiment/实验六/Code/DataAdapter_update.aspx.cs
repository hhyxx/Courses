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
    public partial class DataAdapter_update : System.Web.UI.Page{
        protected void Button1_Click(object sender, EventArgs e){
          string sqlconnstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString; 
          SqlConnection sqlconn = new SqlConnection(sqlconnstr);//建立DataSet对象
          DataSet ds = new DataSet();//建立DataTable对象
          DataTable dtable;
          DataRowCollection coldrow;//建立DataRowCollection对象
          DataRow drow;//建立DataRow对象
          
          sqlconn.Open();//打开连接
          

          SqlDataAdapter sqld = new SqlDataAdapter("select * from student", sqlconn);//建立DataAdapter对象
          //自己定义Update命令，其中@NAME，@NO是两个参数
          sqld.UpdateCommand = new SqlCommand("UPDATE student SET NAME = @NAME WHERE NO = @NO", sqlconn);
          //定义@NAME参数，对应于student表的NAME列
          sqld.UpdateCommand.Parameters.Add("@NAME", SqlDbType.VarChar, 50, "NAME");
          //定义@NO参数，对应于student表的NO列，而且@NO是修改前的原值
          SqlParameter parameter = sqld.UpdateCommand.Parameters.Add("@NO", SqlDbType.VarChar, 10);
          parameter.SourceColumn = "NO";
          parameter.SourceVersion = DataRowVersion.Original;
          //用Fill方法返回的数据，填充DataSet，数据表取名为tabstudent
          sqld.Fill(ds, "tabstudent");
          //将数据表tabstudent的数据复制到DataTable对象
          dtable = ds.Tables["tabstudent"];
          //用DataRowCollection对象获取这个数据表的所有数据行
          coldrow = dtable.Rows;
          // 获取原有的数据库
          //修改操作，逐行遍历，取出各行的数据
          for (int i = 0; i < coldrow.Count; i++){
              drow = coldrow[i];
              //给每位学生姓名后加上字母A
              drow[1]=drow[1]+"A";
          }
          //提交更新
          sqld.Update(ds, "tabstudent");
          sqlconn.Close();
          sqlconn = null;
          Label1.Text = "更新成功"; 
        }
    }
}