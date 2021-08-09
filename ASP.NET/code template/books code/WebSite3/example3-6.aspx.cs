using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class example3_6 : System.Web.UI.Page{

    protected void Button1_Click(object sender, EventArgs e){
        Response.Cookies["userName"].Value = "BUAA University";
        Response.Cookies["userName"].Expires = DateTime.Now.AddDays(1);
        this.Label1.Text = "写入完毕！";
    }
    protected void Button2_Click(object sender, EventArgs e){
        if (Request.Cookies["userName"] != null){
            Label1.Text = Server.HtmlEncode(Request.Cookies["userName"].Value);
        }
    }
}