using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class example3_5 : System.Web.UI.Page{
    string VSString ="basketball";
    protected void Page_Load(object sender, EventArgs e){
        if (!Page.IsPostBack){ // 未回传时
            ViewState.Add("favorite", VSString);
        }
    }
    protected void Button1_Click(object sender, EventArgs e){
        if (TextBox1.Text!= ""){
            VSString = this.TextBox1.Text;
            ViewState["favorite"] = VSString;
        }
    }
    protected void Button2_Click(object sender, EventArgs e){
        if (ViewState["favorite"] != null){
            this.Label1.Text = ViewState["favorite"].ToString();
        }
        else{
            this.Label1.Text = "查看的ViewState值不存在";
        }
    }
}