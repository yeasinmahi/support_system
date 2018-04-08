using BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UI.Scripts.WebForms.Customize;

namespace UI.Asset
{
    public partial class AssetPermission : System.Web.UI.Page
    {
        BLLAsset objAsset = new BLLAsset();
        DataTable dt = new DataTable();
        int general, vehicle, land, building;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {

            }
            else
            {

            }

        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            try
            {
                int enroll = int.Parse(txtEnroll.Text.ToString());
                chkVehicle.Checked = true;
                dt = objAsset.AssetPermissionView(enroll);
                if (dt.Rows.Count > 0)
                {
                    lblInfo.Text = dt.Rows[0]["strName"].ToString();
                    if (dt.Rows[0]["intTab1"].ToString() == "1")
                    {
                        chkGeneral.Checked = true;
                    }
                    else
                    {
                        chkGeneral.Checked = false;
                    }
                    if (dt.Rows[0]["intTab2"].ToString() == "2")
                    {
                        chkVehicle.Checked = true;
                    }
                    else
                    {
                        chkVehicle.Checked = false;
                    }
                    if (dt.Rows[0]["intTab3"].ToString() == "3")
                    {
                        chkLand.Checked = true;
                    }
                    else
                    {
                        chkLand.Checked = false;
                    }
                    if (dt.Rows[0]["intTab4"].ToString() == "4")
                    {
                        chkBuild.Checked = true;
                    }
                    else
                    {
                        chkBuild.Checked = false;
                    }
                }
                else
                {
                    chkGeneral.Checked = false;
                    chkVehicle.Checked = true;
                    chkLand.Checked = true;
                    chkBuild.Checked = true;
                    ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('Data not found.');", true);
                    txtEnroll.Text = "";
                }
            }
            catch { txtEnroll.Text = ""; }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                if (chkGeneral.Checked==true)
                {
                    general =1;
                }
                else
                {
                    general = 0;
                }
                if (chkVehicle.Checked == true)
                {
                    vehicle = 2;
                }
                else
                {
                    vehicle = 0;
                }
                if (chkLand.Checked == true)
                {
                    land = 3;
                }
                else
                {
                    land = 0;
                }
                if (chkBuild.Checked == true)
                {
                    building = 4;
                }
                else
                {
                    building = 0;
                }


                int enroll = int.Parse(txtEnroll.Text.ToString());
               
                dt = objAsset.EmployeeProfile(enroll);
                if (dt.Rows.Count > 0)
                {
                    int jobstation = int.Parse(dt.Rows[0]["intJobstationId"].ToString());
                    int unit = int.Parse(dt.Rows[0]["intUnitId"].ToString());
                    dt = objAsset.AssetPermissionView(enroll);
                    if (dt.Rows.Count > 0)
                    {
                        objAsset.AssetPermissionUpdate(general, vehicle, land, building, enroll);
                        ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('Asset Permission Updated.');", true);
                    }
                    else
                    {
                        objAsset.AssetPermisionInsert(enroll, jobstation, unit, general, vehicle, land, building);
                        ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('Asset Permission Updated.');", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('Enroll number not found.');", true);
                    txtEnroll.Text = "";
                }
            }
            catch
            {

            }
          
        }
    }
}