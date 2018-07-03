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
            {
                ShowData();
            }            
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
            Label Id = GetControl<Label>(row.Cells[0].Controls);
            TextBox Name = GetControl<TextBox>(row.Cells[1].Controls);
            TextBox Surname = GetControl<TextBox>(row.Cells[3].Controls);
            TextBox Telephone = GetControl<TextBox>(row.Cells[4].Controls);
            DropDownList Admin = GetControl<DropDownList>(row.Cells[5].Controls);

            Person p = manager.GetPerson(Guid.Parse(Id.Text));
            p.Name = Name.Text;
            p.Surname = Surname.Text;
            p.Telephone = Telephone.Text;
            p.Admin = bool.Parse(Admin.SelectedValue);

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
            //Label Id = GetControl<Label>(e.Row.Cells[0].Controls);
            //Person p = manager.GetPerson(Guid.Parse(Id.Text));
            Person p = manager.GetPerson(Guid.Parse("d687a385-5e93-452b-8831-92fa022eaba1"));

            TemplateField tf = new TemplateField
            {
                HeaderText = "Email"
            };

            foreach (var em in p.Email)
            {
                if (e.Row.RowState == (DataControlRowState.Normal ^ DataControlRowState.Selected))
                {

                }
                else
                {
                    e.Row.Cells[3].Controls.Add(new TextBox { Text = em, CssClass = "form-control" });
                }
            }

        }
    }
}