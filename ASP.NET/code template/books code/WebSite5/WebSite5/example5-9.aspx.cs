using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite5
{
    public partial class example5_9 : System.Web.UI.Page
    {
        public enum SearchType
        {
            NotSet = -1,
            Products = 0,
            Category = 1,
            Publisher = 2
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            radioProduct.Checked = true;
            MultiView1.ActiveViewIndex = 0;
        }
        protected void Button1_Click(Object sender, System.EventArgs e)
        {
            if (MultiView1.ActiveViewIndex > -1)
            {
                SearchType mSearchType = (SearchType)MultiView1.ActiveViewIndex;
                switch (mSearchType)
                {
                    case SearchType.Products:
                        DoSearch(textProductName.Text, mSearchType);
                        break;
                    case SearchType.Category:
                        DoSearch(textCategory.Text, mSearchType);
                        break;
                    case SearchType.Publisher:
                        DoSearch(textPublisher.Text, mSearchType);
                        break;
                    case SearchType.NotSet:
                        break;
                }
            }
        }

        protected void DoSearch(String searchTerm, SearchType type)
        {
            // Code here to perform a search.
            string scriptString = "alert('" + "您输入的" + searchTerm + "');";
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "success", scriptString, true);
            // Response.Write("您输入的"+ searchTerm );
        }

        protected void radioButton_CheckedChanged(Object sender, System.EventArgs e)
        {
            if (radioProduct.Checked)
            {
                MultiView1.ActiveViewIndex = (int)SearchType.Products;
            }
            else if (radioCategory.Checked)
            {
                MultiView1.ActiveViewIndex = (int)SearchType.Category;
            }
            else if (radioPublisher.Checked)
            {
                MultiView1.ActiveViewIndex = (int)SearchType.Publisher;
            }
        }

    }
}