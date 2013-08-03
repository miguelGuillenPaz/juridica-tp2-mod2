<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DemoMVC.Models.GRH_Persona>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Registrar Postulante
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="contenido-top">
        <div>
            <h1>
                Registrar Postulante
                <%= Html.HiddenFor(m=> m.idPersona) %>
            </h1>
            <div class="areas-negocios">
                <div class="lista-central">
                    <div class="noticia">
                        <div class="head-noticia">
                            <span class="titulo-noticia">Información Personal</span>
                        </div>
                        <div class="texto-noticia">
                            <table>
                                <tr>
                                    <td>
                                        <%= Html.Label("Nombres") %>
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <%= Html.TextBoxFor(m=> m.nombre) %>
                                    </td>
                                    <td>
                                    </td>
                                    <td>
                                    </td>
                                    <td>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <%= Html.Label("Apellido Paterno") %>
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <%= Html.TextBoxFor(m=> m.apellidoPaterno) %>
                                    </td>
                                    <td>
                                    </td>
                                    <td>
                                        <%= Html.Label("Apellido Materno") %>
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <%= Html.TextBoxFor(m=> m.apellidoMaterno) %>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <%= Html.Label("Estado Civil") %>
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <%= Html.DropDownListFor(m => m.idEstadoCivil, (IEnumerable<SelectListItem>)ViewData["EstadoCivil"]) %>
                                    </td>
                                    <td>
                                    </td>
                                    <td>
                                        Sexo
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <%= Html.RadioButtonFor(m => m.sexo,true) %>
                                        Masculino
                                        <%= Html.RadioButtonFor(m=> m.sexo,false)%>
                                        Femenino
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Dirección
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <%= Html.TextBoxFor(m=>m.direccion)%>
                                    </td>
                                    <td>
                                    </td>
                                    <td>
                                        Pais de Residencia
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <%= Html.DropDownListFor(m => m.idPais_R, (IEnumerable<SelectListItem>)ViewData["Pais"]) %>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Fecha de Nacimiento
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <%= Html.TextBoxFor(m=> m.fechaNacimiento, new {@type ="date"}) %>
                                    </td>
                                    <td>
                                    </td>
                                    <td>
                                        <%= Html.Label("Pais de Nacimiento") %>
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <%= Html.DropDownListFor(m => m.idPais_N, (IEnumerable<SelectListItem>)ViewData["Pais"]) %>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="noticia">
                        <div class="head-noticia">
                            <span class="titulo-noticia">Experiencia Laboral</span>
                        </div>
                        <div class="texto-noticia">
                            <table>
                                <thead>
                                    <tr>
                                        <th>
                                            <b>Empresa</b>
                                        </th>
                                        <th>
                                            <b>Cargo</b>
                                        </th>
                                        <th>
                                            <b>F. Inicio</b>
                                        </th>
                                        <th>
                                            <b>F. Fin</b>
                                        </th>
                                        <th style="display: none;">
                                            <b>Conocimientos</b>
                                        </th>
                                        <th>
                                            <b>Opciones</b>
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% if (Model != null)
                                       {
                                           foreach (var item in Model.GRH_ExperienciaLaboral)
                                           { %>
                                    <tr>
                                        <td>
                                            <%= item.empresa %>
                                        </td>
                                        <td>
                                            <%= item.cargo %>
                                        </td>
                                        <td>
                                            <%= item.fechaInicio %>
                                        </td>
                                        <td>
                                            <%= item.FechaFin %>
                                        </td>
                                        <td style="display: none;">
                                            <%= item.conocimientos %>
                                        </td>
                                        <td>
                                            <a href="">Editar</a> | <a href="">Eliminar</a>
                                        </td>
                                    </tr>
                                    <%
                                       }
                                       } %>
                                </tbody>
                            </table>
                            <a href="">Agregar</a>
                        </div>
                    </div>
                    <div class="noticia">
                        <div class="head-noticia">
                            <span class="titulo-noticia">Estudios Realizados</span>
                        </div>
                        <div class="texto-noticia">
                            <table>
                                <thead>
                                    <tr>
                                        <th>
                                            <b>Centro de Estudios</b>
                                        </th>
                                        <th>
                                            <b>Cargo</b>
                                        </th>
                                        <th>
                                            <b>F. Inicio</b>
                                        </th>
                                        <th>
                                            <b>F. Fin</b>
                                        </th>
                                        <th style="display: none;">
                                            <b>Conocimientos</b>
                                        </th>
                                        <th>
                                            <b>Opciones</b>
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% if (Model != null)
                                       {
                                           foreach (var item in Model.GRH_EstudioRealizado)
                                           { %>
                                    <tr>
                                        <td>
                                            <%= item.centroEstudio %>
                                        </td>
                                        <td>
                                            <%= item.GRH_Especialidad.descripcion %>
                                        </td>
                                        <td>
                                            <%= item.fechaInicio %>
                                        </td>
                                        <td>
                                            <%= item.fechaFin %>
                                        </td>
                                        <td style="display: none;">
                                            <%= item.nombreEstudio %>
                                        </td>
                                        <td>
                                            <a href="">Editar</a> | <a href="">Eliminar</a>
                                        </td>
                                    </tr>
                                    <%
                                           }
                                       } %>
                                </tbody>
                            </table>
                            <a href="">Agregar</a>
                        </div>
                    </div>
                    <div class="noticia">
                        <div class="head-noticia">
                            <span class="titulo-noticia">Idiomas</span>
                        </div>
                        <div class="texto-noticia">
                            <table>
                                <thead>
                                    <tr>
                                        <th>
                                            <b>Idioma</b>
                                        </th>
                                        <th>
                                            <b>Nivel</b>
                                        </th>
                                        <th>
                                            <b>Opciones</b>
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% if (Model != null)
                                       {
                                           foreach (var item in Model.GRH_IdiomaPersona)
                                           { %>
                                    <tr>
                                        <td>
                                            <%= item.GRH_Idioma.descripcion %>
                                        </td>
                                        <td>
                                            <%= item.nativo == true ? "Nativo" : item.GRH_NivelIdioma.descripcion %>
                                        </td>
                                        <td>
                                            <a href="">Editar</a> | <a href="">Eliminar</a>
                                        </td>
                                    </tr>
                                    <%
                                           }
                                       } %>
                                </tbody>
                            </table>
                            <a href="">Agregar</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
