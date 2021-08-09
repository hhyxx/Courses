using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite7
{
    public partial class master2 : System.Web.UI.MasterPage
    {
        void LinkButton1_Click(Object sender, EventArgs e)
        {
            Session["masterpage"] = "Master1.master";
            Response.Redirect(Request.Url.ToString());
        }

    }
}