<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Plan de Abastecimiento
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="../../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <%--<script src="../../Scripts/jquery-1.4.1.js" type="text/javascript" />--%>
    <%--<script src="../../Scripts/jquery-1.4.1-vsdoc.js" type="text/javascript" />--%>
    <%--
        var listaPlan = ViewData["listaPlan"] as List<appGYM.Models.GYM_Plan>;

    --%>
    
    <%--Titulo de la Pagina--%>
    <h2>Plan de Abastecimiento</h2>


    <form id="listaPlanAba" action="" method="get">
    <%--
    <%: @Html.ActionLink("Crear", "CrearPlanAba", "Compras")%>
    <%: @Html.ActionLink("Modificar", "ModificarPlanAba", "Compras")%>
    <%: @Html.ActionLink("Eliminar", "EliminarPlanAba", "Compras")%>
    --%>
    <table>
        <thead>
            <th>
            </th>
            <th>
                Nombre
            </th>
            <th>
                Descripcion
            </th>
            <th>
                Fecha Inicio
            </th>
            <th>
                Fecha Fin
            </th>
        </thead>
        <tbody>
            <tr>
                <td>
                    <input type="checkbox" name="chk[]" />
                </td>
                <td>
                    Plan A
                </td>
                <td>
                    Descr A
                </td>
                <td>
                    01/01/2013
                </td>
                <td>
                    30/01/2013
                </td>
            </tr>
            <tr>
                <td>
                    <input type="checkbox" name="chk[]" />
                </td>
                <td>
                    Plan B
                </td>
                <td>
                    Descr B
                </td>
                <td>
                    01/01/2013
                </td>
                <td>
                    30/01/2013
                </td>
            </tr>
            <tr>
                <td>
                    <input type="checkbox" name="chk[]" />
                </td>
                <td>
                    Plan C
                </td>
                <td>
                    Descr C
                </td>
                <td>
                    01/01/2013
                </td>
                <td>
                    30/01/2013
                </td>
            </tr>
            <%--
            <% foreach (var elemento in listaPlan)
               {
            %>
            <tr>
                <td>
                    <input type="checkbox" name="chk[]" value="<%= elemento.nombre %>" />
                </td>
                <td>
                    <%= elemento.id %>
                </td>
                <td>
                    <%= elemento.nombre %>
                </td>
                <td>
                    01/01/2013
                </td>
                <td>
                    30/01/2013
                </td>
            </tr>
            <% } %>
            --%>
        </tbody>
        <tfoot>
            <%--area de botones--%>
            <tr>
                <td colspan="4">
                    <input type="button" id="btnCrear" value="Crear" onclick="location.href='<%: Url.Action("infoPlanAba", "Compras") %>'" />
                    <input type="button" id="btnModificar" value="Modificar" />
                    <input type="button" id="btnEliminar" value="Eliminar" />
                </td>
            </tr>
        </tfoot>
    </table>

    </form>

    <%--area javascript--%>
    <script type="text/javascript">

        //boton "Modificar"
        $("#btnModificar").click(function () {

            var atLeastOneIsChecked = $('input[name="chk[]"]:checked').length > 0;

            if (atLeastOneIsChecked) {
                alert("OK");

            }
            else {
                alert("Seleccione el registro que desea modificar");
            }

        });

        //boton "Eliminar"
        $("#btnEliminar").click(function () {

            var atLeastOneIsChecked = $('input[name="chk[]"]:checked').length > 0;

            if (atLeastOneIsChecked) {
                alert("OK");

            }
            else {
                alert("Seleccione el registro que desea eliminar");
            }

        });

    </script>


</asp:Content>
