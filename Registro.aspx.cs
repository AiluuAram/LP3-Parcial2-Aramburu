using System;
using System.Web;
using System.Web.UI;

public partial class Registro : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void btnRegistrar_Click(object sender, EventArgs e)
    {
        // Los validadores también se ejecutan en el servidor:
        // si alguno falla, no se guarda nada.
        if (!this.IsValid)
        {
            return;
        }

        // 1) Contraseña en una COOKIE (persistente por 1 día)
        HttpCookie cookiePassword = new HttpCookie("Password", txtPassword.Text);
        cookiePassword.Expires = DateTime.Now.AddDays(1);
        cookiePassword.HttpOnly = true;
        this.Response.Cookies.Add(cookiePassword);

        // 2) Nombre de usuario en una variable de SESIÓN
        this.Session["Usuario"] = txtUsuario.Text.Trim();

        // Datos extra para personalizar el espacio del usuario
        this.Session["NombreCompleto"] = txtNombre.Text.Trim() + " " + txtApellido.Text.Trim();
        this.Session["Correo"] = txtCorreo.Text.Trim();
        this.Session["Edad"] = int.Parse(txtEdad.Text);

        // 3) Lo mandamos a iniciar sesión
        this.Response.Redirect("IniciarSesion.aspx?registro=ok");
    }
}
