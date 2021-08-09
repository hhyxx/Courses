using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite10
{
    public partial class TimerExample2 : System.Web.UI.Page
    {
        protected void Timer1_Tick(object sender, EventArgs e)
        {
            Label1.Text = "UpdatePanel1 更新于： " + DateTime.Now.ToLongTimeString();
            Label2.Text = "UpdatePanel2 更新于： " + DateTime.Now.ToLongTimeString();
        }

    }
}