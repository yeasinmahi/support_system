using BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using UI.Scripts.WebForms.Customize;

namespace UI.Others
{
    public partial class TADAInfoDelete : System.Web.UI.Page
    {
        #region ####### Global variable ######
        DataTable dt = new DataTable(); BLL.BLLSAD bll = new BLLSAD();

        int inputstatus, outputstatus, intTSOEnroll, updateby,   enr;
        char[] delimiterChars = { '[', ']' }; string[] arrayKey;
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
             txtEmployee.Attributes.Add("onkeyUp", "SearchText();");

            }

            else
            {
                if (!String.IsNullOrEmpty(txtEmployee.Text))
                {
                    string strSearchKey = txtEmployee.Text;
                    arrayKey = strSearchKey.Split(delimiterChars);
                    string code = arrayKey[1].ToString();
                    string strCustname = strSearchKey;
                     enr = int.Parse(code.ToString());
                    LoadFieldValue(enr);

                }
                else
                {
                  
                }
            }
        }

        private void LoadFieldValue(int enrol)
        {
            try
            {

                BLLSAD objenrol = new BLLSAD();
                DataTable objDT = new DataTable();
                objDT = objenrol.GetEmployeeProfileByEnrol(enrol);
                if (objDT.Rows.Count >= 0)
                {

                    lblUnitvalue.Text = objDT.Rows[0]["strUnit"].ToString();
                    lblDesignationvalue.Text = objDT.Rows[0]["strDesignation"].ToString();
                    lblEnrolvalue.Text = objDT.Rows[0]["strEmployeeCode"].ToString();
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
                DateTime dtFromDate = BLLGlobal.GetDateAtSQLDateFormat(txtBnkVoucherDate.Text).Value;
                int intTSOEnroll = int.Parse(HttpContext.Current.Session[SessionParams.Enroll].ToString());
                int unit = 0;
                inputstatus = int.Parse(ddlBillStatus.SelectedValue.ToString());
                if (inputstatus == 1) { outputstatus = 0; }
                else  outputstatus = 1; 
                dt = bll.GetTADAInactiveBillInfo(dtFromDate, enr, unit,  outputstatus);
                if (dt.Rows.Count > 0)
                {

                    dgdvTADAInfoDelt.DataSource = dt;
                    dgdvTADAInfoDelt.DataBind();

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

        protected void grdvForDeleteTADABikeCarUser_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataTable dt = new DataTable();
                dt = bll.getTADAFuelStationlistforUpdate(int.Parse(HttpContext.Current.Session[SessionParams.Unitid].ToString()));
                var ddlCreditFuelStation1 = (DropDownList)e.Row.FindControl("ddlCreditFuelStation1List");
                ddlCreditFuelStation1.DataSource = dt;
                ddlCreditFuelStation1.DataTextField = "strFuelStationName";
                ddlCreditFuelStation1.DataValueField = "intFuelStationID";
                ddlCreditFuelStation1.DataBind();
                ddlCreditFuelStation1.Items.Insert(0, new ListItem("--Select Gas Station 1--", "0"));

                var ddlCreditFuelStation2 = (DropDownList)e.Row.FindControl("ddlCreditFuelStation2List");
                ddlCreditFuelStation2.DataSource = dt;
                ddlCreditFuelStation2.DataTextField = "strFuelStationName";
                ddlCreditFuelStation2.DataValueField = "intFuelStationID";
                ddlCreditFuelStation2.DataBind();
                ddlCreditFuelStation2.Items.Insert(0, new ListItem("--Select Gas Station 2--", "0"));

                var ddlCreditFuelStation3 = (DropDownList)e.Row.FindControl("ddlCreditFuelStation3List");
                ddlCreditFuelStation3.DataSource = dt;
                ddlCreditFuelStation3.DataTextField = "strFuelStationName";
                ddlCreditFuelStation3.DataValueField = "intFuelStationID";
                ddlCreditFuelStation3.DataBind();
                ddlCreditFuelStation3.Items.Insert(0, new ListItem("--Select Gas Station 3--", "0"));

            }
        }

        protected void btnDeleteInfo_Click(object sender, EventArgs e)
        {
            char[] delimiterChars = { ',' };
            string temp = ((Button)sender).CommandArgument.ToString();
            string[] searchKey = temp.Split(delimiterChars);
           
            string intPKIDtbl = searchKey[0].ToString();
            int intID = int.Parse(intPKIDtbl);
         
            DateTime dtFromDate = BLLGlobal.GetDateAtSQLDateFormat(txtBnkVoucherDate.Text).Value;
            int status = int.Parse(ddlBillStatus.SelectedValue.ToString());
            int totalCount = dgdvTADAInfoDelt.Rows.Cast<GridViewRow>()
                 .Count(r => ((CheckBox)r.FindControl("chkbx")).Checked);
            if (totalCount > 0)
            {
               
                    int rowIndex = 0;
                        bool ysnChecked = ((CheckBox)dgdvTADAInfoDelt.Rows[rowIndex].Cells[0].Controls[0]).Checked;
                        if (ysnChecked)
                        {
                    try
                    {
                        updateby = int.Parse(HttpContext.Current.Session[SessionParams.Enroll].ToString());
                        dt = bll.getDataforTADAInfoDelete(dtFromDate, enr, status, intID,  updateby);
                        ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('" + dt.Rows[0]["Messages"].ToString() + "');", true);
                        dt = new DataTable(); dgdvTADAInfoDelt.DataSource = dt; dgdvTADAInfoDelt.DataBind();
                        dgdvTADAInfoDelt.DataSource = ""; dgdvTADAInfoDelt.DataBind();
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

        [WebMethod]

        public static List<string> GetAutoCompleteData(string strSearchKey)
        {

            BLLSAD bll = new BLLSAD();
            List<string> result = new List<string>();
            result = bll.AutoSearchTADAEmploye(strSearchKey);
            return result;
        }
    }
}