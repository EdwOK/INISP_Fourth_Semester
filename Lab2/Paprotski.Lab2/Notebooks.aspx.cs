using System;
using System.Web.UI.WebControls;

namespace Paprotski.Lab2
{
    public partial class Notebook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void NotebooksDetailsView_OnItemCreated(object sender, EventArgs e)
        {
            NotebooksGridView.DataBind();
        }

        protected void NotebooksDetailsView_OnItemDeleted(object sender, DetailsViewDeletedEventArgs e)
        {
            NotebooksGridView.DataBind();
        }

        protected void NotebooksDetailsView_OnItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            NotebooksGridView.DataBind();
        }
    }
}