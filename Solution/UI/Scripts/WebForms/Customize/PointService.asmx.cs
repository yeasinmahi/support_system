using BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;

namespace UI.Scripts.WebForms.Customize
{
    /// <summary>
    /// Develop By Md. Golam Kibria Konock
    /// Date : 25th February 2015
    /// </summary>
    /// <param name="bundles"></param>
    [WebService(Namespace = "http://acl.akij.net/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    [System.Web.Script.Services.ScriptService]
    public class PointService : WebService
    {

        BLLGlobal objbll = new BLLGlobal(); DataTable dt = new DataTable();
        public PointService()
        {
            //Uncomment the following line if using designed components 
            //InitializeComponent(); 
        }

        /*
        [WebMethod] 
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string[] GetSearchEmployeeList(int enroll, int station, string searchKey)
        {
            List<string> item = new List<string>();
            dt = objbll.GetSearchEmployee(enroll, station, searchKey);
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string strName = dt.Rows[i]["SearchResult"].ToString();
                item.Add(strName);
            }
            return item.ToArray();

        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string[] GetTOAMRMEmployeeList(int supervisor, string searchKey)
        {
            List<string> item = new List<string>();
            dt = objbll.GetSearchEmployee(supervisor, searchKey);
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string strName = dt.Rows[i]["SearchResult"].ToString();
                item.Add(strName);
            }
            return item.ToArray();
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string[] GetSearchAccountList(int station, string searchKey)
        {
            List<string> item = new List<string>();
            dt = objbll.GetSearchAccount(station, searchKey);
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string strName = dt.Rows[i]["SearchResult"].ToString();
                item.Add(strName);
            }
            return item.ToArray();

        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string[] GetSearchItemList(string date, string searchKey)
        {
            List<string> item = new List<string>();
            dt = objbll.GetSearchItem(date, searchKey);
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string strName = dt.Rows[i]["SearchResult"].ToString();
                item.Add(strName);
            }
            return item.ToArray();

        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string[] GetSearchVehicleList(string unit, string searchKey)
        {
            List<string> item = new List<string>();
            dt = objbll.GetSearchVehicle(int.Parse(unit), searchKey);
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string strName = dt.Rows[i]["SearchResult"].ToString();
                item.Add(strName);
            }
            return item.ToArray();

        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string[] GetSearchSuplierList(string unit, string searchKey)
        {
            List<string> item = new List<string>();
            dt = objbll.GetSearchSupplier(int.Parse(unit), searchKey);
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string strName = dt.Rows[i]["SearchResult"].ToString();
                item.Add(strName);
            }
            return item.ToArray();

        }
        */

    }
}
