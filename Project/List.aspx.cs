using Project.Models.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class List : MyPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["error"] != null)
            {
                ShowToastr(Page, Session["error"].ToString(), "Error!", Toastr.Error);
                Session.Remove("error");
            }
            if (!IsPostBack)
                ShowData(); 
        }

        private void ShowData()
        {
            GwPersons.DataSource = manager.GetPersons();
            GwPersons.DataBind();

            RepeaterPerson.DataSource = manager.GetPersons();
            RepeaterPerson.DataBind();
        }

        protected void GwPersons_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GwPersons.EditIndex = e.NewEditIndex;
            ShowData();
        }

        protected void GwPersons_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GwPersons.EditIndex = -1;
            ShowData();
        }

        protected void GwPersons_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GwPersons.Rows[e.RowIndex];
            Guid id = Guid.Parse(GetControl<Label>(row.Cells[0].Controls).Text);
            string name = GetControl<TextBox>(row.Cells[1].Controls).Text;
            string surname = GetControl<TextBox>(row.Cells[2].Controls).Text;
            List<string> emails = new List<string>();
            foreach (var c in row.Cells[3].Controls)
            {
                emails.Add(c.ToString());           
            }
            string telephone = GetControl<TextBox>(row.Cells[4].Controls).Text;
            bool admin = bool.Parse(GetControl<DropDownList>(row.Cells[5].Controls).SelectedValue);

            Person p = manager.GetPerson(id);
            p.Name = name;
            for (int i = 0; i < emails.Count; i++)
            {
                p.Email[i] = emails[i];
            }
            p.Surname = surname;
            p.Telephone = telephone;
            p.Admin = admin;

            manager.UpdatePerson(p);
            GwPersons.EditIndex = -1;
            ShowData();
        }

        private T GetControl<T>(ControlCollection parent)
        {
            foreach (var ctrl in parent)
            {
                if (ctrl is T)
                {
                    return (T)ctrl;
                }
            }
            return default(T);
        }

        protected void GwPersons_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            int index = 0;
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                index = e.Row.RowIndex;
            }

                Person p = manager.GetPersons().ToList()[index];

            TemplateField tf = new TemplateField
            {
                HeaderText = "Email"
            };

            foreach (var em in p.Email)
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    if (e.Row.RowState == DataControlRowState.Alternate || e.Row.RowState == DataControlRowState.Normal)
                    {
                        e.Row.Cells[3].Controls.Add(new Label { Text = em + "<br/>" });
                    }
                    else
                    {
                        e.Row.Cells[3].Controls.Add(new TextBox { Text = em, CssClass = "form-control input-sm" });
                    }
                }
            }

        }
    }
}