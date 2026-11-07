using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    // Se usa PreRender para que el menú refleje el estado de la sesión
    // después de que la página haya procesado sus eventos.
    protected void Page_PreRender(object sender, EventArgs e)
    {
        bool logueado = Session["Logueado"] != null;

        phVisitante.Visible = !logueado;
        phUsuario.Visible = logueado;

        if (logueado)
        {
            lblUsuarioMenu.Text = "Hola, " + HttpUtility.HtmlEncode(Session["Usuario"].ToString());
        }
    }

    protected void lnkCerrarSesion_Click(object sender, EventArgs e)
    {
        // Solo se quita la marca de "logueado": el usuario (sesión) y la
        // contraseña (cookie) quedan guardados para poder volver a ingresar.
        Session.Remove("Logueado");
        Response.Redirect("Default.aspx");
    }
}
