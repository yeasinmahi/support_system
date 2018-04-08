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
    public partial class MRRCorrection : System.Web.UI.Page
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

        protected void btnShow_Click(object sender, EventArgs e)
        {
            ShowInfo();
            LoadItemInfo();
        }

        protected void btnDeleteMRR_Click(object sender, EventArgs e)
        {
            if (hdnconfirm.Value == "1")
            {
                if (txtPaymentStatus.Text == "Voucher Complete")
                {
                    ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('Voucher completed. MRR cannot be Deleted.');", true); return;
                }
                else if (txtVoucherNo.Text != "")
                {
                    ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('Please Delete JV Voucher.');", true); return;
                }
                else
                {
                    try
                    {
                        intPart = 1;
                        intMRRID = int.Parse(txtMRRNo.Text);
                        dt = new DataTable();
                        dt = obj.MRRDelete(intPart, intMRRID);
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
        protected void btnFreeMRR_Click(object sender, EventArgs e)
        {
            if (hdnconfirm.Value == "1")
            {
                try
                {
                    intPart = 5;
                    intMRRID = int.Parse(txtMRRNo.Text);
                    dt = new DataTable();
                    dt = obj.MRRDelete(intPart, intMRRID);
                    if (dt.Rows.Count > 0)
                    {
                        string msg = dt.Rows[0]["msg"].ToString();
                        ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('" + msg + "');", true);
                        hdnconfirm.Value = "0";
                    }
                    ShowInfo();
                }
                catch { }
            }
        }
        protected void btnDeleteJV_Click(object sender, EventArgs e)
        {
            if (hdnconfirm.Value == "1")
            {
                try
                {
                    intPart = 4;
                    intMRRID = int.Parse(txtMRRNo.Text);
                    dt = new DataTable();
                    dt = obj.MRRDelete(intPart, intMRRID);
                    if (dt.Rows.Count > 0)
                    {
                        string msg = dt.Rows[0]["msg"].ToString();
                        ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('" + msg + "');", true);
                        hdnconfirm.Value = "0";
                    }
                    ShowInfo();
                }
                catch { }
            }
        }
        private void ShowInfo()
        {
            try
            {
                intPart = 2;
                intMRRID = int.Parse(txtMRRNo.Text);
                dt = new DataTable();
                dt = obj.MRRDelete(intPart, intMRRID);
                if (dt.Rows.Count > 0)
                {
                    txtMRRDate.Text = dt.Rows[0]["dteTransactionDate"].ToString();
                    txtVoucherNo.Text = dt.Rows[0]["strVoucherCode"].ToString();
                    txtPO.Text = dt.Rows[0]["intPOID"].ToString();
                    hdnMrrUnitID.Value = dt.Rows[0]["intUnitID"].ToString();
                    txtWHName.Text = dt.Rows[0]["strWareHoseName"].ToString();
                    hdnWHID.Value = dt.Rows[0]["intWHID"].ToString();
                }
                intPart = 3;
                dt = new DataTable();
                dt = obj.MRRDelete(intPart, intMRRID);
                if (dt.Rows.Count > 0)
                {
                    txtPaymentStatus.Text = dt.Rows[0]["strStatus"].ToString();
                }
                intPart = 6;
                dt = new DataTable();
                dt = obj.MRRDelete(intPart, intMRRID);
                if (dt.Rows.Count > 0)
                {
                    txtSupplierName.Text = dt.Rows[0]["strSupplierName"].ToString();
                }
                else
                {
                    txtSupplierName.Text = "";
                }
            }
            catch { }            
        }
       private void LoadItemInfo()
       {
            try
            {
                intPart = 7;
                intMRRID = int.Parse(txtMRRNo.Text);
                dt = new DataTable();
                dt = obj.MRRDelete(intPart, intMRRID);
                dgvItem.DataSource = dt; dgvItem.DataBind();
            }
            catch { }
        }











    }
}