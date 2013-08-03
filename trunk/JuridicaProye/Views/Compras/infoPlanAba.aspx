<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Información de Plan de Abastecimiento
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="../../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <form id="form1" runat="server">
    <table width="100%">
        <thead>
            <tr>
                <th colspan="3">
                    Información del Plan de Abastecimiento
                </th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td colspan="3">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    Nombre:
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    Descripción:
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" TextMode="MultiLine" Height="100" Width="300" />
                </td>
            </tr>
            <tr>
                <td>
                    Solicitud Adquisición:
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    <asp:TextBox ID="TextBox3" runat="server" ReadOnly="True" />&nbsp;&nbsp;
                    <%: Html.ActionLink("Seleccionar Recursos...", "mainSolAdq", "Compras")%>
                </td>
            </tr>
            <tr>
                <td>
                    Fecha Inicio:
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    <input type="text" id="fechaIni" />
                </td>
            </tr>
            <tr>
                <td>
                    Fecha Fin:
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    <input type="text" id="fechaFin" />
                </td>
            </tr>
            <tr style="line-height: 1px">
                <td colspan="3">
                    &nbsp;
                </td>
            </tr>
            <%--INI Tabla Detalle PA--%>
            <tr>
                <td colspan="3">
                    <table width="80%">
                        <thead>
                            <tr>
                                <th colspan="6">
                                    Detalle del Plan de Abastecimiento
                                </th>
                            </tr>
                            <tr>
                                <th>
                                    &nbsp;
                                </th>
                                <th>
                                    Tipo
                                </th>
                                <th>
                                    Recurso
                                </th>
                                <th>
                                    Proveedor
                                </th>
                                <th>
                                    Descripción
                                </th>
                                <th>
                                    Cantidad
                                </th>
                                <th>
                                    Fecha de Entrega Est.
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <input type="checkbox" name="chk[]" value="" />
                                </td>
                                <td>
                                    Material
                                </td>
                                <td>
                                    Clavos
                                </td>
                                <td>
                                    Clavos 1 pulgada
                                </td>
                                <td>
                                    1000
                                </td>
                                <td>
                                    <input type="text" value="01-12-2013" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="checkbox" name="chk[]" value="" />
                                </td>
                                <td>
                                    Material
                                </td>
                                <td>
                                    Clavos
                                </td>
                                <td>
                                    Clavos 2 pulgas
                                </td>
                                <td>
                                    1000
                                </td>
                                <td>
                                    <input type="text" value="01-12-2013" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="checkbox" name="chk[]" value="" />
                                </td>
                                <td>
                                    Material
                                </td>
                                <td>
                                    Cemento
                                </td>
                                <td>
                                    500 kg de cemento
                                </td>
                                <td>
                                    0
                                </td>
                                <td>
                                    <input type="text" value="01-12-2013" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
            <%--FIN Tabla Detalle PA--%>
        </tbody>
        <tfoot>
            <%--area de botones--%>
            <tr>
                <td colspan="3">
                    <input type="button" id="btnGuardar" value="Guardar" />&nbsp;
                    <input type="button" id="btnEliminar" value="Eliminar" />&nbsp;
                    <input type="button" id="btnSalir" value="Salir" onclick="location.href='<%: Url.Action("mainPlanAba", "Compras") %>'" />
                </td>
            </tr>
        </tfoot>
    </table>
    </form>
    <%--area javascript--%>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#fechaIni").datepicker();
            $("#fechaFin").datepicker();
        });

        //boton "Quitar"
        $("#btnEliminar").click(function () {

            var atLeastOneIsChecked = $('input[name="chk[]"]:checked').length > 0;

            if (atLeastOneIsChecked) {
                alert("OK");

            }
            else {
                alert("Seleccione el registro que desea quitar");
            }

        });

    </script>
</asp:Content>
