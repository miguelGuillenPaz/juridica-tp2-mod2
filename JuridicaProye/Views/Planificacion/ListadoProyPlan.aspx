<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<DemoMVC.Models.Proyecto>>" %>

<asp:Content ID="TituloPlan" ContentPlaceHolderID="TitleContent" runat="server">
    ListadoProyPlan
</asp:Content>
<asp:Content ID="ContentPlan" ContentPlaceHolderID="MainContent" runat="server">
    <div class="contenido-top">
        <div>
            <h1>
                Planificación de Proyectos > Listado de Proyectos Aprobados</h1>
            <p>
                Por favor, seleccione un proyecto aprobado para la planificación del mismo:
            </p>
            <% using (Html.BeginForm())
               { %>
            <fieldset>
                <hr>
                <div class="editor-label">
                    <label for="UserName">
                        Código del Proyecto:</label>&nbsp;&nbsp;<input id="txtCodProy" name="txtCodProy"
                            type="text" value="" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="submit" value="Buscar" />
                </div>
                <hr>
                <br>
                <br>
                <% } %>
                Resultados de la búsqueda:
                <%: ViewData["totReg"] %>
                <div class="editor-field">
                    <table id='Tabla1'>
                        <tr>
                            <th>
                                Código Proyecto
                            </th>
                            <th>
                                Nombre Proyecto
                            </th>
                            <th>
                                tipo Proyecto
                            </th>
                            <th>
                                Fecha de Inicio
                            </th>
                            <th>
                                Fecha de Fin
                            </th>
                            <th>
                                Presupuesto
                            </th>
                            <th>
                                Crear Plan
                            </th>
                        </tr>
                        <% 
                            if (Model != null)
                            {
                                foreach (var item in Model)
                                { %>
                        <tr>
                            <td align="center">
                                PROY<%: item.codPro %>
                            </td>
                            <td>
                                <%: item.nomPro %>
                            </td>
                            <td>
                                <%: item.tipoProyecto%>
                            </td>
                            <td>
                                <%: item.feciniplaPro %>
                            </td>
                            <td>
                                <%: item.fecfinplaPro %>
                            </td>
                            <td>
                                <%: item.monfacPro %>
                                <%: item.presupuesto %>
                            </td>
                            <td align="center">
                                <%: Html.ActionLink("Crear", "CrearPlan", "Planificacion", new { codProy = item.codPro },null)%>
                            </td>
                        </tr>
                        <% } %>
                        <% } %>
                    </table>
                </div>
                <center>
                    <h2>
                        <%: ViewData["msgErr"] %></h2>
                </center>
            </fieldset>
        </div>
    </div>
</asp:Content>
