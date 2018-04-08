using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using System.Data;

namespace UI.HR
{
    public partial class EmployeeAttendance : System.Web.UI.Page
    {
        DataTable dt; BLLHR bll = new BLLHR();
        int intEnroll; DateTime dteDate;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    btnExport.Visible = false;
                }
            }
            catch { }
        }

        protected void btnShow_Click(object sender, EventArgs e)
        {
            if (txtEnroll.Text != "" || txtDate.Text != "")
            {
                try
                {
                    intEnroll = int.Parse(txtEnroll.Text.ToString());
                    dteDate = DateTime.Parse(txtDate.Text.ToString());

                    dt = new DataTable();
                    dt = bll.GetAttendance(intEnroll, dteDate);
                    dgvAttendance.DataSource = dt;
                    dgvAttendance.DataBind();
                    btnExport.Visible = true;
                }
                catch { }
            }
            else
            {
                ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('Input Correct Information.');", true);
                dgvAttendance.DataSource = "";
                dgvAttendance.DataBind();
                btnExport.Visible = false;
            }
        }

        protected void btnExport_Click(object sender, EventArgs e)
        {
            try
            {
                //txtEnroll.Visible = false;
                //lblEnroll.Visible = false;
                //txtDate.Visible = false;
                //lblDate.Visible = false;
                //btnExport.Visible = false;
                //btnShow.Visible = false;

                string strFile = txtEnroll.Text +"-"+ DateTime.Parse(txtDate.Text.ToString()).Month;
                Response.Clear();

                Response.AddHeader("content-disposition", "attachment;filename ="+ strFile + ".xls");
            
                Response.ContentType = "application/vnd.xls";

                System.IO.StringWriter stringWrite = new System.IO.StringWriter();

                System.Web.UI.HtmlTextWriter htmlWrite = new HtmlTextWriter(stringWrite);

                dgvAttendance.RenderControl(htmlWrite);

                Response.Write(stringWrite.ToString());

                Response.End();
            }
            catch { }

            //txtEnroll.Visible = true;
            //lblEnroll.Visible = true;
            //txtDate.Visible = true;
            //lblDate.Visible = true;
            //btnExport.Visible = true;
            //btnShow.Visible = true;
        }
    }
}