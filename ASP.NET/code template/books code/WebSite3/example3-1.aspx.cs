using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class example3_1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Write("Hello World!");
        Response.Write("<h2>Hello World!</h2>"); // html 标题标记
        Response.Write("<p style='color:#0000ff'>Hello World!</p>");
    }
}