﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UI
{
    public partial class Exit : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }
    }
}