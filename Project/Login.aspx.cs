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
        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            string email = TxtLoginEmail.Text;
            string password = TxtLoginPassword.Text;
            bool check = CbLoginRemember.Checked;
            var p = manager.LoginInfo(email, password);

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
                Session["user"] = p.Id;
                if (CbLoginRemember.Checked)
                    CreateCookie("user", p.Id.ToString());

                Response.Redirect("~/List.aspx");
            }
        }

        private void ResetData(string username, string password, bool check)
        {
            TxtLoginEmail.Text = username;
            TxtLoginPassword.Text = password;
            CbLoginRemember.Checked = check;
            TxtLoginEmail.Focus();
        }
    }
}