<%--<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<ModuloFinanciero.Models.Presupuesto>>" %>
--%>

<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Página principal
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript" >
        var tipoDeCambio = 2.6;

        function calcularMontos(widgetMontoAsignado, montoPresupuestado, nombreInputMontoFinanciar, nombreInputMontoCalculado) {
            var montoAFinanciar = montoPresupuestado - widgetMontoAsignado.value;
            var montoCalculado = montoAFinanciar * tipoDeCambio;

            document.getElementById(nombreInputMontoFinanciar).value = montoAFinanciar;
            document.getElementById(nombreInputMontoCalculado).value = montoCalculado;

        }

    </script>

    <form id="form1" runat="server">
    <h2><%: ViewData["Message"] %>
        
    </h2>

    
    <div id="PanelCabecera" style="border-color:Silver;border-width:1px;border-style:Solid;height:35px;width:900px; padding:10px">
        <table style="border-style:none;width:900px" >
            <tr>
                <td style="border-style:none"><strong>Código:</strong></td>
                <td style="border-style:none"><input type="text" disabled="disabled" value="1001" style="width: 60px;" /></td>
                <td style="border-style:none"><strong>Fecha</strong></td>
                <td style="border-style:none"><input type="text" disabled="disabled" value="01/06/2013" style="width: 80px;" /></td>
                <td style="border-style:none"><strong>Tipo de moneda</strong></td>
                <td style="border-style:none"><select id="tipoDeMoneda" >
                <option value="0">Seleccione</option>
                <option value="0001">Soles</option>
                <option value="0002">Dolares</option>
                </select></td>
                <td style="border-style:none"><strong>Monto Total Calculado</strong></td>
                <td style="border-style:none"><input type="text" disabled="disabled" id="montoTotalCalculadoAsignacion" maxlength="10" size="10" style="width: 80px;" /></td>
            </tr>
        </table>
    </div>
    <br />
    <input type="button" value="Guardar" />
    <input type="button" value="Cancelar" />
    <br />
    <br />
    <div id="PanelContenido" style="border-color:Silver;border-width:1px;border-style:Solid;height:324px;width:900px;overflow-y:scroll; padding:10px" >
        <strong>Detalle de Asignación </strong><br />
        <br />
        <br />
    
    <table>
        <tr>
                <th>Presupuesto</th>
                <th>Moneda</th>
                <th>Monto <br /> Presupuestado</th>
                <th>Para asignar</th>
                <th>Para financiar</th>
                <th>Monto cálculado</th>
                <th>Observaciones</th>
                <th>Seleccionar</th>
        </tr>
    
    <%--
    <% foreach (var item in Model) { %>
    
        <tr>

            <td>
                <%: item.codPre %>
            </td>
            <td>
                Dolares
            </td>
            <td style="text-align:right">
                <%: String.Format("{0:F}", item.monPre) %>
            </td>
            <td>
                <input type="text" id="montoAsignar_<%: item.codPre %>" maxlength="10" size="10" onblur="javascript:calcularMontos(this, <%: String.Format("{0:F}", item.monPre) %>,'montoAfinanciar_<%: item.codPre %>','montoACalcular_<%: item.codPre %>');"  />
            </td>
            <td>
                <input type="text" disabled="disabled" id="montoAfinanciar_<%: item.codPre %>" maxlength="10" size="10" />
            </td>
            <td>
                <input type="text" disabled="disabled" id="montoACalcular_<%: item.codPre %>" maxlength="10" size="10" />
            </td>
            <td>
            <textarea rows="2" cols="15" id="observaciones">
            
            </textarea>
                
            </td>
            <td>
                <input type="checkbox" id="seleccionar_<%: item.codPre %>"  />
            </td>
        </tr>
    
    <% } %>--%>

      <tr>

            <td>
                1001
            </td>
            <td>
                Dolares
            </td>
            <td style="text-align:right">
                15000.00
            </td>
            <td>
                <input value="1" id="montoAsignar_1001" maxlength="10" size="10" onblur="javascript:calcularMontos(this, 15000.00,'montoAfinanciar_1001','montoACalcular_1001');" type="text" style="width: 80px;text-align:right">
            </td>
            <td>
                <input value="" disabled="disabled" id="montoAfinanciar_1001" maxlength="10" size="10" type="text" style="width: 80px;text-align:right">
            </td>
            <td>
                <input value="" disabled="disabled" id="montoACalcular_1001" maxlength="10" size="10" type="text" style="width: 80px;text-align:right">
            </td>
            <td>
            <textarea rows="2" cols="15" id="observaciones">            
            </textarea>
                
            </td>
            <td>
                <input id="seleccionar_1001" type="checkbox">
            </td>
        </tr>
    
    
    
        <tr>

            <td>
                1002
            </td>
            <td>
                Dolares
            </td>
            <td style="text-align:right">
                30000.00
            </td>
            <td>
                <input value="2" id="montoAsignar_1002" maxlength="10" size="10" onblur="javascript:calcularMontos(this, 30000.00,'montoAfinanciar_1002','montoACalcular_1002');" type="text" style="width: 80px;text-align:right">
            </td>
            <td>
                <input value="" disabled="disabled" id="montoAfinanciar_1002" maxlength="10" size="10" type="text" style="width: 80px;text-align:right">
            </td>
            <td>
                <input value="" disabled="disabled" id="montoACalcular_1002" maxlength="10" size="10" type="text" style="width: 80px;text-align:right">
            </td>
            <td>
            <textarea rows="2" cols="15" id="observaciones">            
            </textarea>
                
            </td>
            <td>
                <input id="seleccionar_1002" type="checkbox">
            </td>
        </tr>

    </table>

    </div>

     <br />
     <br />

     <div id="MainContent_Panel3" style="border-color:Silver;border-width:1px;border-style:Solid;height:83px;width:900px; padding:10px">
     <strong>Observaciones </strong><br />
        <textarea rows="3" cols="108" id="Textarea1">
            
            </textarea>
    </div>



    </form>


</asp:Content>


