using Project.Models.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class Add : MyPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            InitComponents();
        }

        private void InitComponents()
        {
            TxtName.Focus();
            manager.GetCities().ToList().ForEach(c => DdlCity.Items.Add(c));
        }

        protected void BtnAdd_Click(object sender, EventArgs e)
        {
            Person p = new Person
            {
                Name        = TxtName.Text,
                Surname     = TxtSurname.Text,
                Email       = AddEmails(),
                Telephone   = TxtTelephone.Text,
                Password    = TxtPassword.Text,
                Admin       = bool.Parse(DdlStatus.SelectedValue),
                City        = DdlCity.SelectedValue
            };


            if (!manager.AddPerson(p))
                ShowToastr(Page, $"{p.Name} {p.Surname} was not added! Email exists.", "Error adding", Toastr.Warning);

            ShowToastr(Page, $"{p.Name} {p.Surname} was successfully added!", "Person added", Toastr.Info);
            ResetData();
        }

        private List<string> AddEmails()
        {
            return new List<string>
            {
                TxtEmail.Text,
                TxtEmail1.Text,
                TxtEmail2.Text
            };
        }

        private void ResetData()
        {
            TxtName.Focus();
            TxtName.Text            = "";
            TxtSurname.Text         = "";
            TxtEmail.Text           = "";
            TxtTelephone.Text       = "";
            TxtPassword.Text        = "";
            TxtPasswordRepeat.Text  = "";
            DdlStatus.SelectedIndex = 0;
            DdlCity.SelectedIndex   = 0;
        }
    }
}