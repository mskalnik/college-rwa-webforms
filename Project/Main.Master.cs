using Project.Models.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class Main : MyMasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CheckToastr();
            VisitLoginHandler();
            CheckUser();            
        }

        private void CheckUser()
        {
            if (Session["user"] == null)
            {
                if (Request.Cookies["user"] != null)
                {
                    Session["user"] = Request.Cookies["user"].Value;
                    SetUserButtons();
                }
            }
            else
            {
                SetUserButtons();
            }
        }

        private void VisitLoginHandler()
        {
            if (Request.Url.ToString().Contains("Login"))
            {
                MasterMail.CssClass += " hidden";
                MasterLogout.CssClass += " hidden";
            }
        }

        private void CheckToastr()
        {
            if (Session["error"] != null)
            {
                MyPage.ShowToastr(Page, Session["error"].ToString(), "Error!", Toastr.Error);
                Session.Remove("error");
            }

            if (Session["info"] != null)
            {
                MyPage.ShowToastr(Page, Session["info"].ToString(), "Info!", Toastr.Success);
                Session.Remove("info");
            }
        }

        private void SetUserButtons()
        {
            Manager manager = new Manager();
            Person p = manager.GetPerson(Guid.Parse(Session["user"].ToString()));
            MasterMail.NavigateUrl = $"mailto:{p.Email[0]}";
            MasterMail.Text = $"{p.Name} {p.Surname}";

            SetUserPermission(p);
        }

        private void SetUserPermission(Person p)
        {
            if (!p.Admin)
            {
                if (!Request.Url.ToString().Contains("List"))
                {
                    Session["error"] = $"{p.Name} {p.Surname} you are not admin";
                    Response.Redirect("~/List.aspx");
                }
            }
        }

        protected void MasterLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Cookies["user"].Expires = DateTime.Now.AddDays(-1);
            Response.Redirect(Request.Url.AbsolutePath);
        }
    }
}