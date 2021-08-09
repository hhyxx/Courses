using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite10
{
    public partial class UpdateProgressExample1 : System.Web.UI.Page
    {
        protected void Button1_Click(object sender, EventArgs e)
        {
            //延迟3秒
            System.Threading.Thread.Sleep(3000);
            Label1.Text = DateTime.Now.ToString();
        }

    }
}