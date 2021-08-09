using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite13
{
    public partial class Trans_xml : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            //读取XML文本数据到DataSet数据集
            ds.ReadXml(Server.MapPath("students.xml"));
            //将DataSet的数据转换为字符串
            Label1.Text = ds.GetXml();
        }

    }
}