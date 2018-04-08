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
    public partial class OrderChange : System.Web.UI.Page
    {
        BLLSAD objSad = new BLLSAD();
        DataTable dt;
        decimal Price,qty;string msg;
        int Unitid,Itemid,Custid,geoid,depotid, enroll;
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
                GetItemList();

            }
        }

        private void GetItemList()
        {
            dt = objSad.getItem(int.Parse(ddlLine.SelectedValue));
            if (dt.Rows.Count > 0)
            {
                ddlItem.DataTextField = "strFullName";
                ddlItem.DataValueField = "intItemID";
                ddlItem.DataSource = dt;
                ddlItem.DataBind();
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
            if ((txtqty.Text != "")&&(txtSearchCustomer.Text!=""))
            {
               
                char[] delimiterChars = { ';' };

                string value = (ddlItem.SelectedValue.ToString());
                string[] data = value.Split(delimiterChars);
                Custid = int.Parse(data[0].ToString());
                Itemid = int.Parse(hdnProduct.Value);
                Price = decimal.Parse(hdnPrice.Value);
                depotid = int.Parse(ddlDepot.SelectedValue.ToString());
                dt = objSad.getGeoidincustomers(Custid);
                geoid = int.Parse(dt.Rows[0]["intGeoID"].ToString());
                Unitid = 2;
                qty = decimal.Parse(txtqty.Text);

                enroll = 1;
                msg = objSad.getinsertorder(Unitid, Custid, depotid, Itemid, qty, Price, qty * Price, enroll, geoid);
                ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('" + msg + "');", true);

            }
            else
            {
                ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('Please Select Customer Name or Qty !');", true);

            }
        }

        protected void ddlLine_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetItemList();
        }

        protected void ddlItem_SelectedIndexChanged(object sender, EventArgs e)
        {
            char[] delimiterChars = { ',' };

            string value = (ddlItem.SelectedValue.ToString());
            string[] data = value.Split(delimiterChars);

            hdnProduct.Value =(data[0].ToString());
            hdnPrice.Value =(data[1].ToString());

           


        }
    }
}