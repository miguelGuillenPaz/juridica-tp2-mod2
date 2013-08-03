<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<DemoMVC.Models.ActividadHist>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	DetallePlanHistorico
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Planificación de Proyectos > Detalle Plan Historico</h2>
    <hr/>
    <p>
        Detalle de Cronograma Histórico para asignar como plantilla al proyecto - PROY<b><%: ViewData["codProy"] %></b>:
    </p>
    <% using (Html.BeginForm()) { %>
       <input type="hidden" id="txtCodProyAct" name="txtCodProyAct" value='<%: ViewData["codProy"]%>' />
       <input type="hidden" id="txtCodProyHis" name="txtCodProyHis" value='<%: ViewData["codProyHist"]%>' />
    <div>
      <table border="0">
			<tr>
			   <td border="0" width="200px" >Duración Total de Proyecto:</td><td border=0><%: ViewData["durProyAct"]%> meses</td>
			</tr>
			<tr>
			   <td border="0" width="200px" >Presupuesto Proyectado:</td><td border=0><%: ViewData["monPresProyAct"]%> <%: ViewData["presProyAct"]%></td>
			</tr>
			<tr>
			   <td border="0" width="200px" >Duración Proyecto Histórico:</td><td border=0><%: ViewData["durProyHist"]%> meses</td>
			</tr>
			<tr>
			   <td border="0" width="200px" >Presupuesto Histórico:</td><td border=0><%: ViewData["monPresProyHist"]%> <%: ViewData["presProyHist"]%></td>
			</tr>
      </table>
    </div>
    <br/>
    <div class="editor-field">
	    <table id='Tabla1' >
			  <tr>
			    <th>Id</th>
			    <th>Entregable</th>
			    <th>Actividad</th>
			    <th>Duración</th>
                <th>Comienzo</th>
			    <th>Fin</th>
		        <th>Predecesores</th>		
    		  </tr>
              <% 
                  if (Model != null) { 
                  foreach (var item in Model) { %>
			      <tr>
			        <td><%: item.corAct %></td>
			        <td>
                    <% if (item.codEnt == 1) {%>
                           Entregable 1 WBS
                    <%   } %>
                    <% if (item.codEnt == 2) {%>
                           Entregable 2 WBS
                    <%   } %>
                    <% if (item.codEnt == 3) {%>
                           Entregable 3 WBS
                    <%   } %>
                    <% if (item.codEnt == 4) {%>
                           Entregable 4 WBS
                    <%   } %>
                    <% if (item.codEnt == 5) {%>
                           Entregable 5 WBS
                    <%   } %>
                    <% if (item.codEnt == 6) {%>
                           Entregable 6 WBS
                    <%   } %>
                    <% if (item.codEnt == 7) {%>
                           Entregable 7 WBS
                    <%   } %>
                    </td>
                    <td><%: item.desAct %></td>
                    <td>n días</td>
                    <td><%: item.feciniAct %></td>
                    <td><%: item.fecfinAct %></td>
                    <td><%: item.preAct %></td>
    		      </tr>
                  <% } %>
              <% } %>
        </table>
        <br/><br/>
        <input type="submit" value="Asignar a Proyecto Actual" />
         &nbsp;<%: Html.ActionLink("Regresar a Proyecto Actual", "CrearPlan", "Planificacion", new { codProy = ViewData["codProy"] },null)%>
        <br/><br/><center><b><%: ViewData["msg"]%></b></center><br/>
    </div>
    <% } %>	 
</asp:Content>
