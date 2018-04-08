using BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UI.Scripts.WebForms.Customize;

namespace UI.Sad
{
    public partial class InternalLogistic : System.Web.UI.Page
    {
        BLLSCM obj = new BLLSCM(); DataTable dt;
        int intPart; string strTripSLNo;

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
            LoadGrid();
        }
        private void LoadGrid()
        {
            try
            {
                strTripSLNo = txtTripSLNo.Text;
                intPart = 2;
                dt = new DataTable();
                dt = obj.GetTripDetails(intPart, strTripSLNo);
                dgvChallanInfo.DataSource = dt; dgvChallanInfo.DataBind();
            }
            catch { }
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
                    intPart = 3;
                    strTripSLNo = appid.ToString();
                    dt = new DataTable();
                    dt = obj.GetTripDetails(intPart, strTripSLNo);
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
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (hdnconfirm.Value == "1")
            {
                try
                {
                    intPart = 4;
                    strTripSLNo = txtTripSLNo.Text;
                    dt = new DataTable();
                    dt = obj.GetTripDetails(intPart, strTripSLNo);
                    if (dt.Rows.Count > 0)
                    {
                        string msg = dt.Rows[0]["msg"].ToString();
                        ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('" + msg + "');", true);
                        LoadGrid();
                        hdnconfirm.Value = "0";
                    }
                }
                catch { }            
            }
        }











    }
}