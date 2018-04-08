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
    public partial class ItemApproval : System.Web.UI.Page
    {
        BLLSCM obj = new BLLSCM(); DataTable dt;
        int intPart, intWHID, intUOM, intClusterID, intCommodityID, intCategory, intMinorCat, intPlant, intItemType, intInsertBy, intLocationID, intNewClusterID, intNewCommodityID, intNewCategoryID, intPOProcesingTime, intSupplierDeliTime, intProcesingTimeGR;
        string strItemName, strDescription, strPart, strUOM, strCluster, strCommodity, strCategory, strBrand, strMinorCat, strPlant, strProcureType, strItemType, strNewCluster, strNewCommodity, strNewCategory, strABCClassification, strFSNClassification, strVDEClassification, strHSCode, strSDEClassification, strHMLClassification, strGLCode;
        decimal numReOrderLevel, numMinimumStock, numMaximumStock, numSafetyStock;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            hdnEnroll.Value = Session[SessionParams.Enroll].ToString();
            hdnUnit.Value = Session[SessionParams.Unitid].ToString();

            if (!IsPostBack)
            {
                LoadGrid();
            }
        }

        private void LoadGrid()
        {
            try
            {
                dt = new DataTable();
                dt = obj.GetItemInfo();
                dgvItem.DataSource = dt; dgvItem.DataBind();
            }
            catch { }
        }

        protected void btnApprove_OnCommand(object sender, CommandEventArgs e)
        {
            if (hdnconfirm.Value == "1")
            {
                //int index = 0;
                //string reffid = ((Label)dgvItem.Rows[index].FindControl("lblReffIDG")).Text.ToString();

                if (e.CommandName.Equals("Y"))
                {
                    char[] delimiterChars = { '^' };
                    string value = (e.CommandArgument).ToString();
                    string[] data = value.Split(delimiterChars);
                    int appid = int.Parse(data[0].ToString());
                    intWHID = appid;
                    intInsertBy = int.Parse(hdnEnroll.Value);
                    intPart = 14;

                    dt = obj.InsertUpdateSelectForItem(intPart, intWHID, strItemName, strDescription, strPart, intUOM, strUOM, intClusterID, strCluster, intCommodityID, strCommodity, intCategory, strCategory, strBrand, intMinorCat, strMinorCat, intPlant, strPlant, strProcureType, intItemType, strItemType, intInsertBy, intLocationID, intNewClusterID, intNewCommodityID, intNewCategoryID, strNewCluster, strNewCommodity, strNewCategory, numReOrderLevel, numMinimumStock, numMaximumStock, numSafetyStock, strABCClassification, strFSNClassification, strVDEClassification,
                    strHSCode, intPOProcesingTime, intSupplierDeliTime, intProcesingTimeGR, strSDEClassification, strHMLClassification, strGLCode);
                    if (dt.Rows.Count > 0)
                    {
                        string msg = dt.Rows[0]["msg"].ToString();
                        ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('" + msg + "');", true);
                        LoadGrid();
                        hdnconfirm.Value = "0";
                    }
                }
            }
        }

        protected void btnReject_OnCommand(object sender, CommandEventArgs e)
        {
            if (hdnconfirm.Value == "1")
            {
                if (e.CommandName.Equals("R"))
                {
                    char[] delimiterChars = { '^' };
                    string value = (e.CommandArgument).ToString();
                    string[] data = value.Split(delimiterChars);
                    int appid = int.Parse(data[0].ToString());
                    intWHID = appid;
                    intInsertBy = int.Parse(hdnEnroll.Value);
                    intPart = 16;

                    dt = obj.InsertUpdateSelectForItem(intPart, intWHID, strItemName, strDescription, strPart, intUOM, strUOM, intClusterID, strCluster, intCommodityID, strCommodity, intCategory, strCategory, strBrand, intMinorCat, strMinorCat, intPlant, strPlant, strProcureType, intItemType, strItemType, intInsertBy, intLocationID, intNewClusterID, intNewCommodityID, intNewCategoryID, strNewCluster, strNewCommodity, strNewCategory, numReOrderLevel, numMinimumStock, numMaximumStock, numSafetyStock, strABCClassification, strFSNClassification, strVDEClassification,
                    strHSCode, intPOProcesingTime, intSupplierDeliTime, intProcesingTimeGR, strSDEClassification, strHMLClassification, strGLCode);
                    if (dt.Rows.Count > 0)
                    {
                        string msg = dt.Rows[0]["msg"].ToString();
                        ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('" + msg + "');", true);
                        LoadGrid();
                        hdnconfirm.Value = "0";
                    }
                }
            }
        }











        }
}