using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Session1 : System.Web.UI.Page
{
    protected void Button1_Click(object sender, EventArgs e)
    {
        Session["学号"] = TextBox1.Text;
        Session["姓名"] = TextBox2.Text;
        Server.Transfer("Session2.aspx");
    }
}