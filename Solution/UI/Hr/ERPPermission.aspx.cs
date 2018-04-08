using BLL;
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
    public partial class ERPPermission : System.Web.UI.Page
    {
        int intEnroll, intType, intUnitID, intJobStationID, intRoleID, intActionBy; DataTable dt; BLLHR bll = new BLLHR(); int? intGroup;
        string strCode, strEmail, strPAccName, strMsg;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    hdnempid.Value = HttpContext.Current.Session[SessionParams.Enroll].ToString();
                    HideControl();
                    try
                    {
                        intUnitID = int.Parse(ddlUnit.SelectedValue.ToString());
                        dt = new DataTable();
                        dt = bll.GetJobStationByUnit(intUnitID);
                        ddlJobStation.DataSource = dt;
                        ddlJobStation.DataTextField = "strJobStationName";
                        ddlJobStation.DataValueField = "intEmployeeJobStationId";
                        ddlJobStation.DataBind();
                    }
                    catch { }
                }
            }
            catch { }
        }

        protected void ddlUnit_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                intUnitID = int.Parse(ddlUnit.SelectedValue.ToString());
                dt = new DataTable();
                dt = bll.GetJobStationByUnit(intUnitID);
                ddlJobStation.DataSource = dt;
                ddlJobStation.DataTextField = "strJobStationName";
                ddlJobStation.DataValueField = "intEmployeeJobStationId";
                ddlJobStation.DataBind();
                ddlJobStation.Items.Insert(0, new ListItem("All Job Station", "0"));
            }
            catch { }
        }

        protected void ddlType_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (txtEnroll.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('Input Valid Enroll.');", true);
                    return;
                }

                HideControl();

                intEnroll = int.Parse(txtEnroll.Text);
                intType = int.Parse(ddlType.SelectedValue.ToString());
                if (intType == 1)   //General Permission
                {
                    HideControl();
                }
                else if (intType == 2)  //Menu Permission
                {
                    btnShow.Visible = true;
                }
                else if (intType == 3)  //Unit Permission
                {
                    btnShow.Visible = true;
                    ddlUnit.Visible = true;

                    dt = new DataTable();
                    dt = bll.GetAllUnitList();
                    ddlUnit.DataSource = dt;
                    ddlUnit.DataValueField = "intUnitID";
                    ddlUnit.DataTextField = "strUnit";
                    ddlUnit.DataBind();
                    ddlUnit.Items.Insert(0, new ListItem("All Unit", "0"));

                }
                else if (intType == 4)  //Job Station Permission
                {
                    btnShow.Visible = true;
                    ddlUnit.Visible = true;
                    lblUnit.Visible = true;
                    ddlJobStation.Visible = true;
                    lblJobStation.Visible = true;

                    dt = new DataTable();
                    dt = bll.GetUserUnitList(intEnroll);
                    ddlUnit.DataSource = dt;
                    ddlUnit.DataTextField = "strUnit";
                    ddlUnit.DataValueField = "intUnitID";
                    ddlUnit.DataBind();

                }
                dgvPermission.DataSource = "";
                dgvPermission.DataBind();
            }
            catch { }
        }

        private void LoadUnitGrid()
        {
            try
            {
                dt = new DataTable();
                dt = bll.GetUserUnitList(intEnroll);
                dgvUnitList.DataSource = dt;
                dgvUnitList.DataBind();
                ddlUnit.Visible = true;
                lblUnit.Visible = true;
            }
            catch { }
        }

        private void HideControl()
        {
            lblJobStation.Visible = false;
            lblUnit.Visible = false;
            ddlJobStation.Visible = false;
            ddlUnit.Visible = false;
            btnShow.Visible = false;

            dgvPermission.DataSource = "";
            dgvPermission.DataBind();

            dgvJobStation.DataSource = "";
            dgvJobStation.DataBind();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtEnroll.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('Input Valid Enroll.');", true);
                    return;
                }
                intEnroll = int.Parse(txtEnroll.Text);
                intType = int.Parse(ddlType.SelectedValue.ToString());
                intActionBy = int.Parse(hdnempid.Value.ToString());

                dt = new DataTable();
                dt = bll.GetEmpInfoByEnroll(intEnroll);
                if(dt.Rows.Count == 1)
                {
                    strCode = dt.Rows[0]["strEmployeeCode"].ToString();
                    strEmail = dt.Rows[0]["strOfficeEmail"].ToString();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('Invalid Enroll');", true);
                    return;
                }
                strPAccName = "test@akij.net"; intGroup = 0;
                if (intType == 1)   //General Permission
                {
                    dt = new DataTable();
                    dt = bll.InsertPermission(intEnroll, strCode, strEmail, strPAccName, intGroup);
                    strMsg = dt.Rows[0][0].ToString(); 
                    
                    ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('"+ strMsg +"');", true);

                    bll.InsertSupportLog("ERP Login Permission for " + intEnroll.ToString(), "Insert", intActionBy);
                }
                else if (intType == 2)  //Menu Permission
                {
                    try
                    {
                        
                        dt = new DataTable();
                        dt = bll.InsertPermission(intEnroll, strCode, strEmail, strPAccName, intGroup);

                        bool ysnOldStatus, ysnNewStatus;
                        for (int i = 0; i < dgvPermission.Rows.Count; i++)
                        {
                            ysnOldStatus = ((CheckBox)dgvPermission.Rows[i].FindControl("chkStatus")).Checked;
                            ysnNewStatus = ((CheckBox)dgvPermission.Rows[i].FindControl("chkPermission")).Checked;
                            if (ysnOldStatus != ysnNewStatus)
                            {
                                intRoleID = int.Parse(((Label)dgvPermission.Rows[i].FindControl("lblID")).Text.ToString());

                                bll.InsertMenuPermission(intEnroll, strCode, intRoleID, ysnNewStatus, intActionBy);
                                
                            }
                        }
                        ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('Menu Permission Submitted Successfully.');", true);
                        bll.InsertSupportLog("ERP Menu Permission for " + intEnroll.ToString(), "Update", intActionBy);

                        LoadPermissionGrid();
                    }
                    catch { }
                }
                else if (intType == 3)  //Unit Permission
                {
                    try
                    {
                        intUnitID = int.Parse(ddlUnit.SelectedValue.ToString());
                        if (intUnitID != 0)
                        {
                            bll.InsertUnitJobStation(1, intEnroll, intUnitID, intJobStationID);
                        }
                        else
                        {
                            bll.InsertUnitJobStation(2, intEnroll, intUnitID, intJobStationID);
                        }
                        ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('Unit Permission Submitted Successfully.');", true);
                        bll.InsertSupportLog("Insert Unit Permission for " + intEnroll.ToString(), "Update", intActionBy);
                        LoadUnitGrid();
                    }
                    catch { }
                }
                else if (intType == 4)  //Job Station Permission
                {
                    try
                    {
                        intJobStationID = int.Parse(ddlJobStation.SelectedValue.ToString());
                        if(intJobStationID != 0)
                        {
                            bll.InsertUnitJobStation(3, intEnroll, intUnitID, intJobStationID);
                        }
                        else
                        {
                            bll.InsertUnitJobStation(4, intEnroll, intUnitID, intJobStationID);
                        }
                        ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('Job Station Permission Submitted Successfully.');", true);
                        bll.InsertSupportLog("Insert Job Station Permission for " + intEnroll.ToString(), "Insert", intActionBy);
                        LoadJobStationGrid();
                    }
                    catch { }
                }
            }
            catch { }
        }
        protected void btnShow_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtEnroll.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('Input Valid Enroll.');", true);
                    return;
                }
                intEnroll = int.Parse(txtEnroll.Text);
                intType = int.Parse(ddlType.SelectedValue.ToString());

                if (intType == 2)
                {
                    LoadPermissionGrid();
                }
                else if (intType == 3)
                {
                    LoadUnitGrid();
                }
                else if (intType == 4)
                {
                    LoadJobStationGrid();
                }
                
            }
            catch { }
        }
        private void LoadPermissionGrid()
        {
            try
            {
                dt = new DataTable();
                dt = bll.GetPermissionList(intEnroll);
                dgvPermission.DataSource = dt;
                dgvPermission.DataBind();
            }
            catch { }
        }
        private void LoadJobStationGrid()
        {
            try
            {
                dt = new DataTable();
                dt = bll.GetJobStationByEnroll(intEnroll);
                dgvJobStation.DataSource = dt;
                dgvJobStation.DataBind();
            }
            catch { }
        }

        protected void btnUnitDelete_Click(object sender, EventArgs e)
        {
            try
            {
                intEnroll = int.Parse(txtEnroll.Text);
                intActionBy = int.Parse(hdnempid.Value.ToString());
                string senderdata = ((Button)sender).CommandArgument.ToString();
                string strSearchKey = ((Button)sender).CommandArgument.ToString();
                string[] searchKey = Regex.Split(strSearchKey, ",");
                string strdex = searchKey[1];
                string strReffid = searchKey[0];
                intUnitID = int.Parse(strReffid.ToString());
                
                bll.DeleteUnit(intEnroll, intUnitID);

                bll.InsertSupportLog("Delete Unit Permission for " + intEnroll.ToString(), "Delete", intActionBy);
                LoadUnitGrid();
            }
            catch { }
        }
        protected void btnStationDelete_Click(object sender, EventArgs e)
        {
            try
            {
                intEnroll = int.Parse(txtEnroll.Text);
                intActionBy = int.Parse(hdnempid.Value.ToString());
                string senderdata = ((Button)sender).CommandArgument.ToString();
                string strSearchKey = ((Button)sender).CommandArgument.ToString();
                string[] searchKey = Regex.Split(strSearchKey, ",");
                string strdex = searchKey[1];
                string strReffid = searchKey[0];
                intJobStationID = int.Parse(strReffid.ToString());

                bll.DeleteJobStation(intEnroll, intJobStationID);

                bll.InsertSupportLog("Delete Job Station Permission for " + intEnroll.ToString(), "Delete", intActionBy);
                LoadJobStationGrid();
            }
            catch { }
        }











    }
}