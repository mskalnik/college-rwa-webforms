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

            if (!IsPostBack)
            {
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
        }

        private void UpdateValidationGroup(Person p)
        {
            ControlCollection cc = Controls;
            cc.OfType<LinkButton>().ToList().ForEach(c => c.ValidationGroup += p.Id);
            cc.OfType<RegularExpressionValidator>().ToList().ForEach(c => c.ValidationGroup += p.Id);
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
            Person p = manager.GetPerson(Guid.Parse(LblId.Text));
            UpdateAllButEmail(p);          
            ExecuteAction(manager.UpdatePerson, p, "updated");            
        }

        private void UpdateAllButEmail(Person p)
        {
            p.Id        = Guid.Parse(LblId.Text);
            p.Name      = TxtName.Text;
            p.Surname   = TxtSurname.Text;
            p.Telephone = TxtTelephone.Text;
            p.Password  = TxtPassword.Text;
            p.Admin     = bool.Parse(DdlStatus.SelectedValue);
            p.City      = DdlCity.SelectedValue;
        }

        protected void BtnEditEmail_Click(object sender, EventArgs e)
        {
            Person p = manager.GetPerson(Guid.Parse(LblId.Text));
            p.Email[DdlEmail.SelectedIndex] = TxtEmail.Text;

            ExecuteAction(manager.UpdatePerson, p, "email update");
        }

        private void ExecuteAction(Func<Person, bool> function, Person p, string message)
        {
            if (!function(p))
                Session["error"] = $"{p.Name} {p.Surname} couldn't {message}!";

            Session["info"] = $"{p.Name} {p.Surname} {message}!";
            Response.Redirect(Request.Url.OriginalString);
        }

        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            Guid id = Guid.Parse(LblId.Text);
            string name = TxtName.Text;
            string surname = TxtSurname.Text;

            ScriptManager.RegisterStartupScript(this, this.GetType(), "LaunchServerSide", "$(function() { openModal(); });", true);

            if (!manager.DeletePerson(id))
                Session["error"] = $"{name} {surname} not deleted!";

            Session["info"] = $"{name} {surname} was deleted!";
            Response.Redirect(Request.Url.OriginalString);
        }
    }
}