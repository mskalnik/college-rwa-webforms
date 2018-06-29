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
    public partial class Edit : MyPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<Person> persons = manager.GetPersons().ToList();

            foreach (var p in persons)
            {
                EditPersonControl epc = LoadControl("~/Models/Controls/EditPersonControl.ascx") as EditPersonControl;
                EditContent.Controls.Add(epc);
                epc.DisplayPersonData(p);
            }
        }
    }
}