using BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using UI.Scripts.WebForms.Customize;

namespace UI.Others
{
    public partial class TADAInfoUpdate : System.Web.UI.Page
    {
        #region ####### Global variable ######
        DataTable dt = new DataTable(); BLL.BLLSAD bll = new BLLSAD();

        int enr, actionby, id, unitid, coaid;
        char[] delimiterChars = { '[', ']' }; string[] arrayKey;
        decimal petrolcost = 0; decimal octencost = 0; decimal cngcost = 0; decimal lubriantcost = 0;
        decimal busfare = 0; decimal Rickfare = 0; decimal cngfare = 0; decimal trainfare = 0; decimal airplance = 0; decimal othervhfare = 0;
        decimal mntcost = 0; decimal ferrytol = 0;

        decimal ownda = 0; decimal driverda = 0; decimal ownhotel = 0; decimal driverhotel = 0;
        decimal photocopy = 0; decimal courier = 0; decimal othercost = 0; decimal totalcost = 0;
        int RowIndex;
        string filePathForXML; string alermessageUpdate;
        string xmlString = "";
     
        
        int intTSOEnroll; DateTime dtForm; decimal StartMilage, EndMilage, ConsumedKM; string strRemarks;
        decimal QntPetrol, CostPetrol, QntOcten, CostOcten, QntCarBonNitr, CostCarbonNit, QntLubricant, CostLubricant, BusFareTaka, RickFare, CNGFare, OtherVhFare
            , MntCost, FerryTol, OwnDA, OtherDA, OwnHotel, DriverHotel, Photocopy, Courier, OtherCost, RowTotal;
        int paymentType; int updatecngCreditsupplier1ID; decimal cngCredit1Amount; string cngCredit1Name; int updatecngCredits2id; decimal cngCredit2Amount; string cngCredit2Name; int updateoilCreditsupplier3ID; decimal OilCreditAmount;
        string oilCreditStationName; decimal PersonalMilaqnt, PersonalRate, PersonMlgTotal; int updateby;

        string message, strSearckey, supcoid, supname;
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
                    //ClearControls();
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
        private void LoadReport()
        {
            try
            {
                DateTime dtFromDate = BLLGlobal.GetDateAtSQLDateFormat(txtBnkVoucherDate.Text).Value;
                int intTSOEnroll = int.Parse(HttpContext.Current.Session[SessionParams.Enroll].ToString());
                int unit = 0;
                dt = bll.GetTADABillInfo(dtFromDate, enr, unit);

                if (dt.Rows.Count > 0)
                {

                    grdvForUpdateTADABikeCarUser.DataSource = dt;
                    grdvForUpdateTADABikeCarUser.DataBind();

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
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            
        }

        protected void grdvForUpdateTADABikeCarUser_RowDataBound(object sender, GridViewRowEventArgs e)
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
        protected void btnShow_Click(object sender, EventArgs e)
        {
            LoadReport();
        }


        protected void btnUpdateinf_Click(object sender, EventArgs e)
        {
            char[] delimiterChars = { ',' };
            string temp = ((Button)sender).CommandArgument.ToString();
            string[] searchKey = temp.Split(delimiterChars);
            string intRowSl = searchKey[0].ToString();
            int rowsl = int.Parse(intRowSl);
            string intPKIDtbl = searchKey[1].ToString();
            int intID = int.Parse(intPKIDtbl);
            intTSOEnroll = enr;
            //intTSOEnroll = int.Parse(HttpContext.Current.Session[SessionParams.USER_ID].ToString());
            int totalCount = grdvForUpdateTADABikeCarUser.Rows.Cast<GridViewRow>()
                 .Count(r => ((CheckBox)r.FindControl("chkbx")).Checked);
            if (totalCount > 0)
            {
                if (totalCount < 2)
                {
                    for (int rowIndex = 0; rowIndex < grdvForUpdateTADABikeCarUser.Rows.Count; rowIndex++)
                    {
                        bool ysnChecked = ((CheckBox)grdvForUpdateTADABikeCarUser.Rows[rowIndex].Cells[0].Controls[0]).Checked;
                        if (ysnChecked)
                        {
                            try
                            {

                                TextBox txtintid = (TextBox)grdvForUpdateTADABikeCarUser.Rows[rowIndex].Cells[1].FindControl("txtPkID");
                                TextBox txtdteFromdateNoBikeDet = (TextBox)grdvForUpdateTADABikeCarUser.Rows[rowIndex].Cells[2].FindControl("dteFromdateNoBikeDet");
                                TextBox txtstrNameT = (TextBox)grdvForUpdateTADABikeCarUser.Rows[rowIndex].Cells[3].FindControl("strNamNoBikeDet");
                                TextBox txtdecStartMilageT = (TextBox)grdvForUpdateTADABikeCarUser.Rows[rowIndex].Cells[4].FindControl("txtdecStartMilageT");
                                TextBox txtdecEndMilageT = (TextBox)grdvForUpdateTADABikeCarUser.Rows[rowIndex].Cells[5].FindControl("txtdecEndMilageT");
                                TextBox txtdecConsumedKmT = (TextBox)grdvForUpdateTADABikeCarUser.Rows[rowIndex].Cells[6].FindControl("txtdecConsumedKmT");
                                TextBox txtstrSupportingNoT = (TextBox)grdvForUpdateTADABikeCarUser.Rows[rowIndex].Cells[7].FindControl("txtstrSupportingNoT");
                                TextBox txtdecQntPetrolT = (TextBox)grdvForUpdateTADABikeCarUser.Rows[rowIndex].Cells[8].FindControl("txtdecQntPetrolT");
                                TextBox txtdecCostPetrolT = (TextBox)grdvForUpdateTADABikeCarUser.Rows[rowIndex].Cells[9].FindControl("txtdecCostPetrolT");
                                TextBox txtdecQntOctenT = (TextBox)grdvForUpdateTADABikeCarUser.Rows[rowIndex].Cells[10].FindControl("txtdecQntOctenT");
                                TextBox txtdecCostOctenT = (TextBox)grdvForUpdateTADABikeCarUser.Rows[rowIndex].Cells[11].FindControl("txtdecCostOctenT");
                                TextBox txtdecQntCarbonNitGasT = (TextBox)grdvForUpdateTADABikeCarUser.Rows[rowIndex].Cells[12].FindControl("txtdecQntCarbonNitGasT");
                                TextBox txtdecCostCarbonNitGasT = (TextBox)grdvForUpdateTADABikeCarUser.Rows[rowIndex].Cells[13].FindControl("txtdecCostCarbonNitGasT");
                                TextBox txtdecQntLubricant = (TextBox)grdvForUpdateTADABikeCarUser.Rows[rowIndex].Cells[14].FindControl("txtdecQntLubricant");
                                TextBox txtlubricantcost = (TextBox)grdvForUpdateTADABikeCarUser.Rows[rowIndex].Cells[15].FindControl("txtlubricantcost");
                                TextBox txtdecFareBusAmountT = (TextBox)grdvForUpdateTADABikeCarUser.Rows[rowIndex].Cells[16].FindControl("txtdecFareBusAmountT");
                                TextBox txtdecFareRickshawAmountT = (TextBox)grdvForUpdateTADABikeCarUser.Rows[rowIndex].Cells[17].FindControl("txtdecFareRickshawAmountT");
                                TextBox txtdecFareCNGAmountT = (TextBox)grdvForUpdateTADABikeCarUser.Rows[rowIndex].Cells[18].FindControl("txtdecFareCNGAmountT");

                                TextBox txtdecFareTrainAmountT = (TextBox)grdvForUpdateTADABikeCarUser.Rows[rowIndex].Cells[19].FindControl("txtdecFareTrainAmountT");

                                TextBox txtdecFareAirPlaneT = (TextBox)grdvForUpdateTADABikeCarUser.Rows[rowIndex].Cells[20].FindControl("txtdecFareTrainAmountT");

                                TextBox txtdecFareOtherVheicleAmountT = (TextBox)grdvForUpdateTADABikeCarUser.Rows[rowIndex].Cells[21].FindControl("txtdecFareOtherVheicleAmountT");
                                TextBox txtdecCostAmountMaintenaceT = (TextBox)grdvForUpdateTADABikeCarUser.Rows[rowIndex].Cells[22].FindControl("txtdecCostAmountMaintenaceT");
                                TextBox txtdecFeryTollCostT = (TextBox)grdvForUpdateTADABikeCarUser.Rows[rowIndex].Cells[23].FindControl("txtdecFeryTollCostT");
                                TextBox txtdecDAAmountT = (TextBox)grdvForUpdateTADABikeCarUser.Rows[rowIndex].Cells[24].FindControl("txtdecDAAmountT");
                                TextBox txtdecDriverDACostT = (TextBox)grdvForUpdateTADABikeCarUser.Rows[rowIndex].Cells[25].FindControl("txtdecDriverDACostT");
                                TextBox txtdecHotelBillAmountT = (TextBox)grdvForUpdateTADABikeCarUser.Rows[rowIndex].Cells[26].FindControl("txtdecHotelBillAmountT");
                                TextBox txtdecDriverHotelBillAmountT = (TextBox)grdvForUpdateTADABikeCarUser.Rows[rowIndex].Cells[27].FindControl("txtdecDriverHotelBillAmountT");
                                TextBox txtdecPhotoCopyCostT = (TextBox)grdvForUpdateTADABikeCarUser.Rows[rowIndex].Cells[28].FindControl("txtdecPhotoCopyCostT");
                                TextBox txtdecCourierCostT = (TextBox)grdvForUpdateTADABikeCarUser.Rows[rowIndex].Cells[29].FindControl("txtdecCourierCostT");
                                TextBox txtdecOtherBillAmountT = (TextBox)grdvForUpdateTADABikeCarUser.Rows[rowIndex].Cells[30].FindControl("txtdecOtherBillAmountT");
                                TextBox txtdecRowTotalT = (TextBox)grdvForUpdateTADABikeCarUser.Rows[rowIndex].Cells[31].FindControl("txtdecRowTotalT");
                                TextBox txtSl = (TextBox)grdvForUpdateTADABikeCarUser.Rows[rowIndex].Cells[32].FindControl("txtRowSl");
                                TextBox txtdecCNGCredit1Amount = (TextBox)grdvForUpdateTADABikeCarUser.Rows[rowIndex].Cells[33].FindControl("txtdecSupplierCNG");
                                string txtstrCreditSupplier1nAME = ((DropDownList)grdvForUpdateTADABikeCarUser.Rows[rowIndex].Cells[34].FindControl("ddlCreditFuelStation1List")).SelectedItem.Text.ToString();
                                string updatecngCreditsupplierONEID = ((DropDownList)grdvForUpdateTADABikeCarUser.Rows[rowIndex].Cells[35].FindControl("ddlCreditFuelStation1List")).SelectedValue.ToString();
                                TextBox txtdecCNGCredit2Amount = (TextBox)grdvForUpdateTADABikeCarUser.Rows[rowIndex].Cells[36].FindControl("txtCNGCredit2AMNT");
                                string txtstrCreditSupplier2nAME = ((DropDownList)grdvForUpdateTADABikeCarUser.Rows[rowIndex].Cells[37].FindControl("ddlCreditFuelStation2List")).SelectedItem.Text.ToString();
                                string updatecngCreditsupplierTWOID = ((DropDownList)grdvForUpdateTADABikeCarUser.Rows[rowIndex].Cells[38].FindControl("ddlCreditFuelStation2List")).SelectedValue.ToString();
                                TextBox txtdecOilCreditAmount = (TextBox)grdvForUpdateTADABikeCarUser.Rows[rowIndex].Cells[39].FindControl("txtOilCreditAmnt");
                                string txtdecOilCreditStation = ((DropDownList)grdvForUpdateTADABikeCarUser.Rows[rowIndex].Cells[40].FindControl("ddlCreditFuelStation3List")).SelectedItem.Text.ToString();
                                string updateOilCreditsupplier3ID = ((DropDownList)grdvForUpdateTADABikeCarUser.Rows[rowIndex].Cells[41].FindControl("ddlCreditFuelStation3List")).SelectedValue.ToString();
                                TextBox txtdecPersonalMilage = (TextBox)grdvForUpdateTADABikeCarUser.Rows[rowIndex].Cells[42].FindControl("txtdecPersonalMilage");
                                TextBox txtdecMlgRate = (TextBox)grdvForUpdateTADABikeCarUser.Rows[rowIndex].Cells[43].FindControl("txtdecMlgRate");
                                TextBox txtdecPersonalTotalcost = (TextBox)grdvForUpdateTADABikeCarUser.Rows[rowIndex].Cells[44].FindControl("txtdecPersonalTotalcost");
                                
                                string strBillDate = txtdteFromdateNoBikeDet.Text;
                                dtForm = DateTime.Parse(strBillDate.ToString());
                                StartMilage = decimal.Parse(txtdecStartMilageT.Text);
                                EndMilage = decimal.Parse(txtdecEndMilageT.Text);
                                ConsumedKM = decimal.Parse(txtdecConsumedKmT.Text);
                                strRemarks = txtstrSupportingNoT.Text;
                                QntPetrol = decimal.Parse(txtdecQntPetrolT.Text);
                                CostPetrol = decimal.Parse(txtdecCostPetrolT.Text);
                                QntOcten = decimal.Parse(txtdecQntOctenT.Text);
                                CostOcten = decimal.Parse(txtdecCostOctenT.Text);
                                QntCarBonNitr = decimal.Parse(txtdecQntCarbonNitGasT.Text);
                                CostCarbonNit = decimal.Parse(txtdecCostCarbonNitGasT.Text);
                                QntLubricant = decimal.Parse(txtdecQntLubricant.Text);
                                CostLubricant = decimal.Parse(txtlubricantcost.Text);
                                BusFareTaka = decimal.Parse(txtdecFareBusAmountT.Text);
                                RickFare = decimal.Parse(txtdecFareRickshawAmountT.Text);
                                CNGFare = decimal.Parse(txtdecFareCNGAmountT.Text);
                                trainfare = decimal.Parse(txtdecFareTrainAmountT.Text);
                                airplance = decimal.Parse(txtdecFareAirPlaneT.Text);
                                OtherVhFare = decimal.Parse(txtdecFareOtherVheicleAmountT.Text);
                                MntCost = decimal.Parse(txtdecCostAmountMaintenaceT.Text);
                                FerryTol = decimal.Parse(txtdecFeryTollCostT.Text);
                                OwnDA = decimal.Parse(txtdecDAAmountT.Text);
                                OtherDA = decimal.Parse(txtdecDriverDACostT.Text);
                                OwnHotel = decimal.Parse(txtdecHotelBillAmountT.Text);
                                DriverHotel = decimal.Parse(txtdecDriverHotelBillAmountT.Text);
                                Photocopy = decimal.Parse(txtdecPhotoCopyCostT.Text);
                                Courier = decimal.Parse(txtdecCourierCostT.Text);
                                OtherCost = decimal.Parse(txtdecOtherBillAmountT.Text);
                                RowTotal = decimal.Parse(txtdecRowTotalT.Text);
                                paymentType = int.Parse("0");
                                cngCredit1Amount = decimal.Parse(txtdecCNGCredit1Amount.Text);
                                cngCredit1Name = txtstrCreditSupplier1nAME;
                                updatecngCreditsupplier1ID = int.Parse(updatecngCreditsupplierONEID.ToString());
                                cngCredit2Amount = decimal.Parse(txtdecCNGCredit2Amount.Text);
                                cngCredit2Name = txtstrCreditSupplier2nAME;
                                updatecngCredits2id = int.Parse(updatecngCreditsupplierTWOID.ToString());
                                OilCreditAmount = decimal.Parse(txtdecOilCreditAmount.Text);

                                oilCreditStationName = txtdecOilCreditStation;
                                updateoilCreditsupplier3ID = int.Parse(updateOilCreditsupplier3ID.ToString());

                                PersonalMilaqnt = decimal.Parse(txtdecPersonalMilage.Text);
                                PersonalRate = decimal.Parse(txtdecMlgRate.Text);
                                PersonMlgTotal = decimal.Parse(txtdecPersonalTotalcost.Text);

                                updateby = int.Parse(HttpContext.Current.Session[SessionParams.Enroll].ToString());

                                alermessageUpdate = bll.updateRemoteTADAInfo(intID, intTSOEnroll, dtForm, StartMilage, EndMilage, ConsumedKM, strRemarks, QntPetrol
                                 , CostPetrol, QntOcten, CostOcten, QntCarBonNitr, CostCarbonNit, QntLubricant, CostLubricant, BusFareTaka, RickFare, CNGFare, trainfare, airplance, OtherVhFare
                                 , MntCost, FerryTol, OwnDA, OtherDA, OwnHotel, DriverHotel, Photocopy, Courier, OtherCost, RowTotal, rowsl, paymentType
                                 , updatecngCreditsupplier1ID, cngCredit1Amount, cngCredit1Name, updatecngCredits2id, cngCredit2Amount, cngCredit2Name, updateoilCreditsupplier3ID, OilCreditAmount, oilCreditStationName
                                 , PersonalMilaqnt, PersonalRate, PersonMlgTotal, updateby);
                           
                                LoadReport();
                                break;


                            }


                            catch
                            {

                            }
                        }

                    }
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Successfully update your information ');", true);
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
            result = bll.AutoSearchTADAEmploye( strSearchKey);
            return result;
        }
    }
}