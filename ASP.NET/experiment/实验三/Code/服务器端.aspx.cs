using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e){}
    protected void CheckBox1_CheckedChanged(object sender, EventArgs e){}
    protected void Button2_Click(object sender, EventArgs e){
        TextBox3.Text = "";
        TextBox4.Text = "";
        TextBox5.Text = "";
        TextBox6.Text = "";
        CheckBox1.Checked = false;
        CheckBox2.Checked = false;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string str = "";
        str += "    姓名为:    " + TextBox3.Text;
        if(CheckBox1.Checked) 
            str += "    性别为:    男";
        else
            str += "    性别为:    女";
        str += "年龄为:    " + TextBox4.Text;
        str += "    部门为:    " + DropDownList1.SelectedItem.Text;
        str += "    工资为:    " + TextBox5.Text;
        str += "    民族为:    " + DropDownList2.SelectedItem.Text;
        str += "    备注信息为:    " + TextBox6.Text;
        Label1.Text = str;
    }
}