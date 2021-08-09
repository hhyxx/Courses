using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SecondPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = "学号：" + Server.UrlDecode(Request.QueryString["学号"]);
        Label2.Text = "姓名：" + Server.UrlDecode(Request.QueryString["姓名"]);
    }
}