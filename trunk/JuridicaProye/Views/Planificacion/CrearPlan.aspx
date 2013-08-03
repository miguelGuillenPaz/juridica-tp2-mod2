<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<DemoMVC.Models.DetallePresupuesto>>" %>

<asp:Content ID="PlanTitle" ContentPlaceHolderID="TitleContent" runat="server">
    CrearPlan
</asp:Content>
<asp:Content ID="PlanContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="contenido-top">
        <div>
            <h1>
            </h1>
            >
                Planificación de Proyectos > Creación de Plan</h1>
            <p>
                Cree un nuevo Plan de Proyecto - PROY<b><%: ViewData["codProy"]%></b>:
            </p>
            <% using (Html.BeginForm())
               { %>
            <div>
                <fieldset>
                    <hr>
                    <div class="editor-label">
                        <h3>
                            Detalle del Proyecto:</h3>
                        <table border="0">
                            <tr>
                                <td border="0" width="200px">
                                    Nombre de Proyecto:
                                </td>
                                <td border="0">
                                    <%: ViewData["nomProy"]%>
                                </td>
                            </tr>
                            <tr>
                                <td border="0" width="200px">
                                    Presupuesto:
                                </td>
                                <td border="0">
                                    <%: ViewData["preProy"]%>
                                </td>
                            </tr>
                            <tr>
                                <td border="0" width="200px">
                                    Fecha Inicio Proyecto:
                                </td>
                                <td border="0">
                                    <%: ViewData["fecIniP"]%>
                                </td>
                            </tr>
                            <tr>
                                <td border="0" width="200px">
                                    Fecha Fin Proyecto:
                                </td>
                                <td border="0">
                                    <%: ViewData["fecFinP"]%>
                                </td>
                            </tr>
                            <tr>
                                <td border="0" width="200px">
                                    Descripción:
                                </td>
                                <td border="0">
                                    <%: ViewData["desProy"]%>
                                </td>
                            </tr>
                            <tr>
                                <td border="0" width="200px">
                                    Tipo de Proyecto:
                                </td>
                                <td border="0">
                                    <%: ViewData["tipProy"]%>
                                </td>
                            </tr>
                            <tr>
                                <td border="0" width="200px">
                                    Prioridad:
                                </td>
                                <td border="0">
                                    <%: ViewData["priProy"]%>
                                </td>
                            </tr>
                            <tr>
                                <td border="0" width="200px">
                                    Ubicación:
                                </td>
                                <td border="0">
                                    <%: ViewData["ubiProy"]%>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <br>
                    <hr>
                    <br>
                    <h3>
                        Detalle asignación de presupuesto:</h3>
                    <div class="editor-field">
                        <table id='Tabla1'>
                            <tr>
                                <th>
                                    Tipo
                                </th>
                                <th>
                                    Presupuesto
                                </th>
                                <th>
                                    Porcentaje
                                </th>
                            </tr>
                            <% 
                   if (Model != null)
                   {
                       foreach (var item in Model)
                       { %>
                            <tr>
                                <td>
                                    <%: item.desDetPre %>
                                </td>
                                <td>
                                    <%: item.valDetPre %>
                                </td>
                                <td>
                                    <%: item.porDetPre %>%
                                </td>
                            </tr>
                            <% } %>
                            <% } %>
                        </table>
                    </div>
                    <br>
                    <%= Html.ActionLink("Importar Plan Existente", "EstimadoRapido", "Planificacion", new { option = "2", txtCodigo = ViewData["codProy"] }, null)%>
                    <input type="submit" value="Generar Plan" />
                    <input type="hidden" name="txtCodProyAct" id="txtCodProyAct" value="<%: ViewData["codProy"]%>" />
                </fieldset>
            </div>
            <% } %>
        </div>
    </div>
</asp:Content>
