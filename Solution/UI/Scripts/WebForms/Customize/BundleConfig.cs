using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Optimization;

namespace UI.Scripts.WebForms.Customize
{
    public class BundleConfig
    {
        /// <summary>
        /// Develop By Md. Golam Kibria Konock
        /// Date : 25th February 2015
        /// </summary>
        /// <param name="bundles"></param>
        private static bool? _bundlingActive;
        public static void RegisterBundles(BundleCollection bundles)
        {
            CreateBundle_Scripts(bundles);
            CreateBundle_CSS(bundles);   
        }
        private static void CreateBundle_CSS(BundleCollection bundles)
        {
            bundles.Add(new StyleBundle("~/Content/Bundle/DefaultCss").IncludeDirectory("~/Content/Css", "*.css"));

        }
        private static void CreateBundle_Scripts(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/Content/Bundle/Jquery").IncludeDirectory("~/Scripts/WebForms/Customize", "*.js").IncludeDirectory("~/Scripts/WebForms/MSAjax", "*.js"));
        }
        public static bool BundlingActive
        {
            get
            {
                if (!_bundlingActive.HasValue)
                    _bundlingActive = ConfigurationManager.AppSettings["BundlingActive"] == "1";
                return _bundlingActive.Value;
            }
        }
    }
}