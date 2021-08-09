using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite5
{
    public partial class example5_12 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Literal1.Text = "This <b>text</b> is inserted dynamically.";
            Label1.Text = "This <b>text</b> is inserted dynamically.";
            if (radioEncode.Checked == true)
            {
                Literal1.Mode = LiteralMode.Encode;
            }
            if (radioPassthrough.Checked == true)
            {
                Literal1.Mode = LiteralMode.PassThrough;
            }
        }

    }
}