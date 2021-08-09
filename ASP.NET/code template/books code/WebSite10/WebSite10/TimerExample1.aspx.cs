using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite10
{
    public partial class TimerExample1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack == false)
            {
                //设置网页上的变量
                ViewState["number"] = 1;
            }
        }
        protected void Timer1_Tick(object sender, EventArgs e)
        {
            ViewState["number"] = (int)ViewState["number"] % 4 + 1;
            Image1.ImageUrl = string.Format("~/images/{0}.png", ViewState["number"]);
        }

    }
}