# 1. Web.config配置

``` html
<?xml version="1.0" encoding="utf-8"?>
<configuration>
  <system.web>
    <compilation debug="true" targetFramework="4.5" />
    <httpRuntime targetFramework="4.5" />
  </system.web>
  <connectionStrings>
    <add name="ConnectionString" connectionString="Data Source=.; Initial Catalog=test; User ID=sa; Password=123456; Integrated Security=True" providerName="System.Data.SqlClient"/>
  </connectionStrings>
</configuration>
```



+ Data Source ：表示数据库服务器的名称
  +  `.`   ： 表示本地数据库
+ AttachDbFilename ： 表示数据库的路径和文件名
+ | DataDirectory |  表示网站默认数据库路径App_Data
+ Connection 的 Open( ) 方法 打开数据库
+ Connection 的 Close( ) 方法 关闭数据库连接



# 2. Command

+ `connection`： 数据库连接信息的`Connection`对象
+ `CommandText`： SQL 指令
+ `CommandType`：命令类型
+ `Parameters`：`Parameters`对象集合



## 2.1. Command 完成查询操作



```c#
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace WebSite8
{
    public partial class command_test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string sqlconnstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
         
          SqlConnection sqlconn = new SqlConnection(sqlconnstr); //建立Command 对象
            SqlCommand sqlcommand = new SqlCommand();
            sqlcommand.Connection = sqlconn;//给connection 属性赋值

            sqlconn.Open();//打开连接
            sqlcommand.CommandText = "select * from student";    //SQL 命令赋值

            //建立DataReader对象，返回查询结果
            SqlDataReader sqldatareader = sqlcommand.ExecuteReader();

            //逐行遍历查询结果
            while (sqldatareader.Read())
            {
                Label1.Text += sqldatareader.GetString(0) + "&nbsp;&nbsp;";
                Label1.Text += sqldatareader.GetString(1) + "&nbsp;&nbsp;";
                Label1.Text += sqldatareader.GetString(2) + "&nbsp;&nbsp;";
                Label1.Text += sqldatareader.GetDateTime(3) + "&nbsp;&nbsp;";
                Label1.Text += sqldatareader.GetString(4) + "&nbsp;&nbsp;";
                Label1.Text += sqldatareader.GetString(5) + "&nbsp;&nbsp;<br>";
            };
            sqlcommand = null; // 
            sqlconn.Close();
            sqlconn = null; // 
        }
    }
}
```



## 2.2. Command 完成插入

```c#
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
      SqlCommand sqlcommand = new SqlCommand();      //建立Command对象
      sqlcommand.Connection = sqlconn;      //把SQL语句赋给Command对象

      // 语句的具体值为文本输入的内容
      sqlcommand.CommandText = "insert into student(No,Name,Sex,birthday,Adress,Photo)values (@No,@Name,@Sex,@birthday,@Adress,@Photo)";
      sqlcommand.Parameters.AddWithValue("@No",TextBox1.Text);    
      sqlcommand.Parameters.AddWithValue("@Name",TextBox2.Text);    
      sqlcommand.Parameters.AddWithValue("@Sex",DropDownList1.Text);    
      sqlcommand.Parameters.AddWithValue("@birthday",TextBox3.Text);    
      sqlcommand.Parameters.AddWithValue("@Adress",TextBox4.Text);    
      sqlcommand.Parameters.AddWithValue("@Photo",FileUpload1.FileName);  
       
      try{

        sqlconn.Open();         //打开连接
        sqlcommand.ExecuteNonQuery(); // 执行无返回值的SQL 命令
         
         //把学生的照片上传到网站的images文件夹中
        if(FileUpload1.HasFile == true){ // 如果有文件的话
          FileUpload1.SaveAs(Server.MapPath(("~/image/") + FileUpload1.FileName));
        }
         Label1.Text = "成功增加记录"; 
      }
      catch (Exception ex){
        Label1.Text = "错误原因："+ ex.Message;
      }
      finally{
        sqlcommand = null;
        sqlconn.Close();
        sqlconn = null;
      }
    }
  }
}
```



## 2.3. Command 完成删除

```c#
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
    public partial class command_delete : System.Web.UI.Page
    {
        protected void Button1_Click(object sender, EventArgs e)
        {
            int intDeleteCount;
            string sqlconnstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection sqlconn = new SqlConnection(sqlconnstr);

            SqlCommand sqlcommand = new SqlCommand();            //建立Command对象
            //给Command对象的Connection和CommandText属性赋值
            sqlcommand.Connection = sqlconn;
            sqlcommand.CommandText = "delete from student where no=@no";
            sqlcommand.Parameters.AddWithValue("@no", TextBox1.Text);
            try
            {
                sqlconn.Open();
                // 返回的是删除的记录个数
                intDeleteCount = sqlcommand.ExecuteNonQuery();
                if (intDeleteCount > 0)
                    Label1.Text = "成功删除记录";
                else
                    Label1.Text = "该记录不存在";
            }
            catch (Exception ex)
            {
                Label1.Text = "错误原因：" + ex.Message;
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
```





## 2.4. Command 完成修改

```sql
/* 修改数据存储过程 */
CREATE  PROCEDURE update_student
( 
   @No nvarchar(10),
   @Name nvarchar(50),
   @Sex nvarchar(2),
   @birthday datetime,
   @adress nvarchar(50),
   @Photo nvarchar(50)
) 
 AS 
   UPDATE student SET  
 No=@No,Name=@Name,Sex=@Sex,birthday=@birthday,adress=@adress,Photo=@Photo WHERE No=@No
   RETURN 0    
```



```c#
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite8
{
    public partial class command_update : System.Web.UI.Page
    {
        protected void Button1_Click(object sender, EventArgs e)
        {
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
            try
            {
                sqlconn.Open();//打开连接
                intUpdateCount = sqlcommand.ExecuteNonQuery();//执行SQL命令,返回修改的记录数量
                //把学生的照片上传到网站的image文件夹中
                if (FileUpload1.HasFile == true)
                {
                    FileUpload1.SaveAs(Server.MapPath(("~/images/") + FileUpload1.FileName));
                }
                if (intUpdateCount > 0)
                    Label1.Text = "成功修改记录";
                else
                    Label1.Text = "该记录不存在";
            }
            catch (Exception ex)
            {
                Label1.Text = "错误原因：" + ex.Message;
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
```



# 3. DataAdapter

DataSet > DataTable > DataRow	

## 3.1. DataAdapter 完成查询

```c# 
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite8
{
    public partial class DataAdapter_select : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string sqlconnstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection sqlconn = new SqlConnection(sqlconnstr);

            DataSet ds = new DataSet(); //建立DataSet对象
            DataTable dtable;		//建立DataTable对象

            //建立DataRowCollection对象
            DataRowCollection coldrow; // 类似DataRow 的数组
            DataRow drow;//建立DataRow对象
            sqlconn.Open();//打开连接

            //建立DataAdapter对象
            SqlDataAdapter sqld = new SqlDataAdapter("select * from student", sqlconn);
            //用Fill方法返回的数据，填充DataSet，数据表取名为tabstudent
            sqld.Fill(ds, "tabstudent"); 
            //将数据表tabstudent的数据复制到DataTable对象
            dtable = ds.Tables["tabstudent"];
            //用DataRowCollection对象获取这个数据表的所有数据行
            coldrow = dtable.Rows; // 不同下标对应不同的行
            //逐行遍历，取出各行的数据
            for (int i = 0; i < coldrow.Count; i++)
            {
                drow = coldrow[i]; // 不同下标对应当前列中的不同行
	
                Label1.Text += "学号：" + drow[0];
                Label1.Text += " 姓名：" + drow[1];
                Label1.Text += " 性别：" + drow[2];
                Label1.Text += " 出生日期：" + drow[3];
                Label1.Text += " 地址：" + drow[4] + "<br />";
            }
            sqlconn.Close();
            sqlconn = null;
        }
    }
}
```



## 3.2. DataAdapter 完成修改



```c#
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite8
{
    public partial class DataAdapter_update : System.Web.UI.Page
    {
        protected void Button1_Click(object sender, EventArgs e)
        {
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
          for (int i = 0; i < coldrow.Count; i++)
          {
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
```



## 3.3. DataAdapter 完成删除

```c#
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite8
{
    public partial class DataAdapter_delete : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e){}

        protected void Button1_Click(object sender, EventArgs e)
        {
            string sqlconnstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection sqlconn = new SqlConnection(sqlconnstr);
            DataSet ds = new DataSet();
            DataTable dtable;
            DataRowCollection coldrow;
            DataRow drow;
            sqlconn.Open();
            //建立DataAdapter对象
            SqlDataAdapter sqld = new SqlDataAdapter("select * from student", sqlconn);
            //建立 CommandBuilder 对象来自动生成 DataAdapter 的 Command 命令，否则就要自己编写
            //Insertcommand ,deletecommand , updatecommand 命令。
            SqlCommandBuilder cb = new SqlCommandBuilder(sqld);
            //用Fill方法返回的数据，填充DataSet，数据表取名为tabstudent
            sqld.Fill(ds, "tabstudent");
            dtable = ds.Tables["tabstudent"];
            coldrow = dtable.Rows;
            //逐行遍历，删除地址为空的记录
            for (int inti = 0; inti < coldrow.Count; inti++)
            {
                drow = coldrow[inti];
                if (drow["Adress"].ToString() == "")
                    drow.Delete();
            }
            //提交更新
            sqld.Update(ds, "tabstudent");
            sqlconn.Close();
            sqlconn = null;
            Label1.Text = "删除成功";
        }
    }
}
```



## 3.4. DataAdapter 完成增加

```c#
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite8
{
    public partial class DataAdapter_insert : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e){}
        protected void Button1_Click(object sender, EventArgs e)
        {
            string sqlconnstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection sqlconn = new SqlConnection(sqlconnstr);
            DataSet ds = new DataSet();//建立DataSet对象
            DataTable dtable;//建立DataTable对象
            DataRow drow;//建立DataRow对象
            sqlconn.Open();//打开连接
            //建立DataAdapter对象
            SqlDataAdapter sqld = new SqlDataAdapter("select * from student", sqlconn);
            //建立 CommandBuilder 对象来自动生成 DataAdapter 的 Command 命令，否则就要自己编写
            //Insertcommand ,deletecommand , updatecommand 命令。
            SqlCommandBuilder cb = new SqlCommandBuilder(sqld);
            //用Fill方法返回的数据，填充DataSet，数据表取名为tabstudent
            sqld.Fill(ds, "tabstudent");
            //将数据表tabstudent的数据复制到DataTable对象
            dtable = ds.Tables["tabstudent"];
            //增加新记录
            drow = ds.Tables["tabstudent"].NewRow();
            //给该记录赋值
            drow[0] = "19";
            drow[1] = "陈峰";
            drow[2] = "男";
            ds.Tables["tabstudent"].Rows.Add(drow);
            //提交更新
            sqld.Update(ds, "tabstudent");
            sqlconn.Close();
            sqlconn = null;
            Label1.Text = "增加成功";
        }
    }
}
```





# 4. Connection 对象完成事务处理



+ BeginTransaction ：标记事务的开始
  + Commit方法 ： 提交事务
  + Rollback方法：回滚事务



```c#
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
```





