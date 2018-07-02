using Project.Models.BLL;
using Project.Models.Controls;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class Update : MyPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Person p = manager.GetPerson(Guid.Parse(Request.QueryString["Id"]));

            if (p.Email[0] != "admin@mail.com")
            {
                EditPersonControl epc = LoadControl("~/Models/Controls/EditPersonControl.ascx") as EditPersonControl;
                EditPerson.Controls.Add(epc);
                epc.DisplayPersonData(p);
            }
            else
            {
                BtnWrongPerson.CssClass = "h3 btn-link";
            }
        }
    }
}