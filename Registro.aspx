<%@ Page Title="Registro | Asesoría Legal Global" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Registro.aspx.cs" Inherits="Registro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <section class="contenedor panel-formulario">
        <div class="panel-lateral">
            <img src="Imagenes/logo1.png" alt="Emblema de Asesoría Legal Global" />
            <p>Todos los campos son obligatorios.</p>
        </div>

        <div class="formulario">
            <h1>Crear cuenta</h1>

            <asp:ValidationSummary ID="vsRegistro" runat="server" CssClass="resumen-errores"
                HeaderText="Revise los siguientes datos:" DisplayMode="BulletList" />

            <!-- Nombre y apellido -->
            <div class="fila-doble">
                <div class="campo">
                    <asp:Label ID="lblNombre" runat="server" AssociatedControlID="txtNombre" Text="Nombre" />
                    <asp:TextBox ID="txtNombre" runat="server" MaxLength="50" />
                    <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre"
                        ErrorMessage="Ingrese su nombre." Text="Ingrese su nombre."
                        Display="Dynamic" CssClass="error" SetFocusOnError="true" />
                </div>
                <div class="campo">
                    <asp:Label ID="lblApellido" runat="server" AssociatedControlID="txtApellido" Text="Apellido" />
                    <asp:TextBox ID="txtApellido" runat="server" MaxLength="50" />
                    <asp:RequiredFieldValidator ID="rfvApellido" runat="server" ControlToValidate="txtApellido"
                        ErrorMessage="Ingrese su apellido." Text="Ingrese su apellido."
                        Display="Dynamic" CssClass="error" SetFocusOnError="true" />
                </div>
            </div>

            <!-- Correo -->
            <div class="campo">
                <asp:Label ID="lblCorreo" runat="server" AssociatedControlID="txtCorreo" Text="Correo electrónico" />
                <asp:TextBox ID="txtCorreo" runat="server" MaxLength="100" />
                <asp:RequiredFieldValidator ID="rfvCorreo" runat="server" ControlToValidate="txtCorreo"
                    ErrorMessage="Ingrese su correo electrónico." Text="Ingrese su correo electrónico."
                    Display="Dynamic" CssClass="error" SetFocusOnError="true" />
                <asp:RegularExpressionValidator ID="revCorreo" runat="server" ControlToValidate="txtCorreo"
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                    ErrorMessage="El correo no tiene un formato válido (ej: nombre@dominio.com)."
                    Text="El correo no tiene un formato válido (ej: nombre@dominio.com)."
                    Display="Dynamic" CssClass="error" SetFocusOnError="true" />
            </div>

            <!-- Usuario y edad -->
            <div class="fila-doble">
                <div class="campo">
                    <asp:Label ID="lblUsuario" runat="server" AssociatedControlID="txtUsuario" Text="Nombre de usuario" />
                    <asp:TextBox ID="txtUsuario" runat="server" MaxLength="20" />
                    <asp:RequiredFieldValidator ID="rfvUsuario" runat="server" ControlToValidate="txtUsuario"
                        ErrorMessage="Ingrese un nombre de usuario." Text="Ingrese un nombre de usuario."
                        Display="Dynamic" CssClass="error" SetFocusOnError="true" />
                    <asp:RegularExpressionValidator ID="revUsuario" runat="server" ControlToValidate="txtUsuario"
                        ValidationExpression="^[a-zA-Z0-9_]{3,20}$"
                        ErrorMessage="El usuario debe tener entre 3 y 20 letras, números o guion bajo."
                        Text="Entre 3 y 20 letras, números o guion bajo, sin espacios."
                        Display="Dynamic" CssClass="error" SetFocusOnError="true" />
                </div>
                <div class="campo">
                    <asp:Label ID="lblEdad" runat="server" AssociatedControlID="txtEdad" Text="Edad" />
                    <asp:TextBox ID="txtEdad" runat="server" MaxLength="3" />
                    <asp:RequiredFieldValidator ID="rfvEdad" runat="server" ControlToValidate="txtEdad"
                        ErrorMessage="Ingrese su edad." Text="Ingrese su edad."
                        Display="Dynamic" CssClass="error" SetFocusOnError="true" />
                    <asp:RegularExpressionValidator ID="revEdad" runat="server" ControlToValidate="txtEdad"
                        ValidationExpression="^\d+$"
                        ErrorMessage="La edad solo admite números." Text="La edad solo admite números."
                        Display="Dynamic" CssClass="error" SetFocusOnError="true" />
                    <asp:RangeValidator ID="rvEdad" runat="server" ControlToValidate="txtEdad"
                        MinimumValue="16" MaximumValue="120" Type="Integer"
                        ErrorMessage="Debe ser mayor de 15 años para registrarse."
                        Text="Debe ser mayor de 15 años para registrarse."
                        Display="Dynamic" CssClass="error" SetFocusOnError="true" />
                </div>
            </div>

            <!-- Contraseña y confirmación -->
            <div class="fila-doble">
                <div class="campo">
                    <asp:Label ID="lblPassword" runat="server" AssociatedControlID="txtPassword" Text="Contraseña" />
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" MaxLength="50" />
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword"
                        ErrorMessage="Ingrese una contraseña." Text="Ingrese una contraseña."
                        Display="Dynamic" CssClass="error" SetFocusOnError="true" />
                    <asp:RegularExpressionValidator ID="revPassword" runat="server" ControlToValidate="txtPassword"
                        ValidationExpression="^.{6,50}$"
                        ErrorMessage="La contraseña debe tener al menos 6 caracteres."
                        Text="Mínimo 6 caracteres."
                        Display="Dynamic" CssClass="error" SetFocusOnError="true" />
                </div>
                <div class="campo">
                    <asp:Label ID="lblConfirmar" runat="server" AssociatedControlID="txtConfirmar" Text="Confirmar contraseña" />
                    <asp:TextBox ID="txtConfirmar" runat="server" TextMode="Password" MaxLength="50" />
                    <asp:RequiredFieldValidator ID="rfvConfirmar" runat="server" ControlToValidate="txtConfirmar"
                        ErrorMessage="Confirme la contraseña." Text="Confirme la contraseña."
                        Display="Dynamic" CssClass="error" SetFocusOnError="true" />
                    <asp:CompareValidator ID="cvPassword" runat="server" ControlToValidate="txtConfirmar"
                        ControlToCompare="txtPassword" Operator="Equal" Type="String"
                        ErrorMessage="Las contraseñas no coinciden." Text="Las contraseñas no coinciden."
                        Display="Dynamic" CssClass="error" SetFocusOnError="true" />
                </div>
            </div>

            <asp:Button ID="btnRegistrar" runat="server" Text="Registrar" CssClass="boton boton-ancho"
                OnClick="btnRegistrar_Click" />

            <p class="nota">¿Ya tiene cuenta? <a href="IniciarSesion.aspx">Inicie sesión</a></p>
        </div>
    </section>

</asp:Content>
