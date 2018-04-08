using BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UI.Scripts.WebForms.Customize;

namespace UI.Scm
{
    public partial class IndentCorrection : System.Web.UI.Page
    {
        BLLSCM obj = new BLLSCM(); DataTable dt;

        int intPart, intIndent, intItemID;
        decimal numQty;
        string strIndentType;


        protected void Page_Load(object sender, EventArgs e)
        {
            hdnEnroll.Value = Session[SessionParams.Enroll].ToString();
            hdnUnit.Value = Session[SessionParams.Unitid].ToString();

            if (!IsPostBack)
            {

            }
        }        
        protected void btnIndentActive_Click(object sender, EventArgs e)
        {
            if (hdnconfirm.Value == "1")
            {
                try
                {
                    intPart = 1; intIndent = int.Parse(txtIndentNo.Text); intItemID = 0; numQty = 0;
                    dt = obj.IndentCorrection(intPart, intIndent, intItemID, numQty, strIndentType);
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
        protected void btnIndentInactive_Click(object sender, EventArgs e)
        {
            if (hdnconfirm.Value == "1")
            {
                try
                {
                    intPart = 2; intIndent = int.Parse(txtIndentNo.Text); intItemID = 0; numQty = 0;
                    dt = obj.IndentCorrection(intPart, intIndent, intItemID, numQty, strIndentType);
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
        protected void btnQtyChange_Click(object sender, EventArgs e)
        {
            if (hdnconfirm.Value == "1")
            {
                try
                {
                    intPart = 5;
                    intIndent = int.Parse(txtIndentNo.Text);
                    intItemID = int.Parse(txtItemID.Text);
                    numQty = decimal.Parse(txtQty.Text);
                    dt = obj.IndentCorrection(intPart, intIndent, intItemID, numQty, strIndentType);
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
        protected void btnItemActive_Click(object sender, EventArgs e)
        {
            if (hdnconfirm.Value == "1")
            {
                try
                {
                    intPart = 3;
                    intIndent = int.Parse(txtIndentNo.Text);
                    try { intItemID = int.Parse(txtItemID.Text); } catch { intItemID = 0; }
                    numQty = 0;
                    dt = obj.IndentCorrection(intPart, intIndent, intItemID, numQty, strIndentType);
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
        protected void btnItemInactive_Click(object sender, EventArgs e)
        {
            if (hdnconfirm.Value == "1")
            {
                try
                {
                    intPart = 4;
                    intIndent = int.Parse(txtIndentNo.Text);
                    try { intItemID = int.Parse(txtItemID.Text); } catch { intItemID = 0; }
                    numQty = 0;
                    dt = obj.IndentCorrection(intPart, intIndent, intItemID, numQty, strIndentType);
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
        protected void btnProcureType_Click(object sender, EventArgs e)
        {
            if (hdnconfirm.Value == "1")
            {
                try
                {
                    intPart = 6;
                    intIndent = int.Parse(txtIndentNo.Text);
                    try { intItemID = int.Parse(txtItemID.Text);} catch { intItemID = 0; }
                    numQty = 0;
                    strIndentType = ddlProcureType.SelectedItem.ToString();
                    dt = obj.IndentCorrection(intPart, intIndent, intItemID, numQty, strIndentType);
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