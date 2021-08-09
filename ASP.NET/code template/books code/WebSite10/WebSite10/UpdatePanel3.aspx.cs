using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite10
{
    public partial class UpdatePanel3 : System.Web.UI.Page
    {
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                Double a = Convert.ToDouble(TextBox1.Text);
                Double b = Convert.ToDouble(TextBox2.Text);
                Double res = a * b;
                Label3.Text = res.ToString("f2");
            }
            catch (Exception ex)
            {
                if (TextBox1.Text.Length >= 0 && TextBox2.Text.Length >= 0)
                {
                    ex.Data["ExtraInfo"] = "这两个数无法相乘";
                }
                throw ex;
            }
        }
        protected void ScriptManager1_AsyncPostBackError(object sender, AsyncPostBackErrorEventArgs e)
        {
            if (e.Exception.Data["ExtraInfo"] != null)
            {
                ScriptManager1.AsyncPostBackErrorMessage = e.Exception.Data["ExtraInfo"].ToString();
            }
            else
            {
                ScriptManager1.AsyncPostBackErrorMessage = e.Exception.Message;
            }

        } 

    }
}