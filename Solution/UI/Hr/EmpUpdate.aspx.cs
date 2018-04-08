using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using System.Text;
using System.Text.RegularExpressions;
using UI.Scripts.WebForms.Customize;

namespace UI.HR
{
    public partial class EmpUpdate : System.Web.UI.Page
    {
        int intEnroll, intSuperviserId; DataTable dt; BLLHR bll = new BLLHR();
        string strCode, strEmail, strCardNo, strName, strContact, strBirth;
        DateTime dteAppoint, dteJoinDate, dteBirth;
        bool ysnActive, ysnSalaryHold;
        char[] delimiterChars = { '[', ']', '^', ';', '-', '_', '.' }; string[] arrayKey;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                hdnempid.Value = HttpContext.Current.Session[SessionParams.Enroll].ToString();
                txtSEnroll.Text = "";
                txtSCode.Text = "";
                txtSEmail.Text = "";
            }
        }

        protected void btnShow_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtSEnroll.Text != "")
                {
                    intEnroll = int.Parse(txtSEnroll.Text);
                    dt = new DataTable();
                    dt = bll.GetEmpInfoByEnroll(intEnroll);
                    dgvEmpInfo.DataSource = dt;
                    dgvEmpInfo.DataBind();
                }
                else if (txtSCode.Text != "")
                {
                    strCode = txtSCode.Text;
                    dt = new DataTable();
                    dt = bll.GetEmpInfoByCode(strCode);
                    dgvEmpInfo.DataSource = dt;
                    dgvEmpInfo.DataBind();
                }
                else if (txtSEmail.Text != "")
                {
                    strEmail = txtSEmail.Text;
                    dt = new DataTable();
                    dt = bll.GetEmpInfoByEmail(strEmail);
                    dgvEmpInfo.DataSource = dt;
                    dgvEmpInfo.DataBind();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('Input Correct Information.');", true);
                }
            }
            catch { }

        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                string senderdata = ((Button)sender).CommandArgument.ToString();
                string strSearchKey = ((Button)sender).CommandArgument.ToString();
                string[] searchKey = Regex.Split(strSearchKey, ",");
                string strdex = searchKey[1];
                string strReffid = searchKey[0];
                intEnroll = int.Parse(strReffid.ToString());

                int index = int.Parse(strdex.ToString());
                strCode = ((TextBox)dgvEmpInfo.Rows[index].FindControl("txtCode")).Text.ToString();
                strCardNo = ((TextBox)dgvEmpInfo.Rows[index].FindControl("txtCardNo")).Text.ToString();
                strName = ((TextBox)dgvEmpInfo.Rows[index].FindControl("txtName")).Text.ToString();
                try
                {
                    strEmail = ((TextBox)dgvEmpInfo.Rows[index].FindControl("txtEmail")).Text.ToString();
                }
                catch { strEmail = "0"; }
                intSuperviserId = int.Parse(((TextBox)dgvEmpInfo.Rows[index].FindControl("txtSupervisor")).Text.ToString());
                dteAppoint = DateTime.Parse(((TextBox)dgvEmpInfo.Rows[index].FindControl("txtAppoint")).Text.ToString());
                dteJoinDate = DateTime.Parse(((TextBox)dgvEmpInfo.Rows[index].FindControl("txtJoinDate")).Text.ToString());
                try
                {
                    dteBirth = DateTime.Parse(((TextBox)dgvEmpInfo.Rows[index].FindControl("txtBirth")).Text.ToString());
                    strBirth = dteBirth.ToString();
                }
                catch { strBirth = null; }
               // dteBirth = DateTime.Parse(((TextBox)dgvEmpInfo.Rows[index].FindControl("txtBirth")).Text.ToString());
                strContact = ((TextBox)dgvEmpInfo.Rows[index].FindControl("txtContact")).Text.ToString();
                ysnActive = ((CheckBox)dgvEmpInfo.Rows[index].FindControl("chkActive")).Checked;
                ysnSalaryHold = ((CheckBox)dgvEmpInfo.Rows[index].FindControl("chkSalaryHold")).Checked;
                

                bll.UpdateEmpInfo(strCode, strCardNo, strName, strEmail, intSuperviserId, dteAppoint, dteJoinDate, strBirth, strContact, ysnActive, ysnSalaryHold, intEnroll);
                ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('Updated.');", true);

                bll.InsertSupportLog("Profile Update for " + intEnroll.ToString(), "Update", int.Parse(hdnempid.Value.ToString()));
            }
            catch { }


        }











    }
}