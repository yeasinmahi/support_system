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

namespace UI.Sad
{
    public partial class TransportSupplierTagging : System.Web.UI.Page
    {

        #region ####### Global variable ######
        DataTable dt = new DataTable(); BLLSAD bll = new BLLSAD();
    
        int type, actionby, id, unitid,coaid;
        char[] delimiterChars = { '[', ']' }; string[] arrayKey; string message, strSearckey,supcoid,supname;
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    txtSupplier.Attributes.Add("onkeyUp", "SearchText();");
                    //txtSupplier.Attributes.Add("onkeyUp", "SearchText();");
                    //hdnunit.Value = HttpContext.Current.Session[SessionParams.Unitid].ToString();
                    hdnunit.Value = "4";
                    //hdnsearch.Value = HttpContext.Current.Session[SessionParams.Unitid].ToString();
                }
                catch { }
            }
        }


        #region ####### Insert event ######
        protected void btnShow_Click(object sender, EventArgs e)
        {

        }




        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (hdnconfirm.Value == "1")
            {
                try
                {
                strSearckey = txtSupplier.Text;
                arrayKey = strSearckey.Split(delimiterChars);
                supcoid = arrayKey[1].ToString();
                coaid = Convert.ToInt32(supcoid);
                unitid = int.Parse(ddlUnitName.SelectedValue.ToString());
                supname = arrayKey[0].ToString();
                type = 1;
                 actionby =int.Parse( HttpContext.Current.Session[SessionParams.Enroll].ToString());
                dt = bll.insertsupplierinfo(unitid, supname, coaid, type, actionby);
                ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('" + dt.Rows[0]["Messages"].ToString() + "');", true);
                }
                catch {  }


            }
        }






        #endregion



        [WebMethod]
        
        public static List<string> GetAutoCompleteData(string strSearchKey)
        {

            BLLSAD bll = new BLLSAD();
            List<string> result = new List<string>();
            result = bll.AutoSearchSupplier(
            int.Parse(HttpContext.Current.Session[SessionParams.Unitid].ToString()),  strSearchKey);
            return result;
        }



    }
}