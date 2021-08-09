using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite13
{
    public partial class edit_xml : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //建立DataSet对象
            DataSet ds = new DataSet();
            ds.ReadXml(Server.MapPath("students.xml"));
            //建立DataTable对象
            DataTable dtable;
            //建立DataRowCollection对象
            DataRowCollection coldrow;
            //建立DataRow对象
            DataRow drow;
            //将数据表tabstudent的数据复制到DataTable对象
            dtable = ds.Tables[0];
            //用DataRowCollection对象获取这个数据表的所有数据行
            coldrow = dtable.Rows;
            //修改操作，逐行遍历，取出各行的数据
            for (int inti = 0; inti < coldrow.Count; inti++)
            {
                drow = coldrow[inti];
                //给每位学生姓名后加上字母A
                drow[1] = drow[1] + "A";
            }
            //将DataSet数据写成XML文本
            ds.WriteXml(Server.MapPath("students.xml"));
            //绑定数据源
            GridView1.DataSource = ds.Tables[0].DefaultView;
            GridView1.DataBind();
        }

    }
}