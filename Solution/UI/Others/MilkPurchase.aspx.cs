﻿using BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UI.Scripts.WebForms.Customize;

namespace UI.Others
{
    public partial class MilkPurchase : System.Web.UI.Page
    {
        BLLSCM obj = new BLLSCM(); DataTable dt;
        int intPart, intMRRID;
        protected void Page_Load(object sender, EventArgs e)
        {
            hdnEnroll.Value = Session[SessionParams.Enroll].ToString();
            hdnUnit.Value = Session[SessionParams.Unitid].ToString();

            if (!IsPostBack)
            {
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (hdnconfirm.Value == "1")
            {
                try
                {
                    intPart = 1;
                    intMRRID = int.Parse(txtMRRNo.Text);
                    dt = new DataTable();                    
                    dt = obj.MilkPurchase(intPart, intMRRID);
                    if (dt.Rows.Count > 0)
                    {
                        string msg = dt.Rows[0]["msg"].ToString();
                        ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('" + msg + "');", true);
                        hdnconfirm.Value = "0";
                    }
                }
                catch { }
            }
        }










    }
}