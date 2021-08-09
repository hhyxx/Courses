using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite5{
    public partial class example5_4 : System.Web.UI.Page{
         protected void Button1_Click(object sender, EventArgs e){
            //读取TextBox1控件的Text属性的值，并使用该值来设置TextBox2控件的Text属性的值。
            TextBox2.Text = Server.HtmlEncode(TextBox1.Text);
        }

          protected void Button2_Click(object sender, EventArgs e){
            if (TextBox3.Text ==" " || TextBox4.Text == ""){
               string scriptString = "alert('信息不全，请重新填写。'); ";
               Page.ClientScript.RegisterClientScriptBlock(this.GetType(),"warning", scriptString, true);
             }
           else{
               Response.Redirect(string.Format("Content5-4.aspx?user={0}&password={1}",
             TextBox3.Text, TextBox4.Text));
             }
          }
    }
}