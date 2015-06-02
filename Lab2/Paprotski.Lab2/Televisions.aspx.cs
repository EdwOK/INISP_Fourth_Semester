using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Paprotski.Lab2
{
    public partial class Televisions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DetailsView1_OnItemCreated(object sender, EventArgs e)
        {
            TelevisionsGridView.DataBind();
        }

        protected void DetailsView1_OnItemDeleted(object sender, DetailsViewDeletedEventArgs e)
        {
            TelevisionsGridView.DataBind();
        }

        protected void DetailsView1_OnItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            TelevisionsGridView.DataBind();
        }
    }
}