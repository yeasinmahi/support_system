using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

namespace UI.HR
{
    public partial class LoanProcess : System.Web.UI.Page
    {
        int intEnroll, intAppID, intID; DataTable dt; BLL.BLLHR bll = new BLL.BLLHR();
        protected void Page_Load(object sender, EventArgs e)
        {
            dgvLoanDetails.DataSource = "";
            dgvLoanDetails.DataBind();
        }

        protected void btnShow_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtEnroll.Text == "")
                {
                    return;
                }
                intEnroll = int.Parse(txtEnroll.Text);
                dt = new DataTable();
                dt = bll.GetLoanStatus(intEnroll);
                dgvLoan.DataSource = dt;
                dgvLoan.DataBind();
            }
            catch { dgvLoan.DataSource = ""; dgvLoan.DataBind(); }
        }
        protected void btnDetails_Click(object sender, EventArgs e)
        {
            try
            {
                string senderdata = ((Button)sender).CommandArgument.ToString();
                string strSearchKey = ((Button)sender).CommandArgument.ToString();
                string[] searchKey = Regex.Split(strSearchKey, ",");
                string strdex = searchKey[1];
                string strReffid = searchKey[0];
                intAppID = int.Parse(strReffid.ToString());

                hdnAppID.Value = intAppID.ToString();

                dt = new DataTable();
                dt = bll.GetLoanDetails(intAppID);
                dgvLoanDetails.DataSource = dt;
                dgvLoanDetails.DataBind();

                
            }
            catch {
                dgvLoanDetails.DataSource = "";
                dgvLoanDetails.DataBind();
            }
        }
        protected void btnComplete_Click(object sender, EventArgs e)
        {
            try
            {
                string senderdata = ((Button)sender).CommandArgument.ToString();
                string strSearchKey = ((Button)sender).CommandArgument.ToString();
                string[] searchKey = Regex.Split(strSearchKey, ",");
                string strdex = searchKey[1];
                string strReffid = searchKey[0];
                intAppID = int.Parse(strReffid.ToString());

                bll.CompleteLoan(intAppID);

                bll.UpdateLoanStatus(intAppID);

                ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('Completed.');", true);
            }
            catch { }
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                string senderdata = ((Button)sender).CommandArgument.ToString();
                string strSearchKey = ((Button)sender).CommandArgument.ToString();
                string[] searchKey = Regex.Split(strSearchKey, ",");
                string strdex = searchKey[1];
                string strReffid = searchKey[0];
                intID = int.Parse(strReffid.ToString());

                bll.UpdateSingleLoan(intID);

                intAppID = int.Parse(hdnAppID.Value.ToString());

                dt = new DataTable();
                dt = bll.GetInstallment(intAppID);
                int intCount = int.Parse(dt.Rows[0]["intCount"].ToString());
                if (intCount == 0)
                {
                    bll.UpdateLoanStatus(intAppID);
                }

                ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('Deleted.');", true);

                try
                {
                    intAppID = int.Parse(strReffid.ToString());

                    hdnAppID.Value = intAppID.ToString();

                    dt = new DataTable();
                    dt = bll.GetLoanDetails(intAppID);
                    dgvLoanDetails.DataSource = dt;
                    dgvLoanDetails.DataBind();
                }
                catch { }
            }
            catch { }
        }


    }
}