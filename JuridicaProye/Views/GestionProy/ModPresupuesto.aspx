<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	ModPresupuesto
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h2>Gestión de Proyectos > Datos Presupuesto</h2>
    
    <% using (Html.BeginForm()) { %>
            <fieldset>
                <div class="editor-label">
		    <table border="0">
			<tr>
			   <td border="0" width="200px" >Cliente:</td><td border=0>Grupo Crédito</td>
			</tr>
			<tr>
			   <td border="0" width="200px" >Proyecto:</td><td border=0>Cento Contacto Comas</td>
			</tr>
			<tr>
			   <td border="0" width="200px" >Versión:</td><td border=0>1.0</td>
			</tr>
			<tr>
			   <td border="0" width="200px" >Importe:</td><td border=0>2,000,520</td>
			</tr>
			<tr>
			   <td border="0" width="200px" >Moneda:</td><td border=0>US$</td>
			</tr>
		     </table>
                </div>
		<br>
		<h3>Asignar Variables:</h3>
                <div class="editor-field">
			<table id='Tabla1' >
			  <tr>
			    <th>Variables</th>
			    <th>Porcentaje</th>
			    <th>Monto</th>
   			  </tr>
			  <tr>
			    <td>Material</td>
			    <td align="center">30</td>
			    <td>600,156</td>
   			  </tr>
			  <tr>
			    <td>Maquinaria</td>
			    <td align="center">25</td>
			    <td>500,130</td>
   			  </tr>
			  <tr>
			    <td>Personal</td>
			    <td align="center">25</td>
			    <td>500,130</td>
   			  </tr>
			  <tr>
			    <td>Otros Gastos</td>
			    <td align="center">20</td>
			    <td>400,104</td>
   			  </tr>
			  </table>
	</div>
    <br>
            </fieldset>
            <center><b><%: ViewData["Message"] %></b></center>
    <br>
    <input type="submit" value="Guardar" />&nbsp;&nbsp;
    <input type="submit" value="Cancelar" />&nbsp;&nbsp;
    <% } %>	    

</asp:Content>