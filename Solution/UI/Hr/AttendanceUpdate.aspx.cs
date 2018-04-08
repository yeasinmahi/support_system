using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UI.Scripts.WebForms.Customize;

namespace UI.HR
{
    public partial class AttendanceUpdate : System.Web.UI.Page
    {
        int intEnroll, intMonth, intYear, intAutoID; DataTable dt; BLL.BLLHR bll = new BLL.BLLHR();
        DateTime dteDate; string strStatus; string strDate;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtDate.Text = "";
            }
        }

        protected void btnShow_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtEnroll.Text != "")
                {
                    intEnroll = int.Parse(txtEnroll.Text);
                    dteDate = DateTime.Parse(txtDate.Text.ToString());
                    intMonth = dteDate.Month;
                    intYear = dteDate.Year;
                    dt = new DataTable();
                    dt = bll.GetAttendanceStatus(intEnroll, intMonth, intYear);
                    dgvAttendance.DataSource = dt;
                    dgvAttendance.DataBind();

                    
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
                intAutoID = int.Parse(strReffid.ToString());
                int intActionBy = int.Parse(HttpContext.Current.Session[SessionParams.Enroll].ToString());

                int index = int.Parse(strdex.ToString());
                strStatus = ((DropDownList)dgvAttendance.Rows[index].FindControl("ddlStatus")).Text.ToString();
                if (strStatus == "1")
                {
                    bll.UpdatePresent(intAutoID);
                }
                else if (strStatus == "2")
                {
                    bll.UpdateAbsent(intAutoID);
                }
                else if (strStatus == "3")
                {
                    bll.UpdateLeave(intAutoID);
                }
                else if (strStatus == "4")
                {
                    bll.UpdateMovement(intAutoID);
                }
                else if (strStatus == "5")
                {
                    bll.UpdateHoliday(intAutoID);
                }
                else if (strStatus == "6")
                {
                    bll.UpdateOffDay(intAutoID);
                }
                ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('Attendance Updated');", true);

                bll.InsertSupportLog("Attendance Update for " + txtEnroll.Text.ToString(), "Update", intActionBy);

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
                intAutoID = int.Parse(strReffid.ToString());
                int index = int.Parse(strdex.ToString());

                int intActionBy = int.Parse(HttpContext.Current.Session[SessionParams.Enroll].ToString());
                intEnroll = int.Parse(txtEnroll.Text);
                strDate = ((Label)dgvAttendance.Rows[index].FindControl("lblDate")).Text.ToString();

                bll.DeleteFromDailySummary(intAutoID);

                bll.UpdateAttendance(intEnroll, strDate);

                ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('Attendance Deleted');", true);

                bll.InsertSupportLog("Attendance Auto Update for " + txtEnroll.Text.ToString(), "Update", intActionBy);

            }
            catch { }
        }




    }
}