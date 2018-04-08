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
    public partial class Item : System.Web.UI.Page
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
                try
                {
                    intPart = 1;
                    dt = obj.InsertUpdateSelectForItem(intPart, intWHID, strItemName, strDescription, strPart, intUOM, strUOM, intClusterID, strCluster, intCommodityID, strCommodity, intCategory, strCategory, strBrand, intMinorCat, strMinorCat, intPlant, strPlant, strProcureType, intItemType, strItemType, intInsertBy, intLocationID, intNewClusterID, intNewCommodityID, intNewCategoryID, strNewCluster, strNewCommodity, strNewCategory, numReOrderLevel, numMinimumStock, numMaximumStock, numSafetyStock, strABCClassification, strFSNClassification, strVDEClassification,
                    strHSCode, intPOProcesingTime, intSupplierDeliTime, intProcesingTimeGR, strSDEClassification, strHMLClassification, strGLCode);
                    ddlCluster.DataTextField = "strCluster";
                    ddlCluster.DataValueField = "intCluster";
                    ddlCluster.DataSource = dt;
                    ddlCluster.DataBind();
                }
                catch { }

                try
                {
                    intPart = 2;
                    intClusterID = int.Parse(ddlCluster.SelectedValue.ToString());
                    dt = obj.InsertUpdateSelectForItem(intPart, intWHID, strItemName, strDescription, strPart, intUOM, strUOM, intClusterID, strCluster, intCommodityID, strCommodity, intCategory, strCategory, strBrand, intMinorCat, strMinorCat, intPlant, strPlant, strProcureType, intItemType, strItemType, intInsertBy, intLocationID, intNewClusterID, intNewCommodityID, intNewCategoryID, strNewCluster, strNewCommodity, strNewCategory, numReOrderLevel, numMinimumStock, numMaximumStock, numSafetyStock, strABCClassification, strFSNClassification, strVDEClassification,
                    strHSCode, intPOProcesingTime, intSupplierDeliTime, intProcesingTimeGR, strSDEClassification, strHMLClassification, strGLCode);
                    ddlCommodity.DataTextField = "strComGroupName";
                    ddlCommodity.DataValueField = "intComGroup";
                    ddlCommodity.DataSource = dt;
                    ddlCommodity.DataBind();
                }
                catch { }

                try
                {
                    intPart = 3;
                    intCommodityID = int.Parse(ddlCommodity.SelectedValue.ToString());
                    dt = obj.InsertUpdateSelectForItem(intPart, intWHID, strItemName, strDescription, strPart, intUOM, strUOM, intClusterID, strCluster, intCommodityID, strCommodity, intCategory, strCategory, strBrand, intMinorCat, strMinorCat, intPlant, strPlant, strProcureType, intItemType, strItemType, intInsertBy, intLocationID, intNewClusterID, intNewCommodityID, intNewCategoryID, strNewCluster, strNewCommodity, strNewCategory, numReOrderLevel, numMinimumStock, numMaximumStock, numSafetyStock, strABCClassification, strFSNClassification, strVDEClassification,
                    strHSCode, intPOProcesingTime, intSupplierDeliTime, intProcesingTimeGR, strSDEClassification, strHMLClassification, strGLCode);
                    ddlCategory.DataTextField = "strCategory";
                    ddlCategory.DataValueField = "intCategory";
                    ddlCategory.DataSource = dt;
                    ddlCategory.DataBind();
                }
                catch { }

                try
                {
                    intPart = 9;
                    dt = obj.InsertUpdateSelectForItem(intPart, intWHID, strItemName, strDescription, strPart, intUOM, strUOM, intClusterID, strCluster, intCommodityID, strCommodity, intCategory, strCategory, strBrand, intMinorCat, strMinorCat, intPlant, strPlant, strProcureType, intItemType, strItemType, intInsertBy, intLocationID, intNewClusterID, intNewCommodityID, intNewCategoryID, strNewCluster, strNewCommodity, strNewCategory, numReOrderLevel, numMinimumStock, numMaximumStock, numSafetyStock, strABCClassification, strFSNClassification, strVDEClassification,
                    strHSCode, intPOProcesingTime, intSupplierDeliTime, intProcesingTimeGR, strSDEClassification, strHMLClassification, strGLCode);
                    ddlItemType.DataTextField = "strReqItemCategory";
                    ddlItemType.DataValueField = "intAutoID";
                    ddlItemType.DataSource = dt;
                    ddlItemType.DataBind();
                }
                catch { }

                try
                {
                    intPart = 10;
                    intInsertBy = int.Parse(hdnEnroll.Value);
                    dt = obj.InsertUpdateSelectForItem(intPart, intWHID, strItemName, strDescription, strPart, intUOM, strUOM, intClusterID, strCluster, intCommodityID, strCommodity, intCategory, strCategory, strBrand, intMinorCat, strMinorCat, intPlant, strPlant, strProcureType, intItemType, strItemType, intInsertBy, intLocationID, intNewClusterID, intNewCommodityID, intNewCategoryID, strNewCluster, strNewCommodity, strNewCategory, numReOrderLevel, numMinimumStock, numMaximumStock, numSafetyStock, strABCClassification, strFSNClassification, strVDEClassification,
                    strHSCode, intPOProcesingTime, intSupplierDeliTime, intProcesingTimeGR, strSDEClassification, strHMLClassification, strGLCode);
                    ddlWH.DataTextField = "strWareHoseName";
                    ddlWH.DataValueField = "intWHID";
                    ddlWH.DataSource = dt;
                    ddlWH.DataBind();
                }
                catch { }

                try
                {
                    intPart = 11;
                    dt = obj.InsertUpdateSelectForItem(intPart, intWHID, strItemName, strDescription, strPart, intUOM, strUOM, intClusterID, strCluster, intCommodityID, strCommodity, intCategory, strCategory, strBrand, intMinorCat, strMinorCat, intPlant, strPlant, strProcureType, intItemType, strItemType, intInsertBy, intLocationID, intNewClusterID, intNewCommodityID, intNewCategoryID, strNewCluster, strNewCommodity, strNewCategory, numReOrderLevel, numMinimumStock, numMaximumStock, numSafetyStock, strABCClassification, strFSNClassification, strVDEClassification,
                    strHSCode, intPOProcesingTime, intSupplierDeliTime, intProcesingTimeGR, strSDEClassification, strHMLClassification, strGLCode);
                    ddlUOM.DataTextField = "strUoM";
                    ddlUOM.DataValueField = "intUoM";
                    ddlUOM.DataSource = dt;
                    ddlUOM.DataBind();
                }
                catch { }
                try
                {
                    intWHID = int.Parse(ddlWH.SelectedValue.ToString());
                    dt = obj.GetLocationByWH(intWHID);
                    ddlLocation.DataTextField = "strLocationName";
                    ddlLocation.DataValueField = "intStoreLocationID";
                    ddlLocation.DataSource = dt;
                    ddlLocation.DataBind();
                }
                catch { }
            }
        }

        #region ===== Item Add Process (Selection Change) Start ==================================================
        protected void ddlCluster_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                intPart = 2;
                intClusterID = int.Parse(ddlCluster.SelectedValue.ToString());
                dt = obj.InsertUpdateSelectForItem(intPart, intWHID, strItemName, strDescription, strPart, intUOM, strUOM, intClusterID, strCluster, intCommodityID, strCommodity, intCategory, strCategory, strBrand, intMinorCat, strMinorCat, intPlant, strPlant, strProcureType, intItemType, strItemType, intInsertBy, intLocationID, intNewClusterID, intNewCommodityID, intNewCategoryID, strNewCluster, strNewCommodity, strNewCategory, numReOrderLevel, numMinimumStock, numMaximumStock, numSafetyStock, strABCClassification, strFSNClassification, strVDEClassification,
                strHSCode, intPOProcesingTime, intSupplierDeliTime, intProcesingTimeGR, strSDEClassification, strHMLClassification, strGLCode);
                ddlCommodity.DataTextField = "strComGroupName";
                ddlCommodity.DataValueField = "intComGroup";
                ddlCommodity.DataSource = dt;
                ddlCommodity.DataBind();
            }
            catch { }

            try
            {
                intPart = 3;
                intCommodityID = int.Parse(ddlCommodity.SelectedValue.ToString());
                dt = obj.InsertUpdateSelectForItem(intPart, intWHID, strItemName, strDescription, strPart, intUOM, strUOM, intClusterID, strCluster, intCommodityID, strCommodity, intCategory, strCategory, strBrand, intMinorCat, strMinorCat, intPlant, strPlant, strProcureType, intItemType, strItemType, intInsertBy, intLocationID, intNewClusterID, intNewCommodityID, intNewCategoryID, strNewCluster, strNewCommodity, strNewCategory, numReOrderLevel, numMinimumStock, numMaximumStock, numSafetyStock, strABCClassification, strFSNClassification, strVDEClassification,
                strHSCode, intPOProcesingTime, intSupplierDeliTime, intProcesingTimeGR, strSDEClassification, strHMLClassification, strGLCode);
                ddlCategory.DataTextField = "strCategory";
                ddlCategory.DataValueField = "intCategory";
                ddlCategory.DataSource = dt;
                ddlCategory.DataBind();
            }
            catch { }
        }
        protected void ddlCommodity_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                intPart = 3;
                intCommodityID = int.Parse(ddlCommodity.SelectedValue.ToString());
                dt = obj.InsertUpdateSelectForItem(intPart, intWHID, strItemName, strDescription, strPart, intUOM, strUOM, intClusterID, strCluster, intCommodityID, strCommodity, intCategory, strCategory, strBrand, intMinorCat, strMinorCat, intPlant, strPlant, strProcureType, intItemType, strItemType, intInsertBy, intLocationID, intNewClusterID, intNewCommodityID, intNewCategoryID, strNewCluster, strNewCommodity, strNewCategory, numReOrderLevel, numMinimumStock, numMaximumStock, numSafetyStock, strABCClassification, strFSNClassification, strVDEClassification,
                strHSCode, intPOProcesingTime, intSupplierDeliTime, intProcesingTimeGR, strSDEClassification, strHMLClassification, strGLCode);
                ddlCategory.DataTextField = "strCategory";
                ddlCategory.DataValueField = "intCategory";
                ddlCategory.DataSource = dt;
                ddlCategory.DataBind();
            }
            catch { }
        }
        protected void ddlWH_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                intWHID = int.Parse(ddlWH.SelectedValue.ToString());
                dt = obj.GetLocationByWH(intWHID);
                ddlLocation.DataTextField = "strLocationName";
                ddlLocation.DataValueField = "intStoreLocationID";
                ddlLocation.DataSource = dt;
                ddlLocation.DataBind();
            }
            catch { }
        }
        #endregion ===== Item Add Process (Selection Change) End =================================================

        #region ===== Item Add & Update Start ============================================================
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (hdnconfirm.Value == "1")
            {
                try
                {
                    intPart = 13;
                    intWHID = int.Parse(ddlWH.SelectedValue.ToString());
                    if (intWHID == 0) { ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('Please WH Select');", true); return; }
                    strItemName = txtItemBaseName.Text;
                    strDescription = txtItemDes.Text;
                    strPart = txtPartNo.Text;
                    intUOM = int.Parse(ddlUOM.SelectedValue.ToString());
                    strUOM = ddlUOM.SelectedItem.ToString();
                    intClusterID = int.Parse(ddlCluster.SelectedValue.ToString());
                    strCluster = ddlCluster.SelectedItem.ToString();
                    intCommodityID = int.Parse(ddlCommodity.SelectedValue.ToString());
                    strCommodity = ddlCommodity.SelectedItem.ToString();
                    intCategory = int.Parse(ddlCategory.SelectedValue.ToString());
                    strCategory = ddlCategory.SelectedItem.ToString();
                    strBrand = txtBrand.Text;
                    intMinorCat = 0;
                    strMinorCat = "";
                    intPlant = 0;
                    strPlant = "";
                    strProcureType = "";
                    intItemType = int.Parse(ddlItemType.SelectedValue.ToString());
                    strItemType = ddlItemType.SelectedItem.ToString();
                    intInsertBy = int.Parse(hdnEnroll.Value);
                    intClusterID = int.Parse(ddlCluster.SelectedValue.ToString());
                    intLocationID = int.Parse(ddlLocation.SelectedValue.ToString());
                    if (intLocationID == 0) { ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('Please Location Select');", true); return; }

                    dt = obj.InsertUpdateSelectForItem(intPart, intWHID, strItemName, strDescription, strPart, intUOM, strUOM, intClusterID, strCluster, intCommodityID, strCommodity, intCategory, strCategory, strBrand, intMinorCat, strMinorCat, intPlant, strPlant, strProcureType, intItemType, strItemType, intInsertBy, intLocationID, intNewClusterID, intNewCommodityID, intNewCategoryID, strNewCluster, strNewCommodity, strNewCategory, numReOrderLevel, numMinimumStock, numMaximumStock, numSafetyStock, strABCClassification, strFSNClassification, strVDEClassification,
                    strHSCode, intPOProcesingTime, intSupplierDeliTime, intProcesingTimeGR, strSDEClassification, strHMLClassification, strGLCode);
                    if (dt.Rows.Count > 0)
                    {
                        string msg = dt.Rows[0]["msg"].ToString();
                        ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('" + msg + "');", true);
                        
                        txtItemBaseName.Text = "";
                        txtItemDes.Text = "";
                        txtPartNo.Text = "";                     
                        txtBrand.Text = "";                      
                        hdnconfirm.Value = "0";
                    }                        
                }
                catch { }
            }
        }
        #endregion ===== Item Add & Update End ===========================================================























    }
}