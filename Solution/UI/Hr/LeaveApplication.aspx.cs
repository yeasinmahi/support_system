using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UI.HR
{
    public partial class LeaveApplication : System.Web.UI.Page
    {
        int intEnroll, intAppID, intLoginID, intLeaveTypeID, intOldDiff, intNewDiff;
        string strCode, strOldFrom, strOldTo, strNewFrom, strNewTo;
        DateTime dteNewFrom, dteNewTo, dteOldFrom, dteOldTo;
        DataTable dt; BLL.BLLHR bll = new BLL.BLLHR();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnShow_Click(object sender, EventArgs e)
        {
            if(txtCode.Text != "" || txtEnroll.Text != "")
            {
                try
                {
                    if (txtEnroll.Text != "")
                    {
                        intEnroll = int.Parse(txtEnroll.Text);
                        dt = new DataTable();
                        dt = bll.GetEmpInfoByEnroll(intEnroll);
                        txtCode.Text = dt.Rows[0]["strEmployeeCode"].ToString();
                    }
                    else
                    {
                        strCode = txtCode.Text;
                        dt = new DataTable();
                        dt = bll.GetEmpInfoByCode(strCode);
                        txtEnroll.Text = dt.Rows[0]["intEmployeeID"].ToString();
                    }
                }
                catch { ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('Enroll & Code not found in employee profile.');", true); }

                try
                {
                    strCode = txtCode.Text;
                    intEnroll = int.Parse(txtEnroll.Text);
                    dt = new DataTable();
                    dt = bll.GetLeaveSummary(strCode, intEnroll);
                    dgvLeave.DataSource = dt;
                    dgvLeave.DataBind();
                }
                catch { }
                
            }
            else
            {
                ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('Input Any One Or Both Enroll & Code.');", true);
            }
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
                intAppID = int.Parse(strReffid.ToString());
                intEnroll = int.Parse(txtEnroll.Text);
                intLoginID = int.Parse(hdnempid.Value);
                intLeaveTypeID = 7;

                //int index = int.Parse(strdex.ToString());
                //dteNewFrom = DateTime.Parse(((TextBox)dgvLeave.Rows[index].FindControl("txtApproveFrom")).Text.ToString());
                //dteNewTo = DateTime.Parse(((TextBox)dgvLeave.Rows[index].FindControl("txtApproveTo")).Text.ToString());
                //dteOldFrom = DateTime.Parse(((TextBox)dgvLeave.Rows[index].FindControl("txtApprFrom")).Text.ToString());
                //dteOldTo = DateTime.Parse(((TextBox)dgvLeave.Rows[index].FindControl("txtApprTo")).Text.ToString());
                //strOldFrom = dteOldFrom.ToShortDateString();
                //strOldTo = dteOldTo.ToShortDateString();
                //strNewFrom = dteNewFrom.ToShortDateString();
                //strNewTo = dteNewTo.ToShortDateString();
                //intOldDiff = int.Parse(((dteOldTo.AddDays(1) - dteOldFrom).TotalDays).ToString());
                //intNewDiff = int.Parse(((dteNewTo.AddDays(1) - dteNewFrom).TotalDays).ToString());



                //try
                //{
                //    bll.UpdateLeaveDays(dteOldFrom, dteOldTo, dteNewFrom, dteNewTo, intEnroll, intAppID, intLoginID, intLeaveTypeID, intOldDiff, intNewDiff);

                //    ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('Updated');", true);

                //    bll.InsertSupportLog("PL Date Update for " + txtEnroll.Text, "Update", intLoginID);
                //}
                //catch { }

            }
            catch { }
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {

        }
    }
}