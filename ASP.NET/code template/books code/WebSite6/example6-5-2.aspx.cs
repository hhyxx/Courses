using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class example6_5_2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (PreviousPage != null)
        {
            TextBox Textbox1 = (TextBox)PreviousPage.FindControl("TextBox1");
            TextBox Textbox2 = (TextBox)PreviousPage.FindControl("TextBox2");
            Label1.Text = "学号：" + Textbox1.Text;
            Label2.Text = "姓名：" + Textbox2.Text;
        }
    }
}
