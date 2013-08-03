<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Información del Recurso
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="../../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <form id="form1" runat="server">
    <table width="100%">
        <thead>
            <tr>
                <th colspan="3">
                    Información del Recurso
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
                    Tipo:
                </td>
                <td>
                    <select>
                        <option value="MAT">Material</option>
                        <option value="MAQ">Maquinaria</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    Recurso:
                </td>
                <td>
                    <select>
                        <option value="">Clavo</option>
                        <option value="">Madera</option>
                        <option value="">Fierro</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    Proveedor:
                </td>
                <td>
                    <select>
                        <option value="">Ninguno</option>
                        <option value="">Prov A</option>
                        <option value="">Prov B</option>
                        <option value="">Prov C</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    Descripción:
                </td>
                <td>
                    <textarea rows="5" cols="20"></textarea>
                </td>
            </tr>
            <tr>
                <td>
                    Cantidad:
                </td>
                <td>
                    <input type="text" id="txtCantidad" />
                </td>
            </tr>
            <tr style="line-height: 1px">
                <td colspan="3">
                    &nbsp;
                </td>
            </tr>
        </tbody>
        <tfoot>
            <%--area de botones--%>
            <tr>
                <td colspan="3">
                    <input type="button" id="btnGuardar" value="Guardar" />&nbsp;
                    <input type="button" id="btnSalir" value="Salir" onclick="location.href='<%: Url.Action("mainItemsSolAdq", "Compras") %>'" />
                </td>
            </tr>
        </tfoot>
    </table>
    </form>
    <%--area javascript--%>
    <%--
    <script type="text/javascript">
        $(document).ready(function () {
            $("#fechaMin").datepicker();
        });
    --%>

    </script>
</asp:Content>
