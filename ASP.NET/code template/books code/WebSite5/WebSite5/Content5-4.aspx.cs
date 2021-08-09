using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite5
{
    public partial class Content5_4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        string scriptContent = Request.QueryString["user"].ToString() + "，欢迎您！请记住您的密码：" + Request.QueryString["password"].ToString();
        Response.Write(scriptContent);
        string scriptString = "alert('"+scriptContent+"');";
        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "success", scriptString, true);  

        }
    }
}