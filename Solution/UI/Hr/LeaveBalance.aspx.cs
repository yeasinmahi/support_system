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
    public partial class LeaveBalance : System.Web.UI.Page
    {
        int intEnroll, intTaken, intRemain, intAutoID; DataTable dt; BLL.BLLHR bll = new BLL.BLLHR();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dgvLeaveBalance.DataSource = "";
                dgvLeaveBalance.DataBind();
                txtEnroll.Text = "";
                
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
                intAutoID = int.Parse(strReffid.ToString());

                int index = int.Parse(strdex.ToString());
                intTaken = int.Parse(((TextBox)dgvLeaveBalance.Rows[index].FindControl("txtLeaveTaken")).Text.ToString());
                intRemain = int.Parse(((TextBox)dgvLeaveBalance.Rows[index].FindControl("txtRemaining")).Text.ToString());
                
                bll.UpdateLeaveBalance(intTaken, intRemain, intAutoID);
                ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('Updated.');", true);
            }
            catch { }
        }

        protected void btnCheck_Click(object sender, EventArgs e)
        {
            intEnroll = int.Parse(txtEnroll.Text);
            try
            {
                dt = new DataTable();
                dt = bll.GetLeaveBalance(intEnroll);
                dgvLeaveBalance.DataSource = dt;
                dgvLeaveBalance.DataBind();
            }
            catch { }
        }
    }
}