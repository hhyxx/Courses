using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Xml;
using System.Configuration;
using System.Data;

namespace WebSite13
{
    public partial class write_xml2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //从Web.Config中取出数据库连接串
            string sqlconnstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            //创建连接对象
            SqlConnection sqlconn = new SqlConnection(sqlconnstr);
            //创建DataSet对象
            DataSet ds = new DataSet();
            //打开连接
            sqlconn.Open();
            //创建适配器对象
            SqlDataAdapter sqld = new SqlDataAdapter("select * from student", sqlconn);
            //利用适配器方法添加数据给DataSet
            sqld.Fill(ds, "student");
            DataTable dt = ds.Tables["student"];
            //创建XML文档
            XmlDocument xmldoc = new XmlDocument();
            //写入版本说明
            XmlDeclaration xmldecl = xmldoc.CreateXmlDeclaration("1.0", "utf-8", "yes");
            xmldoc.AppendChild(xmldecl);
            //写入根结点
            XmlElement students = xmldoc.CreateElement("students");
            xmldoc.AppendChild(students);
            //对每一行循环
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (dt.Rows[i][2].ToString() == "男")
                {
                    XmlElement student = xmldoc.CreateElement("student");
                    //循环每一列
                    for (int j = 0; j < dt.Columns.Count; j++)
                    {
                        XmlElement colname = xmldoc.CreateElement(dt.Columns[j].ColumnName);
                        colname.InnerText = dt.Rows[i][j].ToString();
                        student.AppendChild(colname);
                    }
                    students.AppendChild(student);
                }
            }
            //将xmldoc数据写成XML文本
            xmldoc.Save(Server.MapPath("student_men.xml"));
            sqlconn.Close();
            Label1.Text = "写入成功";
        } 

    }
}