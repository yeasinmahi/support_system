using BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using UI.Scripts.WebForms.Customize;

namespace UI
{
    public partial class Home : Page
    {
        DataTable dtbl = new DataTable(); BLLGlobal usersecurity = new BLLGlobal(); RadPanelItem parentItem;
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetCacheability(HttpCacheability.Private);
            Response.Cache.SetMaxAge(new TimeSpan(1, 0, 0));
            if (!IsPostBack)
            {
                if (Session.Count > 0)
                {
                    frame.Src = "Personal.aspx";
                    Loadmenu();
                }
                else
                {
                    Response.Redirect("Index.aspx");
                }
            }
        }
        private void Loadmenu()
        {
            try
            {
                txtloginuser.Text = Session[SessionParams.Name].ToString() + " ( " + Session[SessionParams.Email].ToString() + " )";
                dtbl = usersecurity.GetProfileMenuList(Session[SessionParams.Email].ToString().ToString(), 0);//GetMenuList(int.Parse(Session[SessionParams.Pointtypeid].ToString()));
                if (dtbl.Rows.Count > 0)
                {
                    parentItem = new RadPanelItem();
                    int preComp = int.Parse(dtbl.Rows[0]["Parent"].ToString());
                    parentItem.Text = dtbl.Rows[0]["FunctionName"].ToString();
                    //RadPanel.Items.Add(parentItem);
                    parentItem.Expanded = true;
                    for (int i = 0; i < dtbl.Rows.Count; i++)
                    {
                        parentItem.Font.Bold = true;
                        parentItem.Font.Size = 9;
                        if (preComp != int.Parse(dtbl.Rows[i]["Parent"].ToString()))
                        {
                            RadPanelItem childItem = new RadPanelItem();
                            childItem.Font.Bold = true;
                            childItem.Font.Size = 8;
                            childItem.Text = dtbl.Rows[i]["FunctionName"].ToString();
                            childItem.NavigateUrl = dtbl.Rows[i]["FunctionUrl"].ToString();
                            childItem.Target = "frame";
                            parentItem.Items.Add(childItem);
                        }

                        else
                        {
                            parentItem = new RadPanelItem();
                            preComp = int.Parse(dtbl.Rows[i]["Parent"].ToString());
                            parentItem.Text = dtbl.Rows[i]["FunctionName"].ToString();
                            RadPanel.Items.Add(parentItem);
                            parentItem.Expanded = false;
                        }
                    }
                }
                else { Response.Redirect("Default.aspx"); }
            }
            catch { Response.Redirect("Default.aspx"); }
        }

    }
}