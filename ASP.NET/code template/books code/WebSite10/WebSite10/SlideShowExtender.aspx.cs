using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite10
{
    public partial class SlideShowExtender : System.Web.UI.Page
    {
        [System.Web.Services.WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public static AjaxControlToolkit.Slide[] GetSlides()
        {
            return new AjaxControlToolkit.Slide[] { 
            new AjaxControlToolkit.Slide("images/Blue hills.jpg", "", "Blue hills"),
            new AjaxControlToolkit.Slide("images/Sunset.jpg", "", "Sunset"),
            new AjaxControlToolkit.Slide("images/Winter.jpg", "", "Winter"),
            new AjaxControlToolkit.Slide("images/Water lilies.jpg", "", "Lillies in the water"),
            new AjaxControlToolkit.Slide("images/VerticalPicture.jpg", "", "Portrait style icture")};
        }

    }
}