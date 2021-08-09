using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using System.Threading;

namespace WebSite5
{
    public partial class example5_14 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            labelMessage.Text = ""; // clear
        }


        protected void buttonSubmit_Click(object sender, EventArgs e)
        {
          if(Page.IsValid)
          {
              labelMessage.Text = "您的预订已受理。";
              //Your reservation has been processed.
          }
          else
              labelMessage.Text = "页面不合语法。"; //Page is not valid.
        }
        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
           try
           {

               DateTimeFormatInfo info1 = (DateTimeFormatInfo)
                   Thread.CurrentThread.CurrentCulture.GetFormat(typeof(DateTimeFormatInfo));
               DateTime time1 = DateTime.ParseExact(args.Value, "d", info1,
                   DateTimeStyles.AllowWhiteSpaces);
               args.IsValid = true;
           }
           catch
           {
               args.IsValid = false;
           }
        }
    } 
}