using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UI
{
    public partial class UnderMaintanance : Page
    {
        public string str = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["err"] == "-1")
            {
                str = "System will be activated at: " + String.Format("{0:d/M/yyyy HH:mm tt}", (object)ConfigurationManager.AppSettings["UM_Ret"]);
            }
            else if (Request.QueryString["err"] == "-2")
            {
                str = "Could not connect with database. Please infom at Dept. Of Software.";
            }
            um.DataBind();
        }
    }
}