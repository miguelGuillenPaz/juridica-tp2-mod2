<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Presupuesto
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h2>Gestión de Proyectos > Presupuestos</h2>
 
     <% using (Html.BeginForm()) { %>
            <fieldset>
                <div class="editor-label">
		    <table border="0">
			<tr>
			   <td border="0" width="200px" >Cliente:</td><td border=0>Grupo Crédito</td>
			</tr>
			<tr>
			   <td border="0" width="200px" >Proyecto:</td><td border=0>Centro Contacto Comas</td>
			</tr>
		     </table>
                </div>
		<br>
		<h3>Presupuestos:</h3>
                <div class="editor-field">
			<table id='Tabla1' >
			  <tr>
			    <th>Estado</th>
			    <th>Fecha</th>
			    <th>Fecha Ingreso</th>
			    <th>Version</th>
			    <th>Importe</th>
			    <th>Moneda</th>
   			  </tr>
			  <tr>
			    <td>En Proceso</td>
			    <td>13/05/2013</td>
			    <td>10/05/2013</td>
			    <td align = "center">1.0</td>
			    <td align = "right">2,000,520</td>
			    <td align = "center">US$</td>
   			  </tr>
			    <td>Aprobado</td>
			    <td>14/05/2013</td>
			    <td>10/05/2013</td>
			    <td align = "center">1.0</td>
			    <td align = "right">2,000,520</td>
			    <td align = "center">US$</td>
			  </table>
	</div>
    <br>
            </fieldset>
            <center><b><%: ViewData["Message"] %></b></center>
    <br>
    <input type="submit" value="Crear" />&nbsp;&nbsp;
    <input type="submit" value="Modificar" />&nbsp;&nbsp;
    <input type="submit" value="Visualizar" />&nbsp;&nbsp;
    <input type="submit" value="Anular" />&nbsp;&nbsp;
    <input type="submit" value="Versionar" />&nbsp;&nbsp;
    <input type="submit" value="Cancelar" />&nbsp;&nbsp;
    <% } %>	    

</asp:Content>