using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UI
{
    public partial class Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetCacheability(HttpCacheability.Private);
            Response.Cache.SetMaxAge(new TimeSpan(1, 0, 0));

            if (ConfigurationManager.AppSettings["UM"].ToUpper() == "Y")
            {
                Response.Redirect("UnderMaintanance.aspx?err=-1");
            }
            else
            {
                Response.Redirect("Index.aspx");
            }
        }

    }
}