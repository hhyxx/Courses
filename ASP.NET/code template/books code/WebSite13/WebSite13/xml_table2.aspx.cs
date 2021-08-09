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
    public partial class xml_table2 : System.Web.UI.Page
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
            //读取xml
            xmldoc.Load(Server.MapPath("studentinfo.xml"));
            //得到整个元素
            XmlElement xmle = xmldoc.DocumentElement;
            //遍历每个元素
            for (int i = 0; i < xmle.ChildNodes.Count; i++)
            {
                XmlNode xmln = xmle.ChildNodes[i];
                if (xmln.ChildNodes[2].InnerText == "男")
                {
                    DataRow newrow = dt.NewRow();
                    newrow["no"] = xmln.ChildNodes[0].InnerText;
                    newrow["name"] = xmln.ChildNodes[1].InnerText;
                    newrow["sex"] = xmln.ChildNodes[2].InnerText;
                    newrow["birth"] = xmln.ChildNodes[3].InnerText;
                    newrow["address"] = xmln.ChildNodes[4].InnerText;
                    dt.Rows.Add(newrow);
                }
            }
            //自动生成提交语句
            SqlCommandBuilder objcb = new SqlCommandBuilder(sqld);
            //提交数据库
            sqld.Update(ds, "student");
            //绑定数据
            GridView1.DataSource = ds.Tables["student"].DefaultView;
            GridView1.DataBind();
        }
    }
}