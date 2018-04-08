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
    public partial class ItemApprovalAFBL : System.Web.UI.Page
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
            dt = new DataTable();
            dt = obj.GetItemInfoForAccounts();
            dgvItem.DataSource = dt; dgvItem.DataBind();
        }

        protected void dgvItem_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Y")
            {
                txtHMLClassification.Text = "";
                txtGLCode.Text = "";
                ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "ViewConfirm('" + 0 + "');", true);

                //Determine the RowIndex of the Row whose Button was clicked.
                int rowIndex = Convert.ToInt32(e.CommandArgument);

                //Reference the GridView Row.
                GridViewRow row = dgvItem.Rows[rowIndex];

                txtItemBaseName.Text = (row.FindControl("lblItemName") as Label).Text;
                txtItemDes.Text = (row.FindControl("lblDescription") as Label).Text;
                hdnItemID.Value = (row.FindControl("lblAutoID") as Label).Text;
            }
        }

        protected void btnApprove_Click(object sender, EventArgs e)
        {
            if (hdnconfirm.Value == "1")
            {
                intWHID = int.Parse(hdnItemID.Value);
                intInsertBy = int.Parse(hdnEnroll.Value);
                intPart = 15;
                strHMLClassification = txtHMLClassification.Text;
                strGLCode = txtGLCode.Text;

                dt = obj.InsertUpdateSelectForItem(intPart, intWHID, strItemName, strDescription, strPart, intUOM, strUOM, intClusterID, strCluster, intCommodityID, strCommodity, intCategory, strCategory, strBrand, intMinorCat, strMinorCat, intPlant, strPlant, strProcureType, intItemType, strItemType, intInsertBy, intLocationID, intNewClusterID, intNewCommodityID, intNewCategoryID, strNewCluster, strNewCommodity, strNewCategory, numReOrderLevel, numMinimumStock, numMaximumStock, numSafetyStock, strABCClassification, strFSNClassification, strVDEClassification,
                strHSCode, intPOProcesingTime, intSupplierDeliTime, intProcesingTimeGR, strSDEClassification, strHMLClassification, strGLCode);
                if (dt.Rows.Count > 0)
                {
                    string msg = dt.Rows[0]["msg"].ToString();
                    ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('" + msg + "');", true);
                    ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "ClosehdnDivision('1');", true);
                    hdnconfirm.Value = "0";
                    hdnItemID.Value = "0";
                    txtHMLClassification.Text = "";
                    txtGLCode.Text = "";
                    LoadGrid();                    
                }
                
            }
        }


        protected void btnApprove_OnCommand(object sender, CommandEventArgs e)
        {
            if (hdnconfirm.Value == "1")
            {
                if (e.CommandName.Equals("Y"))
                {
                    char[] delimiterChars = { '^' };
                    string value = (e.CommandArgument).ToString();
                    string[] data = value.Split(delimiterChars);
                    int appid = int.Parse(data[0].ToString());
                    intWHID = appid;
                    intInsertBy = int.Parse(hdnEnroll.Value);
                    intPart = 15;

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