using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite13
{
    public partial class read_xml : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            //读取XML文本数据到DataSet数据集
            ds.ReadXml(Server.MapPath("students.xml"));
            //绑定数据源
            GridView1.DataSource = ds.Tables[0].DefaultView;
            GridView1.DataBind();
        }

    }
}