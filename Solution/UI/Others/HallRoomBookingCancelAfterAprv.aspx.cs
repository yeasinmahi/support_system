using BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UI.Scripts.WebForms.Customize;

namespace UI.Others
{
    public partial class HallRoomBookingCancelAfterAprv : System.Web.UI.Page
    {

        int pkid, typeid, updateby, rowIndex;
        bool ysnChecked;
        BLLSAD bll = new BLLSAD();
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               

                //txtSupplier.Attributes.Add("onkeyUp", "SearchText();");

                ////---------xml----------
                //try { File.Delete(filePathForXML); }
                //catch { }
                ////-----**----------//
            }

            else
            {
                if (!String.IsNullOrEmpty(txtpkid.Text))
                {
                    pkid = int.Parse(txtpkid.Text);
                    LoadFieldValue(pkid);

                }
                else
                {
                    //ClearControls();
                }
            }
        }
        private void LoadFieldValue(int pkid)
        {
            try
            {
                updateby = int.Parse(HttpContext.Current.Session[SessionParams.Enroll].ToString());

                dt = bll.GetHallRoomBookingStatus(pkid,1, updateby);
                if (dt.Rows.Count > 0)
                {
                    
                    lblUnitvalue.Text = dt.Rows[0]["unit"].ToString();
                    lblEnrolvalue.Text = dt.Rows[0]["emplid"].ToString();
                    lblNamevalue.Text = dt.Rows[0]["strName"].ToString();
                    lblUnitvalue.Text = dt.Rows[0]["unit"].ToString();
                    
                }
                else
                {
                    ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('Sorry! There is no data againist your query');", true);
                }

            }
            catch (Exception ex) { throw ex; }
        }
        protected void btnShow_Click(object sender, EventArgs e)
        {
            LoadReport();
        }
        private void LoadReport()
        {
            try
            {
                typeid = 1;
                dt = bll.GetHallRoomBookingStatus(pkid, 1, updateby);
                if (dt.Rows.Count > 0)
                {

                    grdvforCancelHallBooking.DataSource = dt;
                    grdvforCancelHallBooking.DataBind();

                }
                else
                {


                    ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('Sorry! There is no data againist your query');", true);

                }


            }


            catch
            {

            }
        }

        protected void btnDeleteInfo_Click(object sender, EventArgs e)
        {
            pkid = int.Parse(txtpkid.Text);
            
            
            int totalCount = grdvforCancelHallBooking.Rows.Cast<GridViewRow>()
                 .Count(r => ((CheckBox)r.FindControl("chkbx")).Checked);
            if (totalCount > 0)
            {
                    rowIndex = 0;
                    ysnChecked = ((CheckBox)grdvforCancelHallBooking.Rows[rowIndex].Cells[0].Controls[0]).Checked;
                    if (ysnChecked)
                    {
                        try
                        {
                            dt = bll.GetHallRoomBookingStatus(pkid,2, updateby);
                            ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('" + dt.Rows[0]["Messages"].ToString() + "');", true);

                            dt = new DataTable(); grdvforCancelHallBooking.DataSource = dt; grdvforCancelHallBooking.DataBind();
                            grdvforCancelHallBooking.DataSource = ""; grdvforCancelHallBooking.DataBind();
                        //LoadReport();
                    }


                        catch
                        {

                        }
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('only check one row ');", true);
                    }
                }

            


            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('For Bill Update You must seleck one check box at left side of the row. ');", true);
            }

        }

        protected void grdvforCancelHallBooking_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }
    }
}