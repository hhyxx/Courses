using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite7
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        void Page_Load(Object sender, EventArgs e)
        {
            Label1.Text = Master.WebSiteName;
        }

    }
}