using BLL;
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
    public partial class WoodPurchasePOAdd : System.Web.UI.Page
    {
        BLLSCM obj = new BLLSCM(); DataTable dt;
        int intPart, intPOID;

        protected void Page_Load(object sender, EventArgs e)
        {
            hdnEnroll.Value = Session[SessionParams.Enroll].ToString();
            hdnUnit.Value = Session[SessionParams.Unitid].ToString();

            if (!IsPostBack)
            {
                try
                {
                    dt = new DataTable();
                    dt = obj.GetWHForWoodPurchase();
                    ddlWH.DataTextField = "strWareHoseName";
                    ddlWH.DataValueField = "intWHID";
                    ddlWH.DataSource = dt;
                    ddlWH.DataBind();
                }
                catch { }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (hdnconfirm.Value == "1")
            {
                intPart = 1;
                intPOID = int.Parse(txtPO.Text);
                dt = new DataTable();
                dt = obj.POADDForWood(intPart, intPOID);
                if (dt.Rows.Count > 0)
                {
                    string msg = dt.Rows[0]["msg"].ToString();
                    ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('" + msg + "');", true);
                    txtPO.Text = "";
                    hdnconfirm.Value = "0";
                }
            }
        }
        protected void btnDeletePO_Click(object sender, EventArgs e)
        {
            if (hdnconfirm.Value == "1")
            {
                intPart = 2;
                intPOID = int.Parse(txtPO.Text);
                dt = new DataTable();
                dt = obj.POADDForWood(intPart, intPOID);
                if (dt.Rows.Count > 0)
                {
                    string msg = dt.Rows[0]["msg"].ToString();
                    ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('" + msg + "');", true);
                    txtPO.Text = "";
                    hdnconfirm.Value = "0";
                }
            }
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            intPart = 3;
            intPOID = int.Parse(txtMRRNo.Text);
            dt = new DataTable();
            dt = obj.POADDForWood(intPart, intPOID);
            if (dt.Rows.Count > 0)
            {
                string msg = dt.Rows[0]["msg"].ToString();
                ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('" + msg + "');", true);
                txtMRRNo.Text = "";
                hdnconfirm.Value = "0";
            }
        }
    








    }
}