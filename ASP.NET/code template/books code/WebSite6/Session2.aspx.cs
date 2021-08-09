using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Session2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["学号"] != null)
        {
            Label1.Text = "学号：" + Session["学号"].ToString();
        }
        if (Session["姓名"] != null)
        {
            Label2.Text = "姓名：" + Session["姓名"].ToString();
        }
    }
}