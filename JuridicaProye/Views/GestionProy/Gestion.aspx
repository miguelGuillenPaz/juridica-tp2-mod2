<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Gestion
</asp:Content>

<asp:Content ID="ContentPlan" ContentPlaceHolderID="MainContent" runat="server">

        <h2>Gestión de Proyectos > Actualizar Presupuesto</h2>
    <p>
        Por favor, seleccione un proyecto:
    </p>
    <% using (Html.BeginForm()) { %>
            <fieldset>
		<hr>
                <div class="editor-label">
                    <label for="UserName">Cliente:</label>&nbsp;&nbsp;<input id="UserName" name="UserName" type="text" value="Grupo Crédito" />
		    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	            <input type="submit" value="Buscar" />
                </div>
		<hr><br><br>
		Resultados de la búsqueda: 4
                <div class="editor-field">
			<table id='Tabla1' >
			  <tr>
			    <th>Proyecto</th>
			    <th>Fecha Ingreso</th>
			    <th>Importe</th>
			    <th>Moneda</th>
   			  </tr>
			  <tr>
			    <td>Centro Contacto Comas</td>
			    <td>10/05/2013</td>	
			    <td>2,000,520</td>
			    <td>S/.</td>
   			  </tr>
			  <tr>
			    <td>Tienda San Miguel 2</td>
			    <td>12/05/2013</td>	
			    <td>1,548,842</td>
			    <td>US$</td>
   			  </tr>
			  <tr>
			    <td>Condominio Salamanca</td><
			    <td>13/05/2013</td>	
			    <td>4,256,585</td>
			    <td>S/.</td>
   			  </tr>
			  <tr>
			    <td>Colegio San Juan</td>
			    <td>16/05/2013</td>	
			    <td>7,548,896</td>
			    <td>US$</td>
   			  </tr>
			</table>
		</div>
        <br>
            <input type="submit" value="Visualizar" />&nbsp;&nbsp;
            <input type="submit" value="Cancelar" />
            </fieldset>
        </div>
    <% } %>	    

</asp:Content>
