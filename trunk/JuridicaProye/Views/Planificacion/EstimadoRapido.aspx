<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DemoMVC.Models.EstimadoRapidoForm>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	EstimadoRapido
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Planificación de Proyectos > Estimación Rápida</h2>
     <p>
       Por favor, seleccione un tipo de consulta (Planes de Proyecto Histórico) para la estimación: PROY<b><%: ViewData["codProy"]%></b>
    </p>
     <% using (Html.BeginForm()) { %>
       <input type="hidden" id="txtCodProy" name="txtCodProyAct" value='<%: ViewData["codProy"]%>' />
       <input type="hidden" id="txtAccion"  name="txtAccion" value='<%: ViewData["accion"]%>' />
            <fieldset>
                <div class="editor-label">
		    <table border="0">
			<tr>
			   <td border="0" width="200px" >Por Duración de Proyecto:</td>
               <td><input name="cantDuracion" size="10"></td>
               <td border="0"><input type="radio" name="duracionD" id="duracionD"> Días</td>
               <td border="0"><input type="radio" name="duracionM" id="duracionM"> Meses</td>
               <td border="0"><input type="radio" name="duracionA" id="duracionA"> Años</td>
			</tr>

            <tr>
			   <td border="0" width="200px" >Por Tipo de Proyecto:</td>
               <td border="0" colspan="4"><select name='tipo'>

               <% if (Model.ListadoTipoProyecto != null) {
                      foreach (DemoMVC.Models.TipoProyecto item in Model.ListadoTipoProyecto)  { %>
                        <option value='<%= item.codTipPro %>'><%= item.nomTipPro %></option>
               <% }%>
            <% }%>
                    </select></td>
			</tr>
            <tr>
			   <td border="0" width="200px" >Por Prioridad:</td>
               <td border="0" colspan="4"><select name='prioridad'>
                        <option value="1">Alta</option>
                        <option value="2" >Media</option>
                        <option value="3">Baja</option>
                    </select></td>
			</tr>
            <tr>
			   <td width="200px" >Por Rango de Presupuesto:</td>
               <td colspan="4">
               <select name='presupuesto'>
               <option>0 - 50 000</option> 
               <option>50 001 - 10 000</option> 
               <option>10 001 - 80 000</option>
               <option>80 001 - más</option>
               </select></td>
			</tr>			
            <tr>
			   <td border="0" width="200px" >Por Ubigeo:</td>
               <td border="0">
               <select name='departamento'>
               <% if (Model.ListadoUbigeoDep != null) {
                      foreach (DemoMVC.Models.Ubigeo item in Model.ListadoUbigeoDep)  { %>
                        <option value='<%= item.codUbiDep %>' <%= item.selected %> ><%= item.nomUbiDep %></option>
                  <% }%>
               <% }%>
               </select></td>
               <td border="0">
               <select name='provincia'>
               <% if (Model.ListadoUbigeoProv != null) {
                      foreach (DemoMVC.Models.Ubigeo item in Model.ListadoUbigeoProv)  { %>
                        <option value='<%= item.codUbiProv %>' <%= item.selected %> ><%= item.nomUbiProv %></option>
                  <% }%>
               <% }%>
               </select></td>
               <td border="0">
               <select name='distrito'>
               <% if (Model.ListadoUbigeoDist != null) {
                      foreach (DemoMVC.Models.Ubigeo item in Model.ListadoUbigeoDist)  { %>
                        <option value='<%= item.codUbiDist %>' <%= item.selected %> ><%= item.nomUbiDist %></option>
                  <% }%>
               <% }%>
               </select></td>
			</tr>
		     </table>
             <br/>
             <center><input type="submit" value="Buscar" /></center>
             <br/>
             Resultados de la búsqueda: <%: ViewData["totReg"] %>
                <div class="editor-field">
			<table id='Tabla1' >
			  <tr>
			    <th>Código Proyecto</th>
			    <th>Nombre Proyecto</th>
			    <th>tipo Proyecto</th>
                <th>Fecha Inicio</th>
			    <th>Fecha Fin</th>
			    <th>Presupuesto</th>
		        <th>Ver Detalle</th>		
    		  </tr>
              <% 
                  if (Model.ListadoProyectoHist != null) { 
                  foreach (DemoMVC.Models.ProyectoHist item in Model.ListadoProyectoHist) { %>
			      <tr>
			        <td align="center">PROY<%: item.codPro %></td>
			        <td><%: item.nomPro %></td>
			        <td><%: item.tipoProyecto%></td>
			        <td><%: item.feciniplaPro %></td>	
			        <td><%: item.fecfinplaPro %></td>
			        <td><%: item.monfacPro %> <%: item.presupuesto %></td>
			        <td align="center">
                    <%: Html.ActionLink("Crear", "DetallePlanHistorico", "Planificacion", new { codProyAct = ViewData["codProy"], codProyHist = item.codPro }, null)%></td>
    		      </tr>
                  <% } %>
              <% } %>
              </table>

                </div>
           </fieldset>
      <% } %>	    


</asp:Content>
