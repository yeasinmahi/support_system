using DAL.DALASSETTableAdapters;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace BLL
{
    public class BLLAsset
    {
        public DataTable AssetPermissionView(int enroll)
        {
            TblAssetPermissionTableAdapter adp = new TblAssetPermissionTableAdapter();
            try
            {
               
                return adp.GetAssetPermissionViewData(enroll);
            }
            catch { return new DataTable(); }
             
        }
        public DataTable EmployeeProfile(int enroll)
        {
            TblEmployeeTableAdapter adp = new TblEmployeeTableAdapter();
            try
            {

                return adp.GetEmpProfileData(enroll);
            }
            catch { return new DataTable(); }
            
        }


        public void AssetPermisionInsert(int enroll, int jobstation, int unit, int general, int vehicle, int land, int building)
        {
            try
            {
                TblAssetPermisionInsertTableAdapter adp = new TblAssetPermisionInsertTableAdapter();
                adp.GetAssetPermisionData(enroll, jobstation, unit, general, vehicle, land, building);
            }
            catch { }
            
        }

        public void AssetPermissionUpdate(int general, int vehicle, int land, int building, int enroll)
        {
            try
            {
                TblAssetPermissionUpdateTableAdapter adp = new TblAssetPermissionUpdateTableAdapter();
                adp.GetAssetPermissionUpdateData( general, vehicle, land, building, enroll);
            }
            catch { }
        }
    }
}