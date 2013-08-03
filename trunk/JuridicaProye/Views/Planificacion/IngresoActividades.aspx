<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<DemoMVC.Models.Actividad>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    IngresoActividades
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="contenido-top">
        <div>
            <h1>
                Planificación de Proyectos > Nuevo Plan de Proyecto (Actividades)</h1>
            <p>
                Cree un nuevo Cronograma para el Plan de Proyecto en base a Actividades - PROY<%: ViewData["codProy"]%>:
            </p>
            <% using (Html.BeginForm())
               { %>
            <input type="hidden" id="txtCodPro" name="txtCodPro" value="<%: ViewData["codProy"]%>" />
            <input type="hidden" id="txtCodPlaPro" name="txtCodPlaPro" value="<%: ViewData["codPlanProy"]%>" />
            <input type="hidden" id="txtFecIniPro" name="txtFecIniPro" value="<%: ViewData["fechIniProy"]%>" />
            <input type="hidden" id="txtFecFinPro" name="txtFecFinPro" value="<%: ViewData["fechIniFin"]%>" />
            <input type="hidden" id="txtAccion" name="txtAccion" value="<%: ViewData["accion"]%>" />
            <fieldset>
                <div class="editor-label">
                    <table border="0">
                        <tr>
                            <td border="0" width="200px">
                                Fecha Inicio Proyecto:
                            </td>
                            <td border="0">
                                <%: ViewData["fechIniProy"]%>
                            </td>
                        </tr>
                        <tr>
                            <td border="0" width="200px">
                                Fecha Fin Proyecto:
                            </td>
                            <td border="0">
                                <%: ViewData["fechIniFin"]%>
                            </td>
                        </tr>
                        <tr>
                            <td border="0" width="200px">
                                Duración Proyectada Proyecto:
                            </td>
                            <td border="0">
                                6 meses
                            </td>
                        </tr>
                        <tr>
                            <td border="0" width="200px">
                                Duración Calculada:
                            </td>
                            <td border="0">
                                18 días
                            </td>
                        </tr>
                    </table>
                </div>
                <br>
                <h3>
                    Asignar Actividades:</h3>
                <div class="editor-field">
                    <table id='Tabla1'>
                        <tr>
                            <th>
                                Modificar
                            </th>
                            <th>
                                Eliminar
                            </th>
                            <th>
                                ID
                            </th>
                            <th>
                                Entregable
                            </th>
                            <th>
                                Actividad
                            </th>
                            <th>
                                Duración
                            </th>
                            <th>
                                Comienzo
                            </th>
                            <th>
                                Fin
                            </th>
                            <th>
                                Predecesores
                            </th>
                        </tr>
                        <% 
                   if (Model != null)
                   {
                       foreach (var item in Model)
                       { %>
                        <tr>
                            <td align="center">
                                <input type="checkbox" id='chk_<%: item.corAct %>' name='chk_<%: item.corAct %>' />
                            </td>
                            <td align="center">
                                <%: Html.ActionLink("Eliminar", "IngresoActividades", "Planificacion", new { codProy = item.corAct }, null)%>
                            </td>
                            <td>
                                <%: item.corAct %>
                            </td>
                            <td>
                                <input type="hidden" name='txt_Ent<%: item.corAct %>' id='txt_Ent<%: item.corAct %>'
                                    value='<%: item.codEnt %>' />
                                <select name='sel_Ent<%: item.corAct %>' id='sel_Ent<%: item.corAct %>'>
                                    <option>Entregable 01</option>
                                    <option>Entregable 02</option>
                                    <option>Entregable 03</option>
                                </select>
                            </td>
                            <td>
                                <input type="text" name="txt_nomAct_<%: item.corAct %>" id="txt_nomAct_<%: item.corAct %>"
                                    value="<%: item.desAct %>" />
                            </td>
                            <td>
                                <input id="txt_dur<%: item.corAct %>" name="txt_dur<%: item.corAct %>" value='' size='10' />dias
                            </td>
                            <td>
                                <input id="txt_fecIni<%: item.corAct %>" name="txt_fecIni<%: item.corAct %>" value='<%: item.feciniAct %>'
                                    size='10' />
                            </td>
                            <td>
                                <input id="txt_fecFin<%: item.corAct %>" name="txt_fecFin<%: item.corAct %>" value='<%: item.fecfinAct %>'
                                    size='10' />
                            </td>
                            <td>
                                <input type="text" id="txt_Pred<%: item.corAct %>" name="txt_Pred<%: item.corAct %>"
                                    value='<%: item.preAct %>' size='10' />
                            </td>
                        </tr>
                        <% } %>
                        <% } %>
                    </table>
                </div>
                <br>
            </fieldset>
            <center>
                <b>
                    <%: ViewData["Message"] %></b></center>
            <br>
            <input type="button" value="Adicionar Actividad" onclick="javascript:fAccion(1)" />&nbsp;&nbsp;
            <input type="button" value="Guardar Cambios" onclick="javascript:fAccion(2)" />&nbsp;&nbsp;
            <input type="button" value="Crear Plan" onclick="javascript:fAccion(4)" />&nbsp;&nbsp;
            <input type="button" value="Exportar a Excel" />&nbsp;&nbsp;
            <% } %>
            <script type='text/javascript'>

                function fAccion(nroAccion) {
                    document.getElementById("txtAccion").value = nroAccion;
                    document.forms[0].submit();
                };

            </script>
        </div>
    </div>
</asp:Content>
