<%@ Page Title="Mis documentos | Asesoría Legal Global" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MisDocumentos.aspx.cs" Inherits="MisDocumentos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <section class="contenedor seccion">
        <div class="encabezado-usuario">
            <div>
                <h1>Mis documentos</h1>
                <p>
                    <asp:Label ID="lblBienvenida" runat="server" />
                </p>
            </div>
        </div>

        <!-- Subida de archivos -->
        <div class="tarjeta-subida">
            <h2>Subir un documento</h2>
            <p class="nota">Formatos permitidos: PDF, DOC, DOCX, TXT, JPG y PNG. Tamaño máximo: 5 MB.</p>

            <div class="fila-subida">
                <asp:FileUpload ID="fuDocumento" runat="server" CssClass="selector-archivo"
                    accept=".pdf,.doc,.docx,.txt,.jpg,.jpeg,.png" />
                <asp:Button ID="btnSubir" runat="server" Text="Subir documento" CssClass="boton"
                    OnClick="btnSubir_Click" />
            </div>

            <asp:RequiredFieldValidator ID="rfvDocumento" runat="server" ControlToValidate="fuDocumento"
                Text="Seleccione un archivo." Display="Dynamic" CssClass="error" />
            <asp:RegularExpressionValidator ID="revDocumento" runat="server" ControlToValidate="fuDocumento"
                ValidationExpression="^.+\.(pdf|PDF|doc|DOC|docx|DOCX|txt|TXT|jpg|JPG|jpeg|JPEG|png|PNG)$"
                Text="Tipo de archivo no permitido." Display="Dynamic" CssClass="error" />

            <asp:Label ID="lblMensaje" runat="server" Visible="false" />
        </div>

        <!-- Listado de documentos del usuario -->
        <h2>Documentos cargados</h2>
        <div class="tabla-scroll">
            <asp:GridView ID="gvDocumentos" runat="server" AutoGenerateColumns="false"
                CssClass="tabla" GridLines="None" DataKeyNames="Nombre"
                OnRowCommand="gvDocumentos_RowCommand"
                EmptyDataText="Todavía no subió ningún documento. Use el formulario de arriba para cargar el primero.">
                <Columns>
                    <asp:BoundField DataField="Nombre" HeaderText="Archivo" />
                    <asp:BoundField DataField="Tamanio" HeaderText="Tamaño" />
                    <asp:BoundField DataField="Fecha" HeaderText="Subido el" />
                    <asp:TemplateField HeaderText="Acciones">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkDescargar" runat="server" CommandName="Descargar"
                                CommandArgument='<%# Eval("Nombre") %>' CausesValidation="false"
                                CssClass="accion">Descargar</asp:LinkButton>
                            <asp:LinkButton ID="lnkEliminar" runat="server" CommandName="Eliminar"
                                CommandArgument='<%# Eval("Nombre") %>' CausesValidation="false"
                                CssClass="accion accion-peligro"
                                OnClientClick="return confirm('¿Eliminar este documento?');">Eliminar</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </section>

</asp:Content>
