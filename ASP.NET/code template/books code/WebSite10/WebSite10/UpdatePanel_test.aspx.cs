using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite10
{
    public partial class UpdatePanel_test : System.Web.UI.Page
    {

        protected void Button1_Click(object sender, EventArgs e){
            this.Label2.Text = DateTime.Now.ToString();
        }

        protected void Button2_Click(object sender, EventArgs e){
            this.Label2.Text = DateTime.Now.ToString();
        }
    }
}