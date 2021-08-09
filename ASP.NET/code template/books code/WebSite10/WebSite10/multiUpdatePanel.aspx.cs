using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite10
{
    public partial class multiUpdatePanel : System.Web.UI.Page
    {

        protected void InsertButton_Click(object sender, EventArgs e)
        {
            ListBox1.Items.Add(TextBox1.Text);
            TextBox1.Text = String.Empty;
        }

        protected void Cancelbutton_Click(object sender, EventArgs e)
        {
            TextBox1.Text = String.Empty;
        }
    }
}