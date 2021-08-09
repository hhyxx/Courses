using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite7
{
    public partial class example7_11 : System.Web.UI.Page
    {
 

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["themepage"] = "Theme3";  // 将专业型1主题保存到Session中
            Response.Redirect(Request.Url.ToString());

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Session["themepage"] = "Theme4";   // 将专业型2主题保存到Session中
            Response.Redirect(Request.Url.ToString());

        }
        void Page_PreInit(object sender, EventArgs e)
        {
            if (Session["themepage"] != null)
            {
                this.Theme = (String)Session["themepage"];
            }
            else
            {
                this.Theme = "Theme3";  // 默认加载专业型1主题
            }
        }

    }
}