using BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.DirectoryServices;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UI.Scripts.WebForms.Customize;

namespace UI
{
    public partial class Index : Page
    {
        string email = ""; string password = ""; private string _path; private string _filterAttribute; string[] computer_name;
        public string rtnString = ""; string domainUsername = "erpservice@akij.net"; string domainpassword = "erpservice@123";
        protected void Page_Load(object sender, EventArgs e) { }
        private bool IsADAuthentication(string email, string password)
        {
            bool authenticated = false;
            try
            {
                DirectoryEntry entry = new DirectoryEntry("LDAP://akij.net", email, password);
                object nativeObject = entry.NativeObject;
                authenticated = true;
            }
            catch (Exception ex) { ex.ToString(); }
            return authenticated;
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtOfficEmail.Text.Length > 0)
                {
                    email = Request.Form["txtOfficEmail"];
                    password = Request.Form["txtPassword"];
                    if (email.Contains("@akij.net"))
                    { string[] username = Regex.Split(email, "@"); email = username[0]; }

                    if (IsADAuthentication(email, password))
                    {
                        string ip = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
                        if (ip == string.Empty || ip == null)
                        { ip = Request.ServerVariables["REMOTE_ADDR"]; }

                        try { email = email + "@akij.net"; SetLogin(email); }
                        catch (Exception ex) { rtnString = ex.ToString(); }
                    }
                    else { rtnString = "Active Directory Authentication Failed."; }
                }
                else { rtnString = "Enter your office mail for access."; }
                ScriptManager.RegisterStartupScript(Page, typeof(Page), "StartupScript", "alert('" + rtnString + ".');", true);
            }
            catch { }
        }
        private void SetLogin(string email)
        {
            DataTable objDT = new DataTable(); BLLGlobal usersecurity = new BLLGlobal();
            objDT = usersecurity.GetProfileMenuList(email, 1);//GetUserSecurity(email);
            if (objDT.Rows.Count == 1)
            {
                Session[SessionParams.Enroll] = objDT.Rows[0]["Enroll"].ToString();
                Session[SessionParams.Code] = objDT.Rows[0]["Code"].ToString();
                Session[SessionParams.Name] = objDT.Rows[0]["Name"].ToString();
                Session[SessionParams.Unitid] = objDT.Rows[0]["Unit"].ToString();
                Session[SessionParams.Unit] = objDT.Rows[0]["UnitName"].ToString();
             
                Session[SessionParams.Designationid] = objDT.Rows[0]["Designation"].ToString();
                Session[SessionParams.Designation] = objDT.Rows[0]["DesignationName"].ToString();
                Session[SessionParams.Jobtypeid] = objDT.Rows[0]["Jobtype"].ToString();
                Session[SessionParams.Jobtype] = objDT.Rows[0]["JobtypeName"].ToString();
                Session[SessionParams.Email] = objDT.Rows[0]["Email"].ToString();
                Session[SessionParams.Contactno] = objDT.Rows[0]["Phoneno"].ToString();
                Random rd = new Random();
                Response.Redirect("Home.aspx");
             
            }
            else if (objDT.Rows.Count > 1) { rtnString = "Given email address has been duplicate."; }
            else { rtnString = "You have no permission to access this solution."; }
        }
        private bool IsAuthenticated(string email, string domainUsername, string domainpassword)
        {           
            DirectoryEntry entry = new DirectoryEntry(_path, domainUsername, domainpassword);
            try
            {
                object obj = entry.NativeObject;
                DirectorySearcher search = new DirectorySearcher(entry);
                search.Filter = "(SAMAccountName=" + email + ")";
                search.PropertiesToLoad.Add("cn");
                SearchResult result = search.FindOne();
                if (null == result)
                { return false; }
                _path = result.Path;
                _filterAttribute = (string)result.Properties["cn"][0];
            }
            catch (Exception ex)
            { throw new Exception("Error authenticating user. " + ex.Message); }
            return true;
        }




    }
}