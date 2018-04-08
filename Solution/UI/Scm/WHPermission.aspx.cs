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
    public partial class WHPermission : System.Web.UI.Page
    {
        BLLSCM obj = new BLLSCM(); DataTable dt;
        int intPart, intWHID, intEnroll;
        bool ysnRequisition, ysnRequisitionApproval, ysnIndent, ysnIndentApproval, ysnPO, ysnPOApproval, ysnSU, ysnStoreUser, ysnDistribution, ysnProdPlanner;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            hdnEnroll.Value = Session[SessionParams.Enroll].ToString();
            hdnUnit.Value = Session[SessionParams.Unitid].ToString();

            if (!IsPostBack)
            {
                try
                {
                    intWHID = 0;
                    ysnRequisition = false;
                    ysnRequisitionApproval = false;
                    ysnIndent = false;
                    ysnIndentApproval = false;
                    ysnPO = false;
                    ysnPOApproval = false;
                    ysnSU = false;
                    ysnStoreUser = false;
                    ysnDistribution = false;
                    ysnProdPlanner = false;

                    intPart = 1;
                    dt = new DataTable();
                    dt = obj.GetUnitList();
                    ddlUnit.DataTextField = "strUnit";
                    ddlUnit.DataValueField = "intUnitID";
                    ddlUnit.DataSource = dt;
                    ddlUnit.DataBind();

                    intPart = 3;
                    intEnroll = int.Parse(ddlUnit.SelectedValue.ToString());
                    dt = new DataTable();
                    dt = obj.GetWHListByUnitid(intEnroll);
                    ddlWH.DataTextField = "strWareHoseName";
                    ddlWH.DataValueField = "intWHID";
                    ddlWH.DataSource = dt;
                    ddlWH.DataBind();
                }
                catch { }
            }
        }
        protected void ddlUnit_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                intPart = 3;
                intEnroll = int.Parse(ddlUnit.SelectedValue.ToString());
                intWHID = 0;
                ysnRequisition = false;
                ysnRequisitionApproval = false;
                ysnIndent = false;
                ysnIndentApproval = false;
                ysnPO = false;
                ysnPOApproval = false;
                ysnSU = false;
                ysnStoreUser = false;
                ysnDistribution = false;
                ysnProdPlanner = false;
                dt = new DataTable();
                dt = obj.GetWHListByUnitid(intEnroll);
                ddlWH.DataTextField = "strWareHoseName";
                ddlWH.DataValueField = "intWHID";
                ddlWH.DataSource = dt;
                ddlWH.DataBind();
            }
            catch { }
        }
        protected void btnShow_Click(object sender, EventArgs e)
        {
            try
            {
                intPart = 4;
                intWHID = int.Parse(ddlWH.SelectedValue.ToString());
                intEnroll = int.Parse(txtEnroll.Text);
                dt = new DataTable();
                dt = obj.GetPermissionList(intEnroll, intWHID);
                if (dt.Rows.Count > 0)
                {
                    cbRequisition.Checked = bool.Parse(dt.Rows[0]["Req"].ToString());
                    cbRequisitionApproval.Checked = bool.Parse(dt.Rows[0]["ReqAppr"].ToString());
                    cbIndent.Checked = bool.Parse(dt.Rows[0]["Indent"].ToString());
                    cbIndentApproval.Checked = bool.Parse(dt.Rows[0]["IndentAppr"].ToString());
                    cbPO.Checked = bool.Parse(dt.Rows[0]["PO"].ToString());
                    cbPOApproval.Checked = bool.Parse(dt.Rows[0]["POAppr"].ToString());
                    cbSuperUser.Checked = bool.Parse(dt.Rows[0]["SU"].ToString());
                    cbStroreUser.Checked = bool.Parse(dt.Rows[0]["StoreUser"].ToString());
                    cbDistribution.Checked = bool.Parse(dt.Rows[0]["DistributionUser"].ToString());
                    cbProductionPlanner.Checked = bool.Parse(dt.Rows[0]["ProdPlanner"].ToString());
                }
                else
                {
                    cbRequisition.Checked = false;
                    cbRequisitionApproval.Checked = false;
                    cbIndent.Checked = false;
                    cbIndentApproval.Checked = false;
                    cbPO.Checked = false;
                    cbPOApproval.Checked = false;
                    cbSuperUser.Checked = false;
                    cbStroreUser.Checked = false;
                    cbDistribution.Checked = false;
                    cbProductionPlanner.Checked = false;
                }
            }
            catch { }
        }
        protected void btnPermission_Click(object sender, EventArgs e)
        {
            if (hdnconfirm.Value == "1")
            {
                try
                {
                    intWHID = int.Parse(ddlWH.SelectedValue.ToString());
                    intEnroll = int.Parse(txtEnroll.Text);
                    intPart = 1;
                    ysnRequisition = cbRequisition.Checked;
                    ysnRequisitionApproval = cbRequisitionApproval.Checked;
                    ysnIndent = cbIndent.Checked;
                    ysnIndentApproval = cbIndentApproval.Checked;
                    ysnPO = cbPO.Checked;
                    ysnPOApproval = cbPOApproval.Checked;
                    ysnSU = cbSuperUser.Checked;
                    ysnStoreUser = cbStroreUser.Checked;
                    ysnDistribution = cbDistribution.Checked;
                    ysnProdPlanner = cbProductionPlanner.Checked;
                    dt = new DataTable();
                    dt = obj.InsertWHPermission(intPart, intWHID, intEnroll, ysnRequisition, ysnRequisitionApproval, ysnIndent, ysnIndentApproval, ysnPO, ysnPOApproval, ysnSU, ysnStoreUser, ysnDistribution, ysnProdPlanner);                    
                    if (dt.Rows.Count > 0)
                    {
                        string msg = dt.Rows[0]["msg"].ToString();
                        ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('" + msg + "');", true);
                    }
                }
                catch { }
            }
        }














    }
}