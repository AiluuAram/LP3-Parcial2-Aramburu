using System;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MisDocumentos : System.Web.UI.Page
{
    // Extensiones aceptadas y tamaño máximo (5 MB)
    private readonly string[] extensionesPermitidas = { ".pdf", ".doc", ".docx", ".txt", ".jpg", ".jpeg", ".png" };
    private const int TamanioMaximo = 5 * 1024 * 1024;

    protected void Page_Load(object sender, EventArgs e)
    {
        // Página protegida: si no inició sesión, lo mandamos al login
        if (this.Session["Logueado"] == null || this.Session["Usuario"] == null)
        {
            this.Response.Redirect("IniciarSesion.aspx");
            return;
        }

        string nombre = this.Session["NombreCompleto"] != null
            ? this.Session["NombreCompleto"].ToString()
            : this.Session["Usuario"].ToString();

        lblBienvenida.Text = "Bienvenido/a, " + HttpUtility.HtmlEncode(nombre) +
            ". Este es su espacio personal: solo usted ve estos archivos.";

        if (!this.IsPostBack)
        {
            CargarDocumentos();
        }
    }

    // Carpeta propia de cada usuario dentro de App_Data.
    // App_Data no se puede abrir desde el navegador, así que los archivos
    // solo se descargan a través de esta página (con la sesión iniciada).
    private string CarpetaUsuario()
    {
        string carpeta = Server.MapPath("~/App_Data/Documentos/" + this.Session["Usuario"].ToString());
        if (!Directory.Exists(carpeta))
        {
            Directory.CreateDirectory(carpeta);
        }
        return carpeta;
    }

    protected void btnSubir_Click(object sender, EventArgs e)
    {
        if (!this.IsValid)
        {
            return;
        }

        // 1) Que se haya elegido un archivo
        if (!fuDocumento.HasFile)
        {
            MostrarMensaje("Seleccione un archivo para subir.", false);
            return;
        }

        // 2) Nos quedamos solo con el nombre (evita rutas tipo ..\..\archivo)
        string nombreArchivo = Path.GetFileName(fuDocumento.FileName);
        string extension = Path.GetExtension(nombreArchivo).ToLower();

        // 3) Validar extensión en el servidor
        if (!extensionesPermitidas.Contains(extension))
        {
            MostrarMensaje("Tipo de archivo no permitido. Use PDF, DOC, DOCX, TXT, JPG o PNG.", false);
            return;
        }

        // 4) Validar tamaño
        int tamanio = fuDocumento.PostedFile.ContentLength;
        if (tamanio == 0)
        {
            MostrarMensaje("El archivo está vacío.", false);
            return;
        }
        if (tamanio > TamanioMaximo)
        {
            MostrarMensaje("El archivo supera los 5 MB permitidos.", false);
            return;
        }

        // 5) Que no exista otro archivo con el mismo nombre
        string rutaDestino = Path.Combine(CarpetaUsuario(), nombreArchivo);
        if (File.Exists(rutaDestino))
        {
            MostrarMensaje("Ya existe un documento llamado \"" + nombreArchivo + "\". Cámbiele el nombre o elimine el anterior.", false);
            return;
        }

        // 6) Guardar
        fuDocumento.SaveAs(rutaDestino);
        MostrarMensaje("Documento \"" + nombreArchivo + "\" subido correctamente (" + FormatearTamanio(tamanio) + ").", true);
        CargarDocumentos();
    }

    protected void gvDocumentos_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string nombreArchivo = Path.GetFileName(e.CommandArgument.ToString());
        string ruta = Path.Combine(CarpetaUsuario(), nombreArchivo);

        if (!File.Exists(ruta))
        {
            MostrarMensaje("El documento ya no existe.", false);
            CargarDocumentos();
            return;
        }

        if (e.CommandName == "Descargar")
        {
            this.Response.Clear();
            this.Response.ContentType = "application/octet-stream";
            this.Response.AddHeader("Content-Disposition", "attachment; filename=\"" + nombreArchivo + "\"");
            this.Response.TransmitFile(ruta);
            this.Response.End();
        }
        else if (e.CommandName == "Eliminar")
        {
            File.Delete(ruta);
            MostrarMensaje("Documento \"" + nombreArchivo + "\" eliminado.", true);
            CargarDocumentos();
        }
    }

    private void CargarDocumentos()
    {
        DirectoryInfo carpeta = new DirectoryInfo(CarpetaUsuario());

        var documentos = from archivo in carpeta.GetFiles()
                         orderby archivo.LastWriteTime descending
                         select new
                         {
                             Nombre = archivo.Name,
                             Tamanio = FormatearTamanio(archivo.Length),
                             Fecha = archivo.LastWriteTime.ToString("dd/MM/yyyy HH:mm")
                         };

        gvDocumentos.DataSource = documentos.ToList();
        gvDocumentos.DataBind();
    }

    private string FormatearTamanio(long bytes)
    {
        if (bytes >= 1024 * 1024)
        {
            return (bytes / 1024.0 / 1024.0).ToString("0.0") + " MB";
        }
        return (bytes / 1024.0).ToString("0.0") + " KB";
    }

    private void MostrarMensaje(string texto, bool exito)
    {
        lblMensaje.Text = HttpUtility.HtmlEncode(texto);
        lblMensaje.CssClass = exito ? "aviso aviso-ok" : "aviso aviso-error";
        lblMensaje.Visible = true;
    }
}
