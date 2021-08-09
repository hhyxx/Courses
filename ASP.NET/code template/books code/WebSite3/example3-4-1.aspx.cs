using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class example3_4_1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (TextBox1.Text!="") 
        {
        	Session["username"] = TextBox1.Text;
        	Response.Redirect("example3-4-2.aspx");
        }
    }
}