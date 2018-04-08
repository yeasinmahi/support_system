using DAL.DALSADTableAdapters;
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;

namespace BLL
{
    public class BLLSAD
    {
        public DataTable getUnitNamebyEnrol(int Enrol)
        {
            try
            {

                SprUnitListForSeparationTableAdapter bll = new SprUnitListForSeparationTableAdapter();
                return bll.GetData(Enrol);
            }
            catch
            {
                return new DataTable();
            }
        }


        //public List<string> AutoSearchSupplier(int Unitid, int emplid, string strSearchKey)
        //{
        //    List<string> result = new List<string>();
        //    SprSupplierSearchingTableAdapter bll = new SprSupplierSearchingTableAdapter();
        //    DataTable oDT = new DataTable();
        //    oDT = bll.GetDataSupplierSearching(Unitid, emplid, strSearchKey);
        //    if (oDT.Rows.Count > 0)
        //    {
        //        for (int index = 0; index < oDT.Rows.Count; index++)
        //        {
        //            result.Add(oDT.Rows[index]["Column1"].ToString());
        //        }

        //    }
        //    return result;
        //}

        //public DataTable GetSearchAccount(int Unitid, int emplid, string strSearchKey)
        //{
        //    SprSupplierSearchingTableAdapter adp = new SprSupplierSearchingTableAdapter();
        //    try { return adp.GetDataSupplierSearching(Unitid, emplid, strSearchKey); }
        //    catch { return new DataTable(); }
        //}


        public DataTable GetSearchAccount(int unit, string searchkey)
        {
            SprSupplierSearchingTableAdapter adp = new SprSupplierSearchingTableAdapter();
            try { return adp.GetDataSupplierSearching(unit, searchkey); }
            catch { return new DataTable(); }
        }
        public DataTable insertsupplierinfo(int unit, string name, int coa, int rptype, int insertby)
        {
            try
            {
                SprTransportSupplierDetaillsTableAdapter bll = new SprTransportSupplierDetaillsTableAdapter();
                return bll.GetData(unit, name, coa, rptype, insertby);
            }
            catch
            {
                return new DataTable();
            }
        }

        public DataTable GetTADABillInfo(DateTime fromdate, int enrol, int unit)
        {
            try
            {
                SprTADAInfoUpdateTableAdapter bll = new SprTADAInfoUpdateTableAdapter();
                return bll.GetData(fromdate, enrol, unit);
            }
            catch
            {
                return new DataTable();
            }
        }


        public DataTable GetEmployeeProfileByEnrol(int enrol)
        {
            try
            {
                SprEmployeeSearchByEnrolTableAdapter objProfbyenrol = new SprEmployeeSearchByEnrolTableAdapter();
                return objProfbyenrol.GetDataUserInfo(enrol);
            }
            catch { return new DataTable(); }
        }
        public DataTable getTADAFuelStationlistforUpdate(int unit)
        {
            try
            {
                TblRemoteTADAFuelStationListTableAdapter bll = new TblRemoteTADAFuelStationListTableAdapter();
                return bll.GetData(unit);

            }
            catch { return new DataTable(); }
        }


            public string updateRemoteTADAInfo(int intId, int intEnrol,
            DateTime dtForm, decimal StartMilage, decimal EndMilage, decimal ConsumedKM, string strRemarks,
            decimal QntPetrol, decimal CostPetrol, decimal QntOcten, decimal CostOcten, decimal QntCarBonNitr
            , decimal CostCarbonNit, decimal QntLubricant, decimal CostLubricant, decimal BusFareTaka,
            decimal RickFare, decimal CNGFare, decimal train, decimal air, decimal OtherVhFare, decimal MntCost, decimal FerryTol, decimal OwnDA
            , decimal OtherDA, decimal OwnHotel, decimal DriverHotel, decimal Photocopy, decimal Courier, decimal OtherCost, decimal RowTotal, decimal intRowsl, int paymenttype
            , int intCNGCredit1Stationid, decimal cngcredit1Amount, string cngcredit1stationname, int intCNGCredit2Stationid, decimal cngcredit2Amount, string cngcredit2stationname
            , int oilCreditStationid, decimal oilCreditAmount, string oilCreditstationname
            , decimal personalMilageuseQnt, decimal personalUseMilagRate, decimal personalUseTotalCOST, int intUpdatBy)
{

            SprTADAInfoCorrectionBeforApproveTableAdapter bll = new SprTADAInfoCorrectionBeforApproveTableAdapter();
            string rtnMessage = "";
            try
            {
                bll.UpdateTADAInfo(intId, intEnrol, dtForm, StartMilage, EndMilage, ConsumedKM, strRemarks,
                QntPetrol, CostPetrol, QntOcten, CostOcten, QntCarBonNitr
                , CostCarbonNit, QntLubricant, CostLubricant, BusFareTaka,
                RickFare, CNGFare, train, air, OtherVhFare, MntCost, FerryTol, OwnDA
                , OtherDA, OwnHotel, DriverHotel, Photocopy, Courier, OtherCost, RowTotal, intRowsl, paymenttype
                , intCNGCredit1Stationid, cngcredit1Amount, cngcredit1stationname, intCNGCredit2Stationid, cngcredit2Amount, cngcredit2stationname,
                oilCreditStationid, oilCreditAmount, oilCreditstationname
                , personalMilageuseQnt, personalUseMilagRate, personalUseTotalCOST, intUpdatBy, ref rtnMessage);

            }
            catch (Exception ex) { rtnMessage = ex.ToString(); }
            {
                return rtnMessage;
            }

        }


        public DataTable getDataforTADAInfoDelete(DateTime dtefromdate, int emplid, int ApproveStatus, int intPkid, int intInactiveby)
        {
            try
            {
                SprTADAInfoDeleteTableAdapter bll = new SprTADAInfoDeleteTableAdapter();
                return bll.GetDataTADAInfoDelete(dtefromdate, emplid, ApproveStatus, intPkid, intInactiveby);
            }
            catch { return new DataTable(); }
        }

        public DataTable GetTADAInactiveBillInfo(DateTime fromdate, int enrol, int unit, int actinactivestatus)
        {
            try
            {
                SprTADAAlradyInactiveBillTableAdapter bll = new SprTADAAlradyInactiveBillTableAdapter();
                return bll.GetDataTADAAlradyInactiveBill(fromdate, enrol, unit, actinactivestatus);
            }
            catch
            {
                return new DataTable();
            }
        }

        public DataTable GetHallRoomBookingStatus(int bookingentryid, int entrytype, int actionby)
        {
            try
            {
                SprHallRoomBookingCancelAfterAprvTableAdapter objProfbyenrol = new SprHallRoomBookingCancelAfterAprvTableAdapter();
                return objProfbyenrol.GetDataHallRoomBookingCancelAfterAprv(bookingentryid, entrytype, actionby);
            }
            catch { return new DataTable(); }
        }

        public List<string> AutoSearchTADAEmploye(string strSearchKey)
        {
            List<string> result = new List<string>();
            SprTADAEmplsearchTableAdapter bll = new SprTADAEmplsearchTableAdapter();
            DataTable oDT = new DataTable();
            oDT = bll.GetDataTADAEmplsearch(strSearchKey);
            if (oDT.Rows.Count > 0)
            {
                for (int index = 0; index < oDT.Rows.Count; index++)
                {
                    result.Add(oDT.Rows[index]["strname"].ToString());
                }

            }
            return result;
        }
        public List<string> AutoSearchSupplier(int unitid, string strSearchKey)
        {
            List<string> result = new List<string>();
            SprSupplierSearchingTableAdapter bll = new SprSupplierSearchingTableAdapter();
            DataTable oDT = new DataTable();
            oDT = bll.GetDataSupplierSearching(unitid,strSearchKey);
            if (oDT.Rows.Count > 0)
            {
                for (int index = 0; index < oDT.Rows.Count; index++)
                {
                    result.Add(oDT.Rows[index]["SearchResult"].ToString());
                }

            }
            return result;
        }
        public DataTable getShipPoints(int unitid)
        {
            try
            {
                tblShippingPointTableAdapter Shipoint = new tblShippingPointTableAdapter();
                return Shipoint.GetShippoint(unitid);
            }
            catch { return new DataTable(); }
        }

        public DataTable getItem(int v)
        {
            try
            {
                tblItemFGConfigTableAdapter getItemfg = new tblItemFGConfigTableAdapter();
                return getItemfg.GetItem(v);
            }
            catch { return new DataTable(); }
        }

        public string getUnfounorderdelete(int custid)
        {
            string msg = "";
            try
            {
                tblUnfoundOrderTableAdapter getUnfoundorder = new tblUnfoundOrderTableAdapter();
                getUnfoundorder.GetUnFoundOrder(custid);
                getUnfoundorder.GetUnfoundorderApproed(custid);
                msg = "Successfully";
            }
            catch (Exception e) { msg = e.ToString(); }
            return msg;
        }

        public DataTable getCustomerShow(int custid)
        {
            try
            {
                tblRemoteRelationCnJTableAdapter getCJBShow = new tblRemoteRelationCnJTableAdapter();
                return getCJBShow.GetJobStationBycustomer(custid);
            }
            catch { return new DataTable(); }
        }

        public string[] GetProductName(string v, string prefixText)
        {
            throw new NotImplementedException();
        }

        public DataTable getPromotionShow(int custid, int itemid)
        {
            try
            {
                tblPromotionTableAdapter getFree = new tblPromotionTableAdapter();
                return getFree.GetFreePromotion(custid, itemid);
            }
            catch { return new DataTable(); }
        }

        public DataTable getACLCHallanshow(string ACLChallanNo)
        {
            try
            {
                tblSalesEntryTableAdapter getAclChallan = new tblSalesEntryTableAdapter();
                return getAclChallan.GetDITChallan(ACLChallanNo);
            }
            catch { return new DataTable(); }
        }

        public string getCreateChallan(string dtichallan, int unitid)
        {
            string msg = "";
            try
            {
                sprACLNewChllanCreateTableAdapter getNewchallanACL = new sprACLNewChllanCreateTableAdapter();
                getNewchallanACL.GetACLNewChallanCreate(dtichallan, unitid);
                msg = "Successfully";
            }
            catch (Exception e) { msg = e.ToString(); }
            return msg;
        }

        public string getACRLUser(int enroll, string email, string types, int unitid, string fPass, int insertby, int intgid)
        {
            string msg = "";
            try
            {
                tblLoginUserTableAdapter getuserlogin = new tblLoginUserTableAdapter();
                getuserlogin.GetPermissioninsert(enroll, email, types, unitid, fPass, insertby);
                tblUserTableAdapter getuser = new tblUserTableAdapter();
                getuser.GetUser(enroll, intgid);
                tblUserGroupTableAdapter insertusergroup = new tblUserGroupTableAdapter();
                insertusergroup.Getusergroupinsert(enroll, intgid.ToString());
                msg = "Successfully";

            }
            catch (Exception e) { msg = e.ToString(); }
            return msg;
        }

        public string getACLPurchesVoucherCreate(int unitid, DateTime dtetdate)
        {
            string msg = "";
            try
            {
                sprACLPurchaseTableAdapter getAclVoucherCreate = new sprACLPurchaseTableAdapter();
                getAclVoucherCreate.GetACLPurches(unitid, dtetdate);
                msg = "Successfully";
            }
            catch (Exception e) { msg = e.ToString(); }
            return msg;
        }

        public DataTable getunit()
        {
            try
            {
                tblUnitTableAdapter unitlist = new tblUnitTableAdapter();
                return unitlist.GetUnit();
            }
            catch { return new DataTable(); }
        }

        public string getUserPermission(int id)
        {
            string msg = "";
            try
            {
                tblEmployeeProfileTransferPromotionTableAdapter getPermission = new tblEmployeeProfileTransferPromotionTableAdapter();
                getPermission.GetUpdatePermission(id);
                msg = "Successfully";
            }
            catch (Exception e) { msg = e.ToString(); }
            return msg;
        }

        public string getCNJ(int custid)
        {
            string msg = "";
            try
            {
                tblRemoteRelationCnJDeleteTableAdapter getCustomerNJdelete = new tblRemoteRelationCnJDeleteTableAdapter();
                getCustomerNJdelete.GetCNJDelete(custid);
                msg = "Successfully";
            }
            catch (Exception e) { msg = e.ToString(); }
            return msg;
        }

        public DataTable getRegion()
        {
            try
            {
                qryAFBLNewSetupTableAdapter getRegionlist = new qryAFBLNewSetupTableAdapter();
                return getRegionlist.GetRegion();
            }
            catch { return new DataTable(); }
        }

        public List<string> AutoSearchCustomers(string strSearchKey)
        {
            List<string> result = new List<string>();
            tblCustomerAutoSeracharTableAdapter CustSearch = new tblCustomerAutoSeracharTableAdapter();
            // SpareDataTable1TableAdapter SpareItemList = new SpareDataTable1TableAdapter();
            DataTable oDTs = new DataTable();
            oDTs = CustSearch.GetCustomerList(strSearchKey);
            if (oDTs.Rows.Count > 0)
            {
                for (int index = 0; index < oDTs.Rows.Count; index++)
                {
                    result.Add(oDTs.Rows[index]["StrCustomer"].ToString());
                }

            }
            return result;
        }

        public DataTable getEmployeeResult(int empid, int levelid)
        {
            try
            {
                if (levelid == 1)
                {
                    tblTransferPromotionTableAdapter empPermission = new tblTransferPromotionTableAdapter();
                    return empPermission.GetRegionEmp(empid);
                }
                else if (levelid == 2)
                {
                    tblTransferPromotionTableAdapter empPermission = new tblTransferPromotionTableAdapter();
                    return empPermission.GetAreaEmp(empid);
                }
                else if (levelid == 3)
                {
                    tblTransferPromotionTableAdapter empPermission = new tblTransferPromotionTableAdapter();
                    return empPermission.GetTerritoryEmp(empid);
                }
                else if (levelid == 4)
                {
                    tblTransferPromotionTableAdapter empPermission = new tblTransferPromotionTableAdapter();
                    return empPermission.GetTerritoryEmp(empid);
                }
                else
                {
                    tblTransferPromotionTableAdapter empPermission = new tblTransferPromotionTableAdapter();
                    return empPermission.GetTerritoryEmp(empid);
                }
            }
            catch { return new DataTable(); }
        }


        public string getItemPromotion(int id)
        {
            string msg = "";
            try
            {
                tblSalesPromotionCustomerTableAdapter getItemPromotionItem = new tblSalesPromotionCustomerTableAdapter();
                getItemPromotionItem.GetPromotionCancel(id);
                msg = "Successfully";
            }
            catch (Exception e) { msg = e.ToString(); }
            return msg;
        }
        public void getItemPromotionR(int id)
        {

            try
            {
                tblSalesPromotionCustomerTableAdapter getItemPromotionItem = new tblSalesPromotionCustomerTableAdapter();
                getItemPromotionItem.GetPromotionCancel(id);

            }
            catch { }

        }

        public DataTable getPromotionShowRegion(int Regionid, DateTime dtefdate, DateTime dtetdate, int Lineid, int itemid)
        {
            try
            {
                tblPromotionRegionTableAdapter getRegion = new tblPromotionRegionTableAdapter();
                return getRegion.GetData(Regionid, dtefdate.ToString(), dtetdate.ToString(), Lineid, itemid);
            }
            catch { return new DataTable(); }
        }

        public DataTable getPromotionShowRegion(int custid, int itemid)
        {
            throw new NotImplementedException();
        }

        public DataTable GetPromotionCancel(int id)
        {
            throw new NotImplementedException();
        }

        public DataTable getGeoidincustomers(int custid)
        {
            try
            {
                tblGeoCustomerConfigTableAdapter getgeoid = new tblGeoCustomerConfigTableAdapter();
                return getgeoid.GetCustomerGeoid(custid);
            }
            catch { return new DataTable(); }
        }

        public string getinsertorder(int unitid, int custid, int depotid, int itemid, decimal oqty, decimal price, decimal v, int enroll, int geoid)
        {
            string msg = "";
            try
            {
                tblRemoteOrderApprovedTableAdapter Insertorder = new tblRemoteOrderApprovedTableAdapter();
                Insertorder.GetOrderInsert(unitid, custid, depotid, itemid, oqty, price, v, geoid);
                msg = "Successfully";
            }
            catch (Exception e) { msg = e.ToString(); }
            return msg;
        }

        public string getPendingUpdate(int custid, string depotname, int pendingmote, int depotid)
        {
            string msg = "";
            try
            {
                AFBLPendingAllCustomersTableAdapter getcustomerPendingUpdate = new AFBLPendingAllCustomersTableAdapter();
                getcustomerPendingUpdate.GetPendingUpdatesingleCustomer(custid, depotname, pendingmote, depotid);
                msg = "Successfully";
            }
            catch (Exception e) { msg = e.ToString(); }
            return msg;
        }
    }
}