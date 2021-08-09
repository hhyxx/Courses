using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite7
{
    public partial class Master1 : System.Web.UI.MasterPage
    {
        public String WebSiteName
        {
            get { return (String)ViewState["WebsiteName"]; }
            set { ViewState["WebsiteName"] = value; }
        }
        void Page_Init(Object sender, EventArgs e)
        {
            this.WebSiteName = "母版页测试";
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session["masterpage"] = "Master2.master";
            Response.Redirect(Request.Url.ToString());

        }

       

    }
}