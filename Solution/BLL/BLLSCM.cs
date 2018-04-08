using DAL.DALSCMTableAdapters;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace BLL
{
    public class BLLSCM
    {       
        public DataTable InsertUpdateSelectForItem(int intPart, int intWHID, string strItemName, string strDescription, string strPart, int intUOM, string strUOM, int intClusterID, string strCluster, int intCommodityID, string strCommodity, int intCategory, string strCategory,
        string strBrand, int intMinorCat, string strMinorCat, int intPlant, string strPlant, string strProcureType, int intItemType, string strItemType, int intInsertBy, int intLocationID, int intNewClusterID, int intNewCommodityID, int intNewCategoryID, string strNewCluster, string strNewCommodity, string strNewCategory,
        decimal numReOrderLevel, decimal numMinimumStock, decimal numMaximumStock, decimal numSafetyStock, string strABCClassification, string strFSNClassification, string strVDEClassification,
        string strHSCode, int intPOProcesingTime, int intSupplierDeliTime, int intProcesingTimeGR, string strSDEClassification, string strHMLClassification, string strGLCode)
        {
            SprItemAddAndApproveTableAdapter adp = new SprItemAddAndApproveTableAdapter();
            try
            { return adp.InsertUpdateSelectForItem(intPart, intWHID, strItemName, strDescription, strPart, intUOM, strUOM, intClusterID, strCluster, intCommodityID, strCommodity, intCategory, strCategory,
            strBrand, intMinorCat, strMinorCat, intPlant, strPlant, strProcureType, intItemType, strItemType, intInsertBy, intLocationID, intNewClusterID, intNewCommodityID, intNewCategoryID, strNewCluster, strNewCommodity, strNewCategory,
            numReOrderLevel, numMinimumStock, numMaximumStock, numSafetyStock, strABCClassification, strFSNClassification, strVDEClassification,
            strHSCode, intPOProcesingTime, intSupplierDeliTime, intProcesingTimeGR, strSDEClassification, strHMLClassification, strGLCode); }
            catch { return new DataTable(); }
        }
        public DataTable InsertWHPermission(int intPart, int intWHID, int intEnroll, bool ysnRequisition, bool ysnRequisitionApproval, bool ysnIndent, bool ysnIndentApproval, bool ysnPO, bool ysnPOApproval, bool ysnSU, bool ysnStoreUser, bool ysnDistribution, bool ysnProdPlanner)
        {
            SprWHTableAdapter adp = new SprWHTableAdapter();
            try
            { return adp.InsertWHPermission(intPart, intWHID, intEnroll, ysnRequisition, ysnRequisitionApproval, ysnIndent, ysnIndentApproval, ysnPO, ysnPOApproval, ysnSU, ysnStoreUser, ysnDistribution, ysnProdPlanner); }            
            catch (Exception ex) { ex.ToString(); return new DataTable(); }
        }
        public DataTable GetWHListByUnitid(int intUnitid)
        {
            TblWearHouseTableAdapter adp = new TblWearHouseTableAdapter();
            try
            { return adp.GetWHListByUnitid(intUnitid); }
            catch (Exception ex) { ex.ToString(); return new DataTable(); }
        }
        public DataTable GetPermissionList(int intEnroll, int intWHID)
        {
            TblWearHouseTableAdapter adp = new TblWearHouseTableAdapter();
            try
            { return adp.GetPermissionList(intEnroll, intWHID); }
            catch (Exception ex) { ex.ToString(); return new DataTable(); }
        }
        public DataTable GetUnitList()
        {
            TblWearHouseTableAdapter adp = new TblWearHouseTableAdapter();
            try
            { return adp.GetUnitList(); }
            catch (Exception ex) { ex.ToString(); return new DataTable(); }
        }
        public DataTable GetItemInfo()
        {
            TblWearHouseTableAdapter adp = new TblWearHouseTableAdapter();
            try
            { return adp.GetItemInfo(); }
            catch (Exception ex) { ex.ToString(); return new DataTable(); }
        }
        public DataTable GetLocationByWH(int intWHID)
        {
            TblWearHouseTableAdapter adp = new TblWearHouseTableAdapter();
            try
            { return adp.GetLocationByWH(intWHID); }
            catch (Exception ex) { ex.ToString(); return new DataTable(); }
        }
        public DataTable GetItemInfoForAFBL()
        {
            TblWearHouseTableAdapter adp = new TblWearHouseTableAdapter();
            try
            { return adp.GetItemInfoForAFBL(); }
            catch (Exception ex) { ex.ToString(); return new DataTable(); }
        }
        public DataTable GetItemInfoForPurchase()
        {
            TblWearHouseTableAdapter adp = new TblWearHouseTableAdapter();
            try
            { return adp.GetItemInfoForPurchase(); }
            catch (Exception ex) { ex.ToString(); return new DataTable(); }
        }
        public DataTable GetItemInfoForAccounts()
        {
            TblWearHouseTableAdapter adp = new TblWearHouseTableAdapter();
            try
            { return adp.GetItemInfoForAccounts(); }
            catch (Exception ex) { ex.ToString(); return new DataTable(); }
        }
        public DataTable IndentCorrection(int intPart, int intIndent, int intItemID, decimal numQty, string strIndentType)
        {
            SprIndentTableAdapter adp = new SprIndentTableAdapter();
            try
            { return adp.IndentCorrection(intPart, intIndent, intItemID, numQty, strIndentType); }
            catch (Exception ex) { ex.ToString(); return new DataTable(); }
        }
        public DataTable GetMRRNoByPO(int intPOID)
        {
            TblFactoryReceiveMRRTableAdapter adp = new TblFactoryReceiveMRRTableAdapter();
            try
            { return adp.GetMRRNoByPO(intPOID); }
            catch (Exception ex) { ex.ToString(); return new DataTable(); }
        }
        public DataTable GetSupplierInfoByPO(int intPOID)
        {
            TblFactoryReceiveMRRTableAdapter adp = new TblFactoryReceiveMRRTableAdapter();
            try
            { return adp.GetSupplierInfoByPO(intPOID); }
            catch (Exception ex) { ex.ToString(); return new DataTable(); }
        }
        public DataTable GetShipmentAndOtherInfoByPO(int intPOID)
        {
            TblFactoryReceiveMRRTableAdapter adp = new TblFactoryReceiveMRRTableAdapter();
            try
            { return adp.GetShipmentAndOtherInfoByPO(intPOID); }
            catch (Exception ex) { ex.ToString(); return new DataTable(); }
        }
        public DataTable GetCurrency()
        {
            TblFactoryReceiveMRRTableAdapter adp = new TblFactoryReceiveMRRTableAdapter();
            try
            { return adp.GetCurrency(); }
            catch (Exception ex) { ex.ToString(); return new DataTable(); }
        }
        public DataTable POCurrection(int intPart, int intPOID, DateTime dtePODate, int intCurrencyID, decimal monFreight, decimal monPacking, decimal monDiscount, int intShipment, string strDeliveryAddress, int ysnPartialShip,
        string strPayTerm, int intCreditDays, int intInstallmentNo, int intInstallmentInterval, int intWarrantyMonth, string strOtherTerms, DateTime dteLastShipmentDate, int intUpdateBy)
        {
            SprPOTableAdapter adp = new SprPOTableAdapter();
            try
            { return adp.POCurrection(intPart, intPOID, dtePODate, intCurrencyID, monFreight, monPacking, monDiscount, intShipment, strDeliveryAddress, ysnPartialShip,
            strPayTerm, intCreditDays, intInstallmentNo, intInstallmentInterval, intWarrantyMonth, strOtherTerms, dteLastShipmentDate, intUpdateBy); }
            catch (Exception ex) { ex.ToString(); return new DataTable(); }
        }
        public DataTable MRRDelete(int intPart, int intMRRID)
        {
            SprMRRTableAdapter adp = new SprMRRTableAdapter();
            try
            { return adp.MRRDelete(intPart, intMRRID); }
            catch (Exception ex) { ex.ToString(); return new DataTable(); }
        }
        public DataTable GetWHForWoodPurchase()
        {
            TblWearHouseTableAdapter adp = new TblWearHouseTableAdapter();
            try
            { return adp.GetWHForWoodPurchase(); }
            catch (Exception ex) { ex.ToString(); return new DataTable(); }
        }
        public DataTable GetTripDetails(int intPart, string strTripSLNo)
        {
            SprLogisticTableAdapter adp = new SprLogisticTableAdapter();
            try
            { return adp.GetTripDetails(intPart, strTripSLNo); }
            catch (Exception ex) { ex.ToString(); return new DataTable(); }
        }
        public DataTable TrustAppCurrection(int intPart, int intApplicationID, string strAccountNo)
        {
            SprTrustTableAdapter adp = new SprTrustTableAdapter();
            try
            { return adp.TrustAppCurrection(intPart, intApplicationID, strAccountNo); }
            catch (Exception ex) { ex.ToString(); return new DataTable(); }
        }
        public DataTable POADDForWood(int intPart, int intPOID)
        {
            SprWoodPurchaseTableAdapter adp = new SprWoodPurchaseTableAdapter();
            try
            { return adp.POADDForWood(intPart, intPOID); }
            catch (Exception ex) { ex.ToString(); return new DataTable(); }
        }
        public DataTable WastageStatement(int intPart, int intSalesID)
        {
            SprWastageStatementTableAdapter adp = new SprWastageStatementTableAdapter();
            try
            { return adp.WastageStatement(intPart, intSalesID); }
            catch (Exception ex) { ex.ToString(); return new DataTable(); }
        }
        public DataTable MilkPurchase(int intPart, int intMRRID)
        {
            SprMilkPurchaseTableAdapter adp = new SprMilkPurchaseTableAdapter();
            try
            { return adp.MilkPurchase(intPart, intMRRID); }
            catch (Exception ex) { ex.ToString(); return new DataTable(); }
        }
        public DataTable GetItemInfoByPO(int intPOID)
        {
            TblFactoryReceiveMRRTableAdapter adp = new TblFactoryReceiveMRRTableAdapter();
            try
            { return adp.GetItemInfoByPO(intPOID); }
            catch (Exception ex) { ex.ToString(); return new DataTable(); }
        }
        public string UpdateItemInfoByPONew(int intPOID, decimal numPOQty, int intItemID, string strSpecification, decimal monRate, decimal monVAT, decimal monAmount, int intupdateby)
        {
            string msg = "";
            SprPOItemInfoChangeTableAdapter adp = new SprPOItemInfoChangeTableAdapter();
            adp.UpdateItemInfoByPO(intPOID, numPOQty, intItemID, strSpecification, monRate, monVAT, monAmount, intupdateby, ref msg);
            return msg;

        }




















    }
}