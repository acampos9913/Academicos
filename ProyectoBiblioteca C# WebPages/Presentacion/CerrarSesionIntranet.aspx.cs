using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentacion
{
    public partial class CerrarSesionIntranet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["empleado"] = null;
            Session.Remove("empleado");
            Session.Remove("regLibros");
            Response.Redirect("frmAccesoIntranet.aspx");
        }
    }
}