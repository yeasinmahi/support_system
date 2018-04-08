using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using System.Web.Script.Services;
using System.Data;

namespace UI.Reports
{
    public partial class frmCustomerPendingUpdate : System.Web.UI.Page
    {
        BLLSAD objSad = new BLLSAD();
        DataTable dt;
        decimal Price,qty;string msg, depotname;
        int Unitid,Itemid,Custid, pendingmote=1, depotid, enroll;

        protected void btnUnfoundSubmit_Click(object sender, EventArgs e)
        {
            if (txtSearchCustomer.Text != "")
            {
                char[] delimiterChars = { ';' };
                string value = (txtSearchCustomer.Text.ToString());
                string[] data = value.Split(delimiterChars);
                Custid = int.Parse(data[1].ToString());

                msg = objSad.getUnfounorderdelete(Custid);
                ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('" + msg + "');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('Please Select Customer Name!');", true);
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Unitid = 2;

                dt = objSad.getShipPoints(Unitid);
                if(dt.Rows.Count>0)
                {   ddlDepot.DataTextField = "strname";
                    ddlDepot.DataValueField = "intid";
                    ddlDepot.DataSource = dt;
                    ddlDepot.DataBind();
                }
         
            }
        }

    

        [WebMethod]
        [ScriptMethod]
        public static string[] GetProductNameSearch(string prefixText, int count)
        {
            BLLSAD objSadAutoSearch = new BLLSAD();
            Int32 unit = Convert.ToInt32("2".ToString());
          

            return objSadAutoSearch.GetProductName(unit.ToString(), prefixText);

        }
        [WebMethod]
        public static List<string> GetAutoCompleteData(string strSearchKey)
        {
            BLLSAD objAutoSearch_BLL = new BLLSAD();
            List<string> result = new List<string>();
            if (strSearchKey.Trim().Length >= 3)
            { result = objAutoSearch_BLL.AutoSearchCustomers(strSearchKey); }
            return result;

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (txtSearchCustomer.Text != "")
            {
                char[] delimiterChars = { ';' };
                string value = (txtSearchCustomer.Text.ToString());
                string[] data = value.Split(delimiterChars);
                Custid = int.Parse(data[1].ToString());
                depotname = "";
                depotid = int.Parse(ddlDepot.SelectedValue);
                enroll = 1;
                msg = objSad.getPendingUpdate(Custid, depotname, pendingmote, depotid);
                ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('" + msg + "');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('Please Select Customer Name!');", true);

            }
        }

    }
}