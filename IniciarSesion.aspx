<%@ Page Title="Iniciar sesión | Asesoría Legal Global" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="IniciarSesion.aspx.cs" Inherits="IniciarSesion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <section class="contenedor panel-formulario panel-angosto">
        <div class="formulario">
            <h1>Iniciar sesión</h1>

            <asp:Label ID="lblMensaje" runat="server" Visible="false" />

            <div class="campo">
                <asp:Label ID="lblUsuario" runat="server" AssociatedControlID="txtUsuario" Text="Nombre de usuario" />
                <asp:TextBox ID="txtUsuario" runat="server" MaxLength="20" />
                <asp:RequiredFieldValidator ID="rfvUsuario" runat="server" ControlToValidate="txtUsuario"
                    Text="Ingrese su usuario." Display="Dynamic" CssClass="error" SetFocusOnError="true" />
            </div>

            <div class="campo">
                <asp:Label ID="lblPassword" runat="server" AssociatedControlID="txtPassword" Text="Contraseña" />
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" MaxLength="50" />
                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword"
                    Text="Ingrese su contraseña." Display="Dynamic" CssClass="error" SetFocusOnError="true" />
            </div>

            <asp:Button ID="btnIngresar" runat="server" Text="Ingresar" CssClass="boton boton-ancho"
                OnClick="btnIngresar_Click" />

            <p class="nota">¿No tiene cuenta? <a href="Registro.aspx">Regístrese</a></p>
        </div>
    </section>

</asp:Content>
