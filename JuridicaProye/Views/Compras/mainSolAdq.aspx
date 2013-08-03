<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Solicitud de Adquisición 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <script src="../../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>

    <form id="form1" runat="server">
    <table width="100%">
        <thead>
            <tr>
                <th colspan="2">
                    Solicitud de Adquisición
                </th>
            </tr>
        </thead>
        <tbody>
            <tr style="line-height: 1px">
                <td colspan="3">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    Número:
                </td>
                <td>
                    <input type="text" id="txtNumero" />
                </td>
            </tr>
            <tr>
                <td>
                    Descripción:
                </td>
                <td>
                    <input type="text" id="txtDesc" />
                </td>
            </tr>
            <tr>
                <td>
                    Fecha Inicio:
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
                    <input type="text" id="fechaFin" />&nbsp;

                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="button" id="btnBuscar" value="Buscar" />&nbsp;
                </td>
            </tr>
            <tr style="line-height: 1px">
                <td colspan="2">
                    &nbsp;
                </td>
            </tr>
            <%--INI Lista Items--%>
            <tr>
                <td colspan="2">
                    <table width="80%">
                        <thead>
                            <tr>
                                <th colspan="5">
                                    Listado de Solicitudes
                                </th>
                            </tr>
                            <tr>
                                <th>
                                    &nbsp;
                                </th>
                                <th>
                                    Número
                                </th>
                                <th>
                                    Descripción
                                </th>
                                <th>
                                    Fecha Registro
                                </th>
                                <th>
                                    Estado
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <input type="checkbox" name="chk[]" value="" />
                                </td>
                                <td>
                                    1
                                </td>
                                <td>
                                    Proyecto A
                                </td>
                                <td>
                                    01-06-2013
                                </td>
                                <td>
                                    Pendiente
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="checkbox" name="chk[]" value="" />
                                </td>
                                <td>
                                    1
                                </td>
                                <td>
                                    Proyecto B
                                </td>
                                <td>
                                    01-06-2013
                                </td>
                                <td>
                                    Pendiente
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="checkbox" name="chk[]" value="" />
                                </td>
                                <td>
                                    1
                                </td>
                                <td>
                                    Proyecto C
                                </td>
                                <td>
                                    01-06-2013
                                </td>
                                <td>
                                    Atendido
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
            <%--FIN Lista Items--%>
        </tbody>
        <tfoot>
            <%--INI area de botones--%>
            <tr>
                <td colspan="3">
                    <input type="button" id="btnSelecc" value="Ver Detalle..." />&nbsp;
                    <input type="button" id="btnAgregarItem" value="Crear" />&nbsp;
                    <input type="button" id="btnModificarItem" value="Modificar" />&nbsp;
                    <input type="button" id="btnEliminar" value="Eliminar" />&nbsp;
                    <input type="button" id="btnSalir" value="Salir" onclick="location.href='<%: Url.Action("infoPlanAba", "Compras") %>'" />
                </td>
            </tr>
            <%--FIN area de botones--%>
        </tfoot>
    </table>
    </form>

    <%--INI javascript--%>
    <script type="text/javascript">

        //boton "Ver Items"
        $("#btnSelecc").click(function () {

            var atLeastOneIsChecked = $('input[name="chk[]"]:checked').length > 0;

            if (atLeastOneIsChecked) {
                alert("OK");
                window.location.href = '<%: Url.Action("mainItemsSolAdq", "Compras") %>';
            }
            else {
                alert("Seleccione el registro que desea ver su detalle");
            }

        });


    </script>
    <%--FIN javascript--%>

</asp:Content>

