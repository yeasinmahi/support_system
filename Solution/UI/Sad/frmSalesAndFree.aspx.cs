using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace UI.Sad
{
    public partial class frmSalesAndFree : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
        BLLSAD objSad = new BLLSAD();
        int itemid, Custid,id,Regionid,Lineid,Unitid;
        string msg,VoucherNo,dtichallan,unitname;
        DateTime dtefdate, dtetdate;
        bool ysnChecked;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                getitem(int.Parse(ddlLine.SelectedValue));
                getRegion();
               
            }

        }

        private void getRegion()
        {
            dt = objSad.getRegion();
            DDLREGION.DataTextField = "strregion";
            DDLREGION.DataValueField = "intregionid";
            DDLREGION.DataSource = dt;
            DDLREGION.DataBind();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

        }

        protected void btnShowRegion_Click(object sender, EventArgs e)
        {
            if ((txtfDate.Text != "") && (txttDate.Text != ""))
            {
                Regionid = int.Parse(DDLREGION.SelectedValue);
                itemid = int.Parse(ddlRitem.SelectedValue);
                Lineid = int.Parse(ddlrline.SelectedValue);
                dtefdate = DateTime.Parse(txtfDate.Text.ToString());
                dtetdate = DateTime.Parse(txttDate.Text.ToString());
                dt = objSad.getPromotionShowRegion(itemid, dtefdate, dtetdate, Regionid, Lineid);
                dgvRegionRpt.DataSource = dt;
                dgvRegionRpt.DataBind();
            }
            else
            {
                ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('Please Date Select !');", true);

            }
        }

        protected void btnACLCHallanshow_Click(object sender, EventArgs e)
        {

            if (txtChallanno.Text != "")
            {
                dt = objSad.getACLCHallanshow(txtChallanno.Text);
                lblDTIChallan.Text = dt.Rows[0]["DTIChallan"].ToString();
                lblACLChallanos.Text = "Please Before ACL This (" + txtChallanno.Text + ") Challan Rollback and Cancel.";

            }
            else
            {
                ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('Please Entry Challan No !');", true);


            }
        }

        protected void btnNewChallanCreate_Click(object sender, EventArgs e)
        {

            Unitid =int.Parse(ddlU.SelectedValue);
          
            char[] delimiterChars = { '-' };
            string value = (lblDTIChallan.Text.ToString());
            string[] data = value.Split(delimiterChars);
            unitname = data[0].ToString();
            dtichallan = data[1].ToString();
            if (unitname == ddlU.SelectedItem.ToString())
            {
                msg = objSad.getCreateChallan(dtichallan, Unitid);
               
            }
            else
            {
                msg = "You Select Wrong Unit Name";
            }
            ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('" + msg + "');", true);

        }

        protected void btnRegionSubmit(object sender, EventArgs e)
        {
            if (dgvRegionRpt.Rows.Count > 0)
            {

                for (int i = 0; i < dgvRegionRpt.Rows.Count; i++)
                {
                    ysnChecked = ((CheckBox)dgvRegionRpt.Rows[i].Cells[9].Controls[0]).Checked;
                    if (ysnChecked == true)
                    {
                        id = int.Parse(((HiddenField)dgvRegionRpt.Rows[i].FindControl("hdnintid")).Value.ToString());
                        objSad.getItemPromotionR(id);
                    }
                }
                ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('Successfully!');", true);
                dgvDistibutorSummary.DataBind();

            }
        }

        protected void btnVoucherCreate_Click(object sender, EventArgs e)
        {
            if (txtfDate.Text != "")
            {
                dtefdate = DateTime.Parse(txtfDate.Text.ToString());
                Unitid = int.Parse(ddlunit.SelectedValue.ToString());
                msg = objSad.getACLPurchesVoucherCreate(Unitid, dtetdate);
                ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('" + msg + "');", true);
            }
            else { ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('Please Select Date!');", true); }

        }

        protected void ddlLine_SelectedIndexChanged(object sender, EventArgs e)
        {
            getitem(int.Parse(ddlrline.SelectedValue));
      
          }

        private void getitem(int lineid)
        {

            dt = objSad.getItem(lineid);
            if (dt.Rows.Count > 0)
            {
                ddlItem.DataTextField = "strFullName";
                ddlItem.DataValueField = "intItemID";
                ddlItem.DataSource = dt;
                ddlItem.DataBind();
                ddlRitem.DataTextField = "strFullName";
                ddlRitem.DataValueField = "intItemID";
                ddlRitem.DataSource = dt;
                ddlRitem.DataBind();

            }
            //dt = new DataTable();
          

        }

        protected void ddlItem_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnAction_OnCommand(object sender, CommandEventArgs e)
        {
            char[] delimiterChars = { ';'};
            string value = (e.CommandArgument).ToString();
            string[] data = value.Split(delimiterChars);
        
            id = int.Parse(data[0].ToString());
            msg = objSad.getItemPromotion(id);
          
            ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('" + msg + "');", true);
        }
        protected void btnShow_Click(object sender, EventArgs e)
        {

            if (txtSearchCustomer.Text != "")
            {
                Regionid = int.Parse(DDLREGION.SelectedValue);
                itemid = int.Parse(ddlRitem.SelectedValue);
                Lineid = int.Parse(ddlrline.SelectedValue);
                dtefdate = DateTime.Parse(txtfDate.Text.ToString());
                dtetdate = DateTime.Parse(txttDate.Text.ToString());
                dt = objSad.getPromotionShowRegion(itemid, dtefdate, dtetdate, Regionid, Lineid);
                dgvDistibutorSummary.DataSource = dt;
                dgvDistibutorSummary.DataBind();
            }
            else
            {
                ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('Please Select Customer Name!');", true);
            }
        }
    }
}