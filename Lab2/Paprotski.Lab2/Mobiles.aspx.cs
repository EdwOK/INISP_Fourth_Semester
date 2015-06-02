using System;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Paprotski.Lab2
{
    public partial class Mobiles : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void MobilesDetailsView_OnItemCreated(object sender, EventArgs e)
        {
            MobilesGridView.DataBind();
        }

        protected void MobilesDetailsView_OnItemDeleted(object sender, DetailsViewDeletedEventArgs e)
        {
            MobilesGridView.DataBind();
        }

        protected void MobilesDetailsView_OnItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            MobilesGridView.DataBind();
        }
    }
}