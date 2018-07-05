using Project.Models.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class Login : MyPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            TxtLoginEmail.Focus();
            if (Session["user"] != null)
            {
                Guid id = Guid.Parse(Session["user"].ToString());
                if (manager.IsLogged(id))
                    Response.Redirect("~/List.aspx");
            }
            
        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            string email = TxtLoginEmail.Text;
            string password = TxtLoginPassword.Text;
            bool check = CbLoginRemember.Checked;
            var p = manager.LoginInfo(email);

            if (p == null)
            {
                UserExistsValidator.IsValid = false;
                ResetData("", password, check);              
            }
            else if (p.Password != password)
            {
                PasswordNotCorrectValidator.IsValid = false;
                ResetData(email, "", check);
            }
            else
            {
                UserLogIn(p);                
            }
        }

        private void UserLogIn(Person p)
        {
            Session["user"] = p.Id;
            if (CbLoginRemember.Checked)
                CreateCookie("user", p.Id.ToString());

            Response.Redirect("~/List.aspx");
        }

        private void ResetData(string username, string password, bool check)
        {
            TxtLoginEmail.Text = username;
            TxtLoginPassword.Text = password;
            CbLoginRemember.Checked = check;
            TxtLoginEmail.Focus();
        }

        protected void BtnLoginInfo_Click(object sender, EventArgs e)
        {
            TxtLoginEmail.Text = "admin@mail.com";
            TxtLoginPassword.Text = "123";
        }
    }
}