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
    public partial class ItemForAFBL : System.Web.UI.Page
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
                    intPart = 10; intWHID = 2;
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
                    intPart = 4; intWHID = 2;
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
                    intPart = 5; intWHID = 2;
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
                    intPart = 6; intWHID = 2;
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
                    intPart = 9; intWHID = 2;
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
                    intPart = 11; intWHID = 2;
                    dt = obj.InsertUpdateSelectForItem(intPart, intWHID, strItemName, strDescription, strPart, intUOM, strUOM, intClusterID, strCluster, intCommodityID, strCommodity, intCategory, strCategory, strBrand, intMinorCat, strMinorCat, intPlant, strPlant, strProcureType, intItemType, strItemType, intInsertBy, intLocationID, intNewClusterID, intNewCommodityID, intNewCategoryID, strNewCluster, strNewCommodity, strNewCategory, numReOrderLevel, numMinimumStock, numMaximumStock, numSafetyStock, strABCClassification, strFSNClassification, strVDEClassification,
                    strHSCode, intPOProcesingTime, intSupplierDeliTime, intProcesingTimeGR, strSDEClassification, strHMLClassification, strGLCode);
                    ddlUOM.DataTextField = "strUoM";
                    ddlUOM.DataValueField = "intUoM";
                    ddlUOM.DataSource = dt;
                    ddlUOM.DataBind();
                }
                catch { }

                intWHID = int.Parse(ddlWH.SelectedValue.ToString());
                try
                {
                    intPart = 7; intWHID = 2;
                    dt = obj.InsertUpdateSelectForItem(intPart, intWHID, strItemName, strDescription, strPart, intUOM, strUOM, intClusterID, strCluster, intCommodityID, strCommodity, intCategory, strCategory, strBrand, intMinorCat, strMinorCat, intPlant, strPlant, strProcureType, intItemType, strItemType, intInsertBy, intLocationID, intNewClusterID, intNewCommodityID, intNewCategoryID, strNewCluster, strNewCommodity, strNewCategory, numReOrderLevel, numMinimumStock, numMaximumStock, numSafetyStock, strABCClassification, strFSNClassification, strVDEClassification,
                    strHSCode, intPOProcesingTime, intSupplierDeliTime, intProcesingTimeGR, strSDEClassification, strHMLClassification, strGLCode);
                    ddlMinorCat.DataTextField = "strMinorCategory";
                    ddlMinorCat.DataValueField = "intMinorCategory";
                    ddlMinorCat.DataSource = dt;
                    ddlMinorCat.DataBind();
                }
                catch { }

                try
                {
                    intPart = 8; intWHID = 2;
                    dt = obj.InsertUpdateSelectForItem(intPart, intWHID, strItemName, strDescription, strPart, intUOM, strUOM, intClusterID, strCluster, intCommodityID, strCommodity, intCategory, strCategory, strBrand, intMinorCat, strMinorCat, intPlant, strPlant, strProcureType, intItemType, strItemType, intInsertBy, intLocationID, intNewClusterID, intNewCommodityID, intNewCategoryID, strNewCluster, strNewCommodity, strNewCategory, numReOrderLevel, numMinimumStock, numMaximumStock, numSafetyStock, strABCClassification, strFSNClassification, strVDEClassification,
                    strHSCode, intPOProcesingTime, intSupplierDeliTime, intProcesingTimeGR, strSDEClassification, strHMLClassification, strGLCode);
                    ddlPlant.DataTextField = "strPlantName";
                    ddlPlant.DataValueField = "intPlantID";
                    ddlPlant.DataSource = dt;
                    ddlPlant.DataBind();
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

                /*
                try
                {
                    intPart = 1;
                    dt = obj.InsertUpdateSelectForItem(intPart, intWHID, strItemName, strDescription, strPart, intUOM, strUOM, intClusterID, strCluster, intCommodityID, strCommodity, intCategory, strCategory, strBrand, intMinorCat, strMinorCat, intPlant, strPlant, strProcureType, intItemType, strItemType, intInsertBy, intLocationID, intNewClusterID, intNewCommodityID, intNewCategoryID, strNewCluster, strNewCommodity, strNewCategory);
                    ddlOldCluster.DataTextField = "strCluster";
                    ddlOldCluster.DataValueField = "intCluster";
                    ddlOldCluster.DataSource = dt;
                    ddlOldCluster.DataBind();
                }
                catch { }

                try
                {
                    intPart = 2;
                    intClusterID = int.Parse(ddlOldCluster.SelectedValue.ToString());
                    dt = obj.InsertUpdateSelectForItem(intPart, intWHID, strItemName, strDescription, strPart, intUOM, strUOM, intClusterID, strCluster, intCommodityID, strCommodity, intCategory, strCategory, strBrand, intMinorCat, strMinorCat, intPlant, strPlant, strProcureType, intItemType, strItemType, intInsertBy, intLocationID, intNewClusterID, intNewCommodityID, intNewCategoryID, strNewCluster, strNewCommodity, strNewCategory);
                    ddlOldCommodity.DataTextField = "strComGroupName";
                    ddlOldCommodity.DataValueField = "intComGroup";
                    ddlOldCommodity.DataSource = dt;
                    ddlOldCommodity.DataBind();
                }
                catch { }

                try
                {
                    intPart = 3;
                    intCommodityID = int.Parse(ddlOldCommodity.SelectedValue.ToString());
                    dt = obj.InsertUpdateSelectForItem(intPart, intWHID, strItemName, strDescription, strPart, intUOM, strUOM, intClusterID, strCluster, intCommodityID, strCommodity, intCategory, strCategory, strBrand, intMinorCat, strMinorCat, intPlant, strPlant, strProcureType, intItemType, strItemType, intInsertBy, intLocationID, intNewClusterID, intNewCommodityID, intNewCategoryID, strNewCluster, strNewCommodity, strNewCategory);
                    ddlOldCategory.DataTextField = "strCategory";
                    ddlOldCategory.DataValueField = "intCategory";
                    ddlOldCategory.DataSource = dt;
                    ddlOldCategory.DataBind();
                }
                catch { }
              */
            }
            ddlLocation.Enabled = false;
        }
        #region ===== Item Add Process (Selection Change) Start ==================================================
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
        protected void ddlCluster_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                intPart = 5; intWHID = 2;
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
                intPart = 6; intWHID = 2; 
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
                intPart = 6; intWHID = 2;
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
        /*
        protected void ddlOldCluster_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                intPart = 2;
                intClusterID = int.Parse(ddlOldCluster.SelectedValue.ToString());
                dt = obj.InsertUpdateSelectForItem(intPart, intWHID, strItemName, strDescription, strPart, intUOM, strUOM, intClusterID, strCluster, intCommodityID, strCommodity, intCategory, strCategory, strBrand, intMinorCat, strMinorCat, intPlant, strPlant, strProcureType, intItemType, strItemType, intInsertBy, intLocationID, intNewClusterID, intNewCommodityID, intNewCategoryID, strNewCluster, strNewCommodity, strNewCategory);
                ddlOldCommodity.DataTextField = "strComGroupName";
                ddlOldCommodity.DataValueField = "intComGroup";
                ddlOldCommodity.DataSource = dt;
                ddlOldCommodity.DataBind();
            }
            catch { }

            try
            {
                intPart = 3;
                intCommodityID = int.Parse(ddlOldCommodity.SelectedValue.ToString());
                dt = obj.InsertUpdateSelectForItem(intPart, intWHID, strItemName, strDescription, strPart, intUOM, strUOM, intClusterID, strCluster, intCommodityID, strCommodity, intCategory, strCategory, strBrand, intMinorCat, strMinorCat, intPlant, strPlant, strProcureType, intItemType, strItemType, intInsertBy, intLocationID, intNewClusterID, intNewCommodityID, intNewCategoryID, strNewCluster, strNewCommodity, strNewCategory);
                ddlOldCategory.DataTextField = "strCategory";
                ddlOldCategory.DataValueField = "intCategory";
                ddlOldCategory.DataSource = dt;
                ddlOldCategory.DataBind();
            }
            catch { }
        }
        protected void ddlOldCommodity_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                intPart = 3;
                intCommodityID = int.Parse(ddlOldCommodity.SelectedValue.ToString());
                dt = obj.InsertUpdateSelectForItem(intPart, intWHID, strItemName, strDescription, strPart, intUOM, strUOM, intClusterID, strCluster, intCommodityID, strCommodity, intCategory, strCategory, strBrand, intMinorCat, strMinorCat, intPlant, strPlant, strProcureType, intItemType, strItemType, intInsertBy, intLocationID, intNewClusterID, intNewCommodityID, intNewCategoryID, strNewCluster, strNewCommodity, strNewCategory);
                ddlOldCategory.DataTextField = "strCategory";
                ddlOldCategory.DataValueField = "intCategory";
                ddlOldCategory.DataSource = dt;
                ddlOldCategory.DataBind();
            }
            catch { }
        }
        */
        #endregion ===== Item Add Process (Selection Change) End =================================================

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (hdnconfirm.Value == "1")
            {
                try
                {
                    intPart = 12;
                    intWHID = int.Parse(ddlWH.SelectedValue.ToString());
                    if(intWHID == 0) { ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('Please WH Select');", true); return; }
                    strItemName = txtItemBaseName.Text;
                    strDescription = txtItemDes.Text;
                    strPart = txtPartNo.Text;
                    intUOM = int.Parse(ddlUOM.SelectedValue.ToString());
                    strUOM = ddlUOM.SelectedItem.ToString();

                    intClusterID = 0; // int.Parse(ddlOldCluster.SelectedValue.ToString());
                    strCluster = ""; // ddlOldCluster.SelectedItem.ToString();
                    intCommodityID = 0; // int.Parse(ddlOldCommodity.SelectedValue.ToString());
                    strCommodity = ""; // ddlOldCommodity.SelectedItem.ToString();
                    intCategory = 0; // int.Parse(ddlOldCategory.SelectedValue.ToString());
                    strCategory = ""; // ddlOldCategory.SelectedItem.ToString();

                    strBrand = txtBrand.Text;
                    intMinorCat = int.Parse(ddlMinorCat.SelectedValue.ToString());
                    strMinorCat = ddlMinorCat.SelectedItem.ToString();
                    intPlant = int.Parse(ddlPlant.SelectedValue.ToString());
                    strPlant = ddlPlant.SelectedItem.ToString();
                    strProcureType = ""; // ddlProcureType.SelectedItem.ToString();
                    intItemType = int.Parse(ddlItemType.SelectedValue.ToString());
                    strItemType = ddlItemType.SelectedItem.ToString();
                    intInsertBy = int.Parse(hdnEnroll.Value);
                    intClusterID = int.Parse(ddlCluster.SelectedValue.ToString());
                    intLocationID = 0; //int.Parse(ddlLocation.SelectedValue.ToString());
                    //if(intLocationID == 0) { ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('Please Location Select');", true); return; }

                    intNewClusterID = int.Parse(ddlCluster.SelectedValue.ToString());
                    strNewCluster = ddlCluster.SelectedItem.ToString();
                    intNewCommodityID = int.Parse(ddlCommodity.SelectedValue.ToString());
                    strNewCommodity = ddlCommodity.SelectedItem.ToString();
                    intNewCategoryID = int.Parse(ddlCategory.SelectedValue.ToString());
                    strNewCategory = ddlCategory.SelectedItem.ToString();

                    try { numReOrderLevel = decimal.Parse(txtReOrderLevel.Text); } catch { numReOrderLevel = 0; }
                    try { numMinimumStock = decimal.Parse(txtMinimumStock.Text); } catch { numMinimumStock = 0; }
                    try { numMaximumStock = decimal.Parse(txtMaximumStock.Text); } catch { numMaximumStock = 0; }
                    try { numSafetyStock = decimal.Parse(txtSafetyStock.Text); } catch { numSafetyStock = 0; }
                    strABCClassification = ddlABCClassification.SelectedItem.ToString();
                    strFSNClassification = ddlFSNClassification.SelectedItem.ToString();
                    strVDEClassification = ddlVDEClassification.SelectedItem.ToString();

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




















    }
}