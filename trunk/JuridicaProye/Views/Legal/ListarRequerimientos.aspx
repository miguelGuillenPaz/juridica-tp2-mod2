<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<DemoMVC.Models.Requerimiento>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Requerimientos
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeaderContent" runat="server">
    <link href="../../Content/legal.css" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<section id="seccionReqLegal">
    <h2>Requerimientos</h2>
    <br />
    <% using (Html.BeginForm())
       { %>
    <div class="editor-label">
    <label for="Username">Por solicitud:</label><input id="txtCodSolicitud" name="txtCodSolicitud" type="text" value=""/>
    <br /><br />
    <p>Por Proyecto   
     <%: Html.DropDownList("codPro", (SelectList)ViewData["Proyectos"])  %></p>
     <br />
     <p>Por Tipo de requerimiento:
     <%: Html.DropDownList("codTipoReq", (SelectList)ViewData["TipoReq"])  %>
     </p>
     <br />
     <p><input type="submit" value="Buscar Requerimiento"/></p>
    </div>
    <br />
    <div class="editor-field">
    <table id="Tabla1">
        <tr>
            <th>Solicitud</th>
            <th>Proyecto</th>
            <th>Tipo de Requerimiento</th>
            <th>Estado</th>
        </tr>
        <%
            if (Model != null)
            {
                foreach (var item in Model)
                {%>
                <tr>
                    <td><%: item.idReq%></td>
                    <td><%: item.desProyecto%></td>
                    <td><%: item.idTipoRequerimiento%></td>
                </tr>         
                
           
               
           
           <% } %>
    <% } %>
    </table>
    </div>
    <% } %>
    </section>
</asp:Content>
