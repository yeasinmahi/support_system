using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using System.Text.RegularExpressions;
using UI.Scripts.WebForms.Customize;

namespace UI.HR
{
    public partial class PrivilegeLeave : System.Web.UI.Page
    {
        int intEnroll, intYear, intCount, intAppID, intMonthID, intLoginID, intAllowanceID, intOldDiff, intNewDiff, intLeaveTypeID, intActionBy; DataTable dt; BLLHR bll = new BLLHR();
        DateTime dteNewFrom, dteNewTo, dteOldFrom, dteOldTo;
        decimal monBasic, monAmount;
        bool ysnTaken;
        string strAllowanceID, strOldFrom, strOldTo, strNewFrom, strNewTo;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                hdnempid.Value = HttpContext.Current.Session[SessionParams.Enroll].ToString();
                lblInfo.Text = "Please Inpunt Enroll & Leave Year";
                btnAllowanceEntry.Visible = false;
                //btnPLDateChange.Visible = false;
                btnScheduleEntry.Visible = false;
            }
        }

        protected void btnCheck_Click(object sender, EventArgs e)
        {
            intEnroll = int.Parse(txtEnroll.Text);
            intYear = int.Parse(txtYear.Text);
            // strEmail = txtEmail.Text;
            btnAllowanceEntry.Visible = false;
            //btnPLDateChange.Visible = false;
            btnScheduleEntry.Visible = false;
            txtSBasic.Text = "";
            txtLYear.Text = "";
            chkExist.Checked = false;
            chkLeaveTaken.Checked = false;
            txtAllowanceID.Text = "";
            txtSalaryMonth.Text = "";
            txtPBasic.Text = "";
            txtPLAmount.Text = "";

            PLScheduleEntry();

            PLAmountEntry();

            PLDateChange();
        }
        private void PLDateChange()
        {
            try
            {
                dt = new DataTable();
                dt = bll.GetPLDate(intEnroll, intYear);
                dgvPLInfo.DataSource = dt;
                dgvPLInfo.DataBind();
            }
            catch { }
        }
        private void PLAmountEntry()
        {
            try
            {
                if(btnScheduleEntry.Visible == true)
                {
                    return;
                }
                else
                {
                    dt = new DataTable();
                    dt = bll.GetAmountInfo(intYear, intEnroll);

                    if (dt.Rows.Count > 0)
                    {
                        txtAllowanceID.Text = dt.Rows[0]["intAllowanceId"].ToString();
                        txtSalaryMonth.Text = dt.Rows[0]["intMonthId"].ToString();
                        txtPBasic.Text = dt.Rows[0]["monBasic"].ToString();
                        txtPLAmount.Text = dt.Rows[0]["monAmount"].ToString();
                        if (decimal.Parse(txtPLAmount.Text) > 0)
                        {
                            btnAllowanceEntry.Visible = false;
                            lblInfo.Text = "PL Allowance Already Taken.";
                        }
                        else
                        {
                            btnAllowanceEntry.Visible = true;
                        }
                    }
                    else
                    {
                        txtAllowanceID.Text = "N/A";
                        dt = new DataTable();
                        dt = bll.GetBasic((intYear - 1), intEnroll);
                        txtPLAmount.Text = dt.Rows[0]["monBasicAmount"].ToString();

                        dt = new DataTable();
                        dt = bll.GetEmpBasic(intEnroll);
                        txtPBasic.Text = dt.Rows[0]["monBasic"].ToString();

                        btnAllowanceEntry.Visible = true;
                        lblInfo.Text = "Please Check & Insert Allowance.";
                    }
                }
            }
                
            catch { }
        }
        private void PLScheduleEntry()
        {
            try
            {
                dt = new DataTable();
                dt = bll.GetPLInfo(intEnroll, intYear);

                if (dt.Rows.Count > 0)
                {
                    chkLeaveTaken.Checked = bool.Parse(dt.Rows[0]["ysnPLELTaken"].ToString());
                    txtSBasic.Text = dt.Rows[0]["monPLELAmmount"].ToString();
                    txtLYear.Text = (intYear - 1).ToString();
                    intCount = int.Parse(dt.Rows[0]["intCount"].ToString());

                    if (intCount >= 1)
                    {
                        chkExist.Checked = true;
                    }
                    else
                    {
                        chkExist.Checked = false;
                    }
                    lblInfo.Text = "Schedule already included.";
                    
                }
                else
                {
                    btnScheduleEntry.Visible = true;
                    lblInfo.Text = "Please insert PL information.";
                    dt = new DataTable();
                    dt = bll.GetBasic(intYear - 1, intEnroll);

                    txtSBasic.Text = dt.Rows[0]["monBasicAmount"].ToString();
                    txtLYear.Text = (int.Parse(txtYear.Text) - 1).ToString();
                    chkLeaveTaken.Checked = false;
                    chkExist.Checked=false;
                    
                }
            }
            catch { }
        }
        protected void btnScheduleEntry_Click(object sender, EventArgs e)
        {
            try
            {
                intEnroll = int.Parse(txtEnroll.Text);
                monBasic = decimal.Parse(txtSBasic.Text);
                intYear = int.Parse(txtLYear.Text);
                ysnTaken = false;
                intActionBy = int.Parse(hdnempid.Value.ToString());

                bll.InsertPLSchedule(intEnroll, monBasic, intYear, ysnTaken);
                lblInfo.Text = "Information Updated.";

                bll.InsertSupportLog("PL Schedule Entry for " + txtEnroll.Text, "Insert", intActionBy);

                intEnroll = int.Parse(txtEnroll.Text);
                intYear = int.Parse(txtYear.Text);
                // strEmail = txtEmail.Text;
                btnAllowanceEntry.Visible = false;
                //btnPLDateChange.Visible = false;
                btnScheduleEntry.Visible = false;
                txtSBasic.Text = "";
                txtLYear.Text = "";
                chkExist.Checked = false;
                chkLeaveTaken.Checked = false;
                txtAllowanceID.Text = "";
                txtSalaryMonth.Text = "";
                txtPBasic.Text = "";
                txtPLAmount.Text = "";

                PLScheduleEntry();

                PLAmountEntry();

                PLDateChange();


                ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('Schedule Updated.');", true);
            }
            catch { lblInfo.Text = "Something went wrong."; }
        }
        protected void btnAllowanceEntry_Click(object sender, EventArgs e)
        {
            try
            {
                strAllowanceID = txtAllowanceID.Text;
                intLoginID = int.Parse(hdnempid.Value);

                if (strAllowanceID == "" || strAllowanceID == "N/A") //Here insert Allowance & Details
                {
                    intMonthID = int.Parse(txtSalaryMonth.Text);
                    intYear = int.Parse(txtYear.Text);
                    intEnroll = int.Parse(txtEnroll.Text);

                    bll.InsertAllowance(intMonthID, intYear, intEnroll, intLoginID);

                    dt = new DataTable();
                    dt = bll.GetAllowanceID(intYear, intEnroll);

                    if (dt.Rows.Count > 0)
                    {
                        intAllowanceID = int.Parse(dt.Rows[0]["intAllowanceId"].ToString());
                        monAmount = decimal.Parse(txtPLAmount.Text);

                        bll.InsertAllowanceDetails(intAllowanceID, monAmount);

                        bll.UpdatePLTaken(intEnroll, intYear);
                        
                    }
                }
                else //Here update PL Amount & Salary Month
                {
                    intAllowanceID = int.Parse(strAllowanceID.ToString());
                    monAmount = decimal.Parse(txtPLAmount.Text);
                    intYear = int.Parse(txtYear.Text)-1;

                    bll.UpdatePLAmount(monAmount, intAllowanceID);

                    bll.UpdatePLTaken(intEnroll, intYear);
                }
                ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('Updated.');", true);
                bll.InsertSupportLog("PL Allowance Entry for " + txtEnroll.Text, "Insert", intLoginID);
            }
            catch { }
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            //try
            {
                string senderdata = ((Button)sender).CommandArgument.ToString();
                string strSearchKey = ((Button)sender).CommandArgument.ToString();
                string[] searchKey = Regex.Split(strSearchKey, ",");
                string strdex = searchKey[1];
                string strReffid = searchKey[0];
                intAppID = int.Parse(strReffid.ToString());
                intEnroll = int.Parse(txtEnroll.Text);
                intLoginID = int.Parse(hdnempid.Value);
                intLeaveTypeID = 7;

                int index = int.Parse(strdex.ToString());
                dteNewFrom = DateTime.ParseExact(((TextBox)dgvPLInfo.Rows[index].FindControl("txtApproveFrom")).Text.ToString(), "dd-MM-yyyy", null);
                dteNewTo = DateTime.ParseExact(((TextBox)dgvPLInfo.Rows[index].FindControl("txtApproveTo")).Text.ToString(),"dd-MM-yyyy", null);
                dteOldFrom = DateTime.ParseExact(((TextBox)dgvPLInfo.Rows[index].FindControl("txtApprFrom")).Text.ToString(),"dd-MM-yyyy", null);
                dteOldTo = DateTime.ParseExact(((TextBox)dgvPLInfo.Rows[index].FindControl("txtApprTo")).Text.ToString(), "dd-MM-yyyy", null);
                strOldFrom = dteOldFrom.ToShortDateString();
                strOldTo = dteOldTo.ToShortDateString();
                strNewFrom = dteNewFrom.ToShortDateString();
                strNewTo = dteNewTo.ToShortDateString();
                intOldDiff = int.Parse(((dteOldTo.AddDays(1) - dteOldFrom).TotalDays).ToString());
                intNewDiff = int.Parse(((dteNewTo.AddDays(1) - dteNewFrom).TotalDays).ToString());
               


                try
                {
                    bll.UpdateLeaveDays(dteOldFrom, dteOldTo, dteNewFrom, dteNewTo, intEnroll, intAppID, intLoginID, intLeaveTypeID, intOldDiff, intNewDiff);

                    ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('Updated');", true);

                    bll.InsertSupportLog("PL Date Update for " + txtEnroll.Text, "Update", intLoginID);
                }
                catch { }

            }
            //catch { }

        }
        protected void txtEnroll_TextChanged(object sender, EventArgs e)
        {
            btnAllowanceEntry.Visible = false;
            btnScheduleEntry.Visible = false;
            txtSBasic.Text = "";
            txtLYear.Text = "";
            chkExist.Checked = false;
            chkLeaveTaken.Checked = false;
            txtAllowanceID.Text = "";
            txtSalaryMonth.Text = "";
            txtPBasic.Text = "";
            txtPLAmount.Text = "";
        }


    }
}