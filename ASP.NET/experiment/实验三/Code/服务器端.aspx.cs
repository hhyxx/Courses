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
        str += "    ����Ϊ:    " + TextBox3.Text;
        if(CheckBox1.Checked) 
            str += "    �Ա�Ϊ:    ��";
        else
            str += "    �Ա�Ϊ:    Ů";
        str += "����Ϊ:    " + TextBox4.Text;
        str += "    ����Ϊ:    " + DropDownList1.SelectedItem.Text;
        str += "    ����Ϊ:    " + TextBox5.Text;
        str += "    ����Ϊ:    " + DropDownList2.SelectedItem.Text;
        str += "    ��ע��ϢΪ:    " + TextBox6.Text;
        Label1.Text = str;
    }
}