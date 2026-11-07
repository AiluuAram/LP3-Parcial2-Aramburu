using System;
using System.Web;
using System.Web.UI;

public partial class IniciarSesion : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            // Si viene de registrarse, mostramos un aviso y precargamos el usuario
            if (this.Request.QueryString["registro"] == "ok")
            {
                MostrarMensaje("Cuenta creada. Ingrese con su usuario y contraseña.", "aviso aviso-ok");
            }

            if (this.Session["Usuario"] != null)
            {
                txtUsuario.Text = this.Session["Usuario"].ToString();
            }
        }
    }

    protected void btnIngresar_Click(object sender, EventArgs e)
    {
        if (!this.IsValid)
        {
            return;
        }

        // El usuario se guardó en la SESIÓN y la contraseña en la COOKIE al registrarse
        if (this.Session["Usuario"] == null || this.Request.Cookies["Password"] == null)
        {
            MostrarMensaje("No hay ninguna cuenta registrada en este navegador. Regístrese primero.", "aviso aviso-error");
            return;
        }

        string usuarioGuardado = this.Session["Usuario"].ToString();
        string passwordGuardada = this.Request.Cookies["Password"].Value;

        if (txtUsuario.Text.Trim() == usuarioGuardado && txtPassword.Text == passwordGuardada)
        {
            this.Session["Logueado"] = true;
            // Redirección al espacio personal del usuario
            this.Response.Redirect("MisDocumentos.aspx");
        }
        else
        {
            MostrarMensaje("Usuario o contraseña incorrectos.", "aviso aviso-error");
        }
    }

    private void MostrarMensaje(string texto, string clase)
    {
        lblMensaje.Text = texto;
        lblMensaje.CssClass = clase;
        lblMensaje.Visible = true;
    }
}
