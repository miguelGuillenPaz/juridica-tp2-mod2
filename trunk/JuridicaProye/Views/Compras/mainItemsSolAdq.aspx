<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Detalle de la Solicitud de Adquisición
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1" runat="server">
    <table width="100%">
        <thead>
            <tr>
                <th colspan="2">
                    Detalle de la Solicitud de Adquisición
                </th>
            </tr>
        </thead>
        <tbody>
            <tr style="line-height: 1px">
                <td colspan="2">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    Código:
                </td>
                <td>
                    <input type="text" id="txtCodigo" />
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
                    <table width="100%">
                        <thead>
                            <tr>
                                <th colspan="6">
                                    Listado de Recursos
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
                                    Proveedor A
                                </td>
                                <td>
                                    Clavos 1 pulgada
                                </td>
                                <td>
                                    1000
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
                                    Proveedor B
                                </td>
                                <td>
                                    Clavos 2 pulgadas
                                </td>
                                <td>
                                    500
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
                                    Proveedor C
                                </td>
                                <td>
                                    500 kg de cemento
                                </td>
                                <td>
                                    0
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
                    <input type="button" id="btnAgregarAPlan" value="Agregar a Plan" onclick="location.href='<%: Url.Action("infoPlanAba", "Compras") %>'" />&nbsp;
                    <input type="button" id="btnAgregar" value="Agregar Recurso" onclick="location.href='<%: Url.Action("infoItemSolAdq", "Compras") %>'" />&nbsp;
                    <input type="button" id="btnModificar" value="Modificar Recurso" />&nbsp;
                    <input type="button" id="btnEliminar" value="Eliminar Recurso" />&nbsp;
                    <input type="button" id="btnSalir" value="Salir" onclick="location.href='<%: Url.Action("mainSolAdq", "Compras") %>'" />
                </td>
            </tr>
            <%--FIN area de botones--%>
        </tfoot>
    </table>
    </form>
</asp:Content>
