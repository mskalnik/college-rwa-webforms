using Project.Models.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project.Models.Controls
{
    public partial class EditPersonControl : System.Web.UI.UserControl
    {
        Manager manager = new Manager();

        public void DisplayPersonData(Person p)
        {
            FillData(p);
        }

        private void FillData(Person p)
        {
            UpdateValidationGroup(p);
            
            LblId.Text              = p.Id.ToString();
            TxtName.Text            = p.Name;
            TxtSurname.Text         = p.Surname;
            DdlEmail.Items.Clear();
                p.Email.ToList().ForEach(e => DdlEmail.Items.Add(e));
            TxtEmail.Text           = DdlEmail.SelectedValue;
            TxtTelephone.Text       = p.Telephone;
            TxtPassword.Text        = p.Password;
            DdlStatus.SelectedValue = p.Admin.ToString();
            DdlCity.Items.Clear();
                manager.GetCities().ToList().ForEach(c => DdlCity.Items.Add(c));
            DdlCity.SelectedValue   = p.City;
        }

        private void UpdateValidationGroup(Person p)
        {
            ControlCollection cc = Controls;
            cc.OfType<RequiredFieldValidator>().ToList().ForEach(c => c.ValidationGroup += p.Id);
            cc.OfType<ValidationSummary>().ToList().ForEach(c => c.ValidationGroup += p.Id);
            cc.OfType<Button>().ToList().ForEach(c => c.ValidationGroup += p.Id);
        }

        protected void DdlEmail_SelectedIndexChanged(object sender, EventArgs e)
        {
            TxtEmail.Text = DdlEmail.SelectedValue;
        }

        protected void BtnEdit_Click(object sender, EventArgs e)
        {
            Person p = new Person
            {
                Id = Guid.Parse(LblId.Text),
                Name = TxtName.Text,
                Email = new List<string> { DdlEmail.SelectedValue },
                Surname = TxtSurname.Text,
                Telephone = TxtTelephone.Text,
                Password = TxtPassword.Text,
                Admin = bool.Parse(DdlStatus.SelectedValue),
                City = DdlCity.SelectedValue,
            };

            if (!manager.UpdatePerson(p))
                MyPage.ShowToastr(Page, $"{p.Name} {p.Surname} not updated!", "Error!", Toastr.Error);

            MyPage.ShowToastr(Page, $"{p.Name} {p.Surname} was successfully updated!", "Person updated", Toastr.Info);
        }

        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            Guid id = Guid.Parse(LblId.Text);
            string name = TxtName.Text;
            string surname = TxtSurname.Text;
            if (!manager.DeletePerson(id))
                MyPage.ShowToastr(Page, $"{name} {surname} not deleted!", "Error!", Toastr.Error);

            MyPage.ShowToastr(Page, $"{name} {surname} was successfully deleted!", "Info", Toastr.Info);
        }

        protected void BtnEditEmail_Click(object sender, EventArgs e)
        {
            Person p = manager.GetPerson(Guid.Parse(LblId.Text));
            for (int i = 0; i < p.Email.Count; i++)
            {
                if (DdlEmail.SelectedValue == p.Email[i])
                {
                    p.Email[i] = TxtEmail.Text;
                }
            }

            if (!manager.UpdatePerson(p))
                MyPage.ShowToastr(Page, $"{p.Name} {p.Surname} email updated!", "Error!", Toastr.Error);

            MyPage.ShowToastr(Page, $"{p.Name} {p.Surname} email successfully updated!", "Person updated", Toastr.Info);
        }
    }
}