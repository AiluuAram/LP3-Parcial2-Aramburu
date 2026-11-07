# Asesoría Legal Global – Parcial 2 TP4 (LP3)

Sitio web en **ASP.NET Web Forms (C#)** para la registración de clientes y la gestión segura de documentos legales.

## Cómo ejecutarlo
1. Abrir **Visual Studio 2022** → *Archivo → Abrir → Sitio web...*
2. Seleccionar la carpeta del proyecto.
3. Presionar **F5** (requiere .NET Framework 4.8).

## Páginas
| Página | Función |
|---|---|
| `MasterPage.master` | Página maestra: navbar, contenido y footer comunes a todo el sitio |
| `Default.aspx` | Inicio |
| `Registro.aspx` | Formulario de registro con controles de validación |
| `IniciarSesion.aspx` | Inicio de sesión (compara usuario de la sesión y contraseña de la cookie) |
| `MisDocumentos.aspx` | Espacio personal: subir, listar, descargar y eliminar documentos |

## Requisitos cumplidos
- **Master Page** con navbar (cambia según haya sesión iniciada o no) y footer en todas las páginas.
- **Registro**: nombre, apellido, correo, usuario, edad, contraseña y confirmación.
  - `RequiredFieldValidator` en todos los campos.
  - `RegularExpressionValidator` para el formato del correo y que la edad sea numérica.
  - `RangeValidator` para edad mayor a 15 (16 a 120).
  - `CompareValidator` para que las contraseñas coincidan.
  - `ValidationSummary` con el resumen de errores.
- **Almacenamiento**: al registrar, la contraseña se guarda en la cookie `Password` y el usuario en `Session["Usuario"]`.
- **Login y redirección** a `MisDocumentos.aspx`, que está protegida (sin sesión redirige al login).
- **Subida segura**: extensión permitida (PDF, DOC, DOCX, TXT, JPG, PNG), máximo 5 MB, archivo no vacío, control de nombres duplicados y limpieza del nombre con `Path.GetFileName`. Cada usuario tiene su carpeta en `App_Data/Documentos/<usuario>`, que no es accesible desde el navegador: las descargas pasan por la página con la sesión iniciada.
- **Diseño responsivo** con CSS (grid, flexbox, media queries y menú hamburguesa).
- **Imágenes de la empresa** en navbar, footer, portada y formulario de registro.
