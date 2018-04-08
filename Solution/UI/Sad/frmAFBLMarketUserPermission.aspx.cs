using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace UI.Sad
{
    public partial class frmAFBLMarketUserPermission : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
        BLLSAD objSad = new BLLSAD();
        int itemid, Custid,id,insertby,empid,enroll,levelid,unitid;
        string email, pass, FPass;
        protected void btnJobShow_Click(object sender, EventArgs e)
        {
            if (txtCustid.Text != "")
            {
                getshowCnJ();
            }
            else
            {
                ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('Please Entry Customer Id');", true);
            }
        }

        private void getshowCnJ()
        {
            
            Custid = int.Parse(txtCustid.Text);
            dt = objSad.getCustomerShow(Custid);
            dgvJVSC.DataSource = dt;
            dgvJVSC.DataBind();
        }

       

        protected void btnDelete_OnCommand(object sender, EventArgs e)
        {
            if (txtCustid.Text != "")
            {

                Custid = int.Parse(txtCustid.Text.ToString());
                msg = objSad.getCNJ(Custid);
                ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('" + msg + "');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('Please Entry Customer ID');", true);
            }
        }

        protected void txtEmpEnroll_TextChanged(object sender, EventArgs e)
        {
            Response.Write(ddlEmpDeg.SelectedValue.ToString());
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if ((txtenrollid.Text != "") && (txtemails.Text != ""))
            {
                email = txtemails.Text;
                enroll =int.Parse(txtenrollid.Text);
                pass = email.Substring(0, 3);
                FPass = pass + "@123";
                unitid =int.Parse(ddlunit.SelectedValue);

                insertby = 1324;
                msg=objSad.getACRLUser(enroll, email, ddltypes.SelectedItem.ToString(),unitid,FPass, insertby,int.Parse(ddltypes.SelectedValue));
                ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('"+msg+"');", true);


            }
            else
            {
                ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('Please Fillup Enroll and Email');", true);

            }
        }

        string msg;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                dt = objSad.getunit();
                ddlunit.DataTextField = "strunit";
                ddlunit.DataValueField = "intUnitID";
                ddlunit.DataSource = dt;
                ddlunit.DataBind();
            }

        }

      

        protected void btnAction_OnCommand(object sender, CommandEventArgs e)
        {
            char[] delimiterChars = { ';'};
            string value = (e.CommandArgument).ToString();
            string[] data = value.Split(delimiterChars);
        
            id = int.Parse(data[0].ToString());
            msg = objSad.getUserPermission(id);
            ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('" + msg + "');", true);

        }
       
        protected void btnShow_Click(object sender, EventArgs e)
        {

            if (txtenrollid.Text != "")
            {
                empid = int.Parse(txtEmpEnroll.Text);
                levelid = int.Parse(ddlEmpDeg.SelectedValue);
                dt = objSad.getEmployeeResult(empid, levelid);
                dgvEmployee.DataSource = dt;
                dgvEmployee.DataBind();
            }
            else
            {
                ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('Please Entry Customer Name or Enroll');", true);
            }
        }
    }
}