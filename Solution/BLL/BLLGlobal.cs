using DAL.DALGlobalTableAdapters;
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;

namespace BLL
{
    public class BLLGlobal
    {

        #region --------------- Security and Search Lable ------------------
        public DataTable GetUserSecurity(string email)
        {
            try
            {
                SprSessionUserProfileTableAdapter adp = new SprSessionUserProfileTableAdapter();
                return adp.GetSessionUserProfileData(email);
            }
            catch { return new DataTable(); }
        }
        public DataTable GetMenuList(int pointtype)
        {
            try
            {
                TblUserMenuTableAdapter adp = new TblUserMenuTableAdapter();
                return adp.GetUserUrlData(pointtype);
            }
            catch { return new DataTable(); }
        }
        public DataTable GetProfileMenuList(string paramiter, int type)
        {
            try
            {
                sprRemoteSessionProfileTableAdapter adp = new sprRemoteSessionProfileTableAdapter();
                return adp.GetSessionUserProfileData(paramiter, type);
            }
            catch { return new DataTable(); }
        }
        #endregion


        public static DateTime? GetDateAtSQLDateFormat(string dateString)
        {
            if ("" + dateString == "") return null;

            DateTimeFormatInfo dtf = new DateTimeFormatInfo();
            dtf.ShortDatePattern = "dd/MM/yyyy hh:mm tt";
            return Convert.ToDateTime(dateString, dtf);
        }





    }
}