<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<DemoMVC.Models.Requerimiento>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Requerimientos
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeaderContent" runat="server">
    <link href="../../Content/legal.css" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1" runat="server">
<section id="seccionReqLegal">
    <h1>Listado de Requerimientos</h1>
    <br />
    <% using (Html.BeginForm())
       { %>
    <div class="editor-label">
    <div class="fila">
        <div class="col2 paddingTop">
            <label for="Username">Solicitud:</label>
        </div>
        <div class="col6">
            <input id="txtCodSolicitud" name="txtCodSolicitud" type="text" value=""/>
        </div>
        <div class="col1 paddingTop">
           Por estado
        </div>

        <div class="col4 final">
               <%: Html.DropDownList("codEstado", (SelectList)ViewData["Estado"])  %>
        </div>
    </div>
    <div class="fila">
        <div class="col2 paddingTop">
            Proyecto  
        </div> 
        <div class="col6">    
            <%: Html.DropDownList("codPro", (SelectList)ViewData["Proyectos"])  %>
        </div>
        <div class="col1 paddingTop">
           Fecha inicio:
        </div>

        <div class="col4 final">
               <input id="txtFecIni" name="txtFecIni" type="text" value="01/01/2013"/>
        </div>
    </div>
    <div class="fila">
    <div class="col2 paddingTop">
            Tipo de requerimiento:
    </div>
    <div class="col6">        
            <%: Html.DropDownList("codTipoReq", (SelectList)ViewData["TipoReq"])  %>
    </div>
    <div class="col1 paddingTop">
           Fecha fin:
        </div>

        <div class="col4 final">
               <input id="txtFecFin" name="txtFecFin" type="text" value="31/12/2013"/>
        </div>
    </div>
     <div class="fila">
     <p><input type="submit" value="Buscar Requerimiento"/></p>
    </div>
    </div>

    <div id="editor-field">
    <table id="Tabla1">
        <tr>
            <th>Solicitud</th>
            <th>Proyecto</th>
            <th>Tipo de Requerimiento</th>
            <th>Estado</th>
            <th>Fecha de Solicitud</th>
            <th>Detalle</th>
        </tr>
        <%
            if (Model != null)
            {
                foreach (var item in Model)
                {%>
                <tr>
                    <td><%: item.idReq%></td>
                    <td><%: item.desProyecto%></td>
                    <td><%: item.descTipoReq%></td>
                    <td><%: item.desEstado%></td>
                    <td><%: string.Format("{0:yyyy-MM-dd}",item.fecha)%></td>
                     <td align="center">
                    <%: Html.ActionLink("Ver Detalle", "DetalleRequerimiento", "Legal", new { idRequerimiento = item.idReq }, null)%></td>
                </tr>         
                
           
               
           
           <% } %>
    <% } %>
    </table>
    </div>
    <% } %>
    </section>
    </form>
</asp:Content>
