using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentacion
{
    public partial class frmCerrar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["cliente"] = null;
            Session.Remove("cliente");
            Session.Remove("reserva");
            Response.Redirect("frmAcceso.aspx");
        }
    }
}