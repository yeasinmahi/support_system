using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace UI.HR
{
    public partial class HrAkijNetPermission : System.Web.UI.Page
    {
        int intEnroll; DataTable dt; BLLHR bll = new BLLHR();
        string strEmail;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                intEnroll = int.Parse(txtEnroll.Text);
                strEmail = txtEmail.Text.ToString();

                bll.DeletePermissionDataByEmail(strEmail);
                bll.DeletePermissionDataByEnroll(intEnroll);
                bll.InsertPermissionData(intEnroll);
                ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('Permission Submitted.');", true);
            }
            catch { ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('There was an error in Employee Profile.');", true); }
        }

        protected void btnCheck_Click(object sender, EventArgs e)
        {
            try
            {
                if(txtEmail.Text=="" || txtEnroll.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('Input Correct Information.');", true);
                }
                else
                {
                    intEnroll = int.Parse(txtEnroll.Text);
                    strEmail = txtEmail.Text.ToString();
                    dt = new DataTable();
                    dt = bll.GetDuplicateEmail(strEmail);

                    if(dt.Rows.Count > 1)
                    {
                        ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('Duplicate Email Found. Please Update Employee Profile');", true);
                    }
                    else
                    {
                        dt = new DataTable();
                        dt = bll.GetEmpInfoForPermission(intEnroll, strEmail);

                        if (dt.Rows.Count == 1)
                        {
                            txtName.Text = dt.Rows[0]["strEmployeeName"].ToString();
                            txtCardNo.Text = dt.Rows[0]["strSortName"].ToString();
                            txtPhoneNo.Text = dt.Rows[0]["strContactNo1"].ToString();
                            txtAppointDate.Text = dt.Rows[0]["dteAppointmentDate"].ToString();
                            txtJobType.Text = dt.Rows[0]["intJobTypeId"].ToString();
                            txtUnitID.Text = dt.Rows[0]["intUnitID"].ToString();
                            txtDepartment.Text = dt.Rows[0]["intDepartmentID"].ToString();
                            txtDesignation.Text = dt.Rows[0]["intDesignationID"].ToString();
                        }
                        else if (dt.Rows.Count == 0)
                        {
                            ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('Employee not found in Employee Profile.');", true);
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('Employee not found in Employee Profile.');", true);
                        }
                    }
                    
                }
            }
            catch { }
        }
    }
}