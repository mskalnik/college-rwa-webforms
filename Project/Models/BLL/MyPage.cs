using System;
using System.Globalization;
using System.Threading;
using System.Web;
using System.Web.UI;

namespace Project.Models.BLL
{
    public class MyPage : System.Web.UI.Page
    {
        public static Manager manager = new Manager();
        protected override void OnPreInit(EventArgs e)
        {
            base.OnPreInit(e);
            if (!Request.Url.ToString().Contains("Login"))
            {
                if (Request.Cookies["user"] == null && Session["user"] == null)
                {
                    Response.Redirect("~/Login.aspx");
                }
            }

            if (Request.Cookies["theme"] != null)
            {
                var theme = Request.Cookies["theme"].Value;
                if (theme != "0")
                    Theme = theme;
            }
        }

        protected override void InitializeCulture()
        {
            base.InitializeCulture();
            if (Request.Cookies["language"] != null)
            {
                var language = Request.Cookies["language"].Value;
                if (language != "0")
                {
                    Thread.CurrentThread.CurrentCulture = new CultureInfo(language);
                    Thread.CurrentThread.CurrentUICulture = new CultureInfo(language);
                }
            }
        }

        public void CreateCookie(string name, string value)
        {
            HttpCookie cookie = new HttpCookie(name)
            {
                Expires = DateTime.Now.AddYears(1)
            };
            cookie.Value = value;
            Response.Cookies.Add(cookie);            
        }

        public static void ShowToastr(Page page, string message, string title, Toastr type)
        {
            string toastrType;
            switch (type)
            {
                case Toastr.Warning:
                    toastrType = "warning";
                    break;
                case Toastr.Success:
                    toastrType = "success";
                    break;
                case Toastr.Error:
                    toastrType = "error";
                    break;
                case Toastr.Info:
                    toastrType = "info";
                    break;
                default:
                    toastrType = "";
                    break;
            }

            page.ClientScript.RegisterStartupScript(
                page.GetType(), 
                "toastr_message",
                String.Format("toastr.{0}('{1}', '{2}');", toastrType, message, title), 
                addScriptTags: true);
        }
    }
}