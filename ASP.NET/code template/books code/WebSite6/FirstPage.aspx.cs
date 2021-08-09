using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FirstPage : System.Web.UI.Page
{
    protected void Button1_Click(object sender, EventArgs e)
    {
       Server.Transfer(string.Format("SecondPage.aspx?学号={0}&姓名={1}",Server.UrlEncode(TextBox1.Text), Server.UrlEncode(TextBox2.Text)));
    }
}