<%@ Page Title="Inicio | Asesoría Legal Global" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <section class="portada">
        <div class="contenedor portada-interior">
            <div class="portada-texto">
                <h1>Sus documentos legales, ordenados y protegidos en un solo lugar.</h1>
                <p>Cree su cuenta, ingrese a su espacio personal y suba contratos, poderes o escritos para que nuestro equipo los revise.</p>
                <div class="acciones">
                    <a href="Registro.aspx" class="boton">Crear cuenta</a>
                    <a href="IniciarSesion.aspx" class="boton boton-secundario">Ya tengo cuenta</a>
                </div>
            </div>
            <img src="Imagenes/logo3.png" alt="Banner institucional de Asesoría Legal Global" class="portada-banner" />
        </div>
    </section>

    <section class="contenedor seccion">
        <h2>Cómo funciona</h2>
        <ol class="pasos">
            <li>
                <h3>Regístrese</h3>
                <p>Complete sus datos: nombre, correo, usuario, edad y una contraseña.</p>
            </li>
            <li>
                <h3>Inicie sesión</h3>
                <p>Ingrese con su usuario y contraseña para acceder a su espacio personal.</p>
            </li>
            <li>
                <h3>Suba sus documentos</h3>
                <p>Cargue archivos PDF, Word, texto o imágenes de hasta 5 MB. Solo usted puede verlos.</p>
            </li>
        </ol>
    </section>

    <section class="contenedor seccion seccion-dividida">
        <img src="Imagenes/logo1.png" alt="Emblema de Asesoría Legal Global" class="emblema" />
        <div>
            <h2>Asesoramiento legal con respaldo</h2>
            <p>Acompañamos a personas y empresas en temas civiles, comerciales y laborales. Su espacio de documentos le permite enviarnos la información que necesitamos sin depender del correo electrónico.</p>
        </div>
    </section>

</asp:Content>
