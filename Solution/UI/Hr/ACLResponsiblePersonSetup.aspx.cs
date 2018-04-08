using BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UI.Scripts.WebForms.Customize;

namespace UI.HR
{
    public partial class ACLResponsiblePersonSetup : System.Web.UI.Page
    {
        DataTable dt; BLLHR bll = new BLLHR();
        //bool ysnHasTab;
        int intEnroll, intResponsible, intActionBy;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                hdnempid.Value = HttpContext.Current.Session[SessionParams.Enroll].ToString();
                btnInsert.Visible = false;
                lblResponsible.Visible = false;
                txtResponsible.Visible = false;
            }
        }

        protected void txtEnroll_TextChanged(object sender, EventArgs e)
        {
            try
            {
                btnInsert.Visible = false;
                lblResponsible.Visible = false;
                txtResponsible.Visible = false;
            }
            catch { }
        }

        protected void btnCheck_Click(object sender, EventArgs e)
        {
            try
            {
                btnInsert.Visible = false;
                lblResponsible.Visible = false;
                txtResponsible.Visible = false;

                if (txtEnroll.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('Input Correct Information.');", true);
                }
                else
                {
                    intEnroll = int.Parse(txtEnroll.Text);
                    DataTable dt = new DataTable();
                    dt = bll.GetResponsibleData(intEnroll);
                    if (dt.Rows.Count > 0)
                    {
                        txtEnroll.Text = dt.Rows[0]["intEnroll"].ToString();
                        txtResponsible.Text = dt.Rows[0]["intResponsibleEnroll"].ToString();
                        //ysnHasTab = bool.Parse(dt.Rows[0]["ysnHasTab"].ToString());

                        lblResponsible.Visible = true;
                        txtResponsible.Visible = true;
                        btnInsert.Text = "Update";
                        btnInsert.Visible = true;
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('Enroll Not Found. Please Insert.');", true);
                        lblResponsible.Visible = true;
                        txtResponsible.Visible = true;
                        btnInsert.Text = "Insert";
                        btnInsert.Visible = true;
                    }
                }
            }
            catch { }
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            try
            {
                intEnroll = int.Parse(txtEnroll.Text);
                intResponsible = int.Parse(txtResponsible.Text);
                intActionBy = int.Parse(hdnempid.Value);

                if (txtEnroll.Text == "" && txtResponsible.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('Please insert valid information.');", true);
                }
                else if(btnInsert.Text == "Insert")
                {
                    try
                    {
                        DataTable dt = new DataTable();
                        dt = bll.GetResponsibleData(intResponsible);
                        if (dt.Rows.Count > 0)
                        {
                            bll.UpdateSupervisorTab(intActionBy, intResponsible);
                        }
                        bll.InsertResposible(intEnroll, intResponsible, intActionBy);
                        ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('Resposible Person Inserted.');", true);

                        bll.InsertSupportLog("ACL Person Setup", "Insert", intActionBy);
                    }
                    catch { }
                }
                else if (btnInsert.Text == "Update")
                {
                    
                    try
                    {
                        DataTable dt = new DataTable();
                        dt = bll.GetResponsibleData(intResponsible);
                        if (dt.Rows.Count > 0)
                        {
                            bll.UpdateResponsible(intResponsible, intActionBy, intEnroll);

                            bll.UpdateSupervisorTab(intActionBy, intResponsible);
                            ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('Resposible Person Updated.');", true);

                            bll.InsertSupportLog("ACL Person Setup", "Update", intActionBy);
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('Supervisor Enroll Not Found.');", true);
                        }
                    }
                    catch { }
                    
                }
            }
            catch { }
        }













    }
}