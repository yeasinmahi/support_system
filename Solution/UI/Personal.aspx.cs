using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UI.Scripts.WebForms.Customize;

namespace UI
{
    public partial class Personal : Page
    {
        public string strinformation = "";
        int tp;
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetCacheability(HttpCacheability.Private);
            Response.Cache.SetMaxAge(new TimeSpan(1, 0, 0));
            if (!IsPostBack)
            {
                
                  if(tp==11 || tp==12)
                {
                    strinformation = @" <table class = 'tbldecoration' align='left' style='width:50%;'>
                    <tr class='tblheader'><td colspan='2' style='text-align: center;'> Personal Information </td></tr>

                    <tr style='font-size: 11px; font-weight: bold; background-color: #F0F0F0;'>
                    <td style='text-align: right;'>Name : </td>
                    <td style='text-align: left;'> " + Session[SessionParams.Name].ToString() + @"</td></tr>

                    <tr style='font-size: 11px; font-weight: bold; background-color: #F8F8F8;'>
                    <td style='text-align: right;'>Email : </td>
                    <td style='text-align: left;'> " + Session[SessionParams.Email].ToString() + @"</td></tr>

                    <tr style='font-size: 11px; font-weight: bold; background-color: #F0F0F0;'>
                    <td style='text-align: right;'>Contactno : </td>
                    <td style='text-align: left;'> " + Session[SessionParams.Contactno].ToString() + @"</td></tr>
                    </table>";
                }
                else{                
                strinformation = @" <table class = 'tbldecoration' align='left' style='width:50%;'>
                    <tr class='tblheader'><td colspan='2' style='text-align: center;'> Personal Information </td></tr>

                    <tr style='font-size: 11px; font-weight: bold; background-color: #F0F0F0;'>
                    <td style='text-align: right;'>Name : </td>
                    <td style='text-align: left;'> " + Session[SessionParams.Name].ToString() + @"</td></tr>

                    <tr style='font-size: 11px; font-weight: bold; background-color: #F8F8F8;'>
                    <td style='text-align: right;'>Code : </td>
                    <td style='text-align: left;'> " + Session[SessionParams.Code].ToString() + @"</td></tr>

                    <tr style='font-size: 11px; font-weight: bold; background-color: #F0F0F0;'>
                    <td style='text-align: right;'>Job-Type : </td>
                    <td style='text-align: left;'> " + Session[SessionParams.Jobtype].ToString() + @"</td></tr>

                    <tr style='font-size: 11px; font-weight: bold; background-color: #F8F8F8;'>
                    <td style='text-align: right;'>Email : </td>
                    <td style='text-align: left;'> " + Session[SessionParams.Email].ToString() + @"</td></tr>

                    <tr style='font-size: 11px; font-weight: bold; background-color: #F0F0F0;'>
                    <td style='text-align: right;'>Contactno : </td>
                    <td style='text-align: left;'> " + Session[SessionParams.Contactno].ToString() + @"</td></tr>
                    <tr style='font-size: 11px; font-weight: bold; background-color: #F8F8F8;'>
                    <td style='text-align: right;'>Job-Station : </td>
                    <td style='text-align: left;'>Head Office</td></tr>

                    <tr style='font-size: 11px; font-weight: bold; background-color: #F0F0F0;'>
                    <td style='text-align: right;'>Station Details : </td>
                    <td style='text-align: left;'></td></tr>
                    </table>";
                }
                pnlpersonalinformation.DataBind();
            }
        }
    }
}