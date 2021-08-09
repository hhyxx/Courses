using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite10
{
    public partial class WebForm2 : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            //首次加载初始化Calendar1对象
            if (!IsPostBack)
                Calendar1.SelectedDate = DateTime.Today;
        }

    }
}