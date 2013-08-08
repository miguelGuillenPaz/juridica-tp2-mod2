<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DemoMVC.Models.Requerimiento>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	DetalleRequerimiento
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeaderContent" runat="server">
    <link href="../../Content/legal.css" rel="stylesheet" type="text/css" />
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<section id="seccionReqLegal">
    <h1>Detalle del Requerimiento</h1>
    <% using (Html.BeginForm())
       { %>
       <div class="fila">
            <div class="col2 paddingTop">
                Requerimiento: 
            </div>
            <div class="col4">
                <input id="txtCodSolicitud" name="txtCodSolicitud" type="text" 
                value="<%: ViewData["idReq"] %> " readonly="readonly" class="text3"/>
            </div>
       </div>
       <div class ="fila">
            <div class="col2 paddingTop">
                Proyecto: 
            </div>
            <div class="col4">    
                <input id="txtProyecto" name="txtProyecto" type="text" 
                value="<%: ViewData["Proyecto"] %>" readonly="readonly" class="text2"/>
            </div>
       </div>
       <div class="fila">
            <div class="col2 paddingTop">
                Tipo de Requerimiento: 
            </div>
            <div class="col4">
                <input id="txtTipoReq" name="txtTipoReq" type="text" 
                value="<%: ViewData["tipoReq"] %>" readonly="readonly" class="text1"/>
            </div>
       </div>
       <div class="fila">
            <div class="col2 paddingTop">
                Estado: 
            </div>
            <div class="col4">
             <input id="txtEstado" name="txtEstado" type="text" 
                value="<%: ViewData["estado"] %>" readonly="readonly" class="text1"/>
            </div>
       </div>
       <div class="fila">
            <div class="col2 paddingTop">
                Descripción: 
            </div>
            <div class="col4">
              <input id="Text1" name="txtEstado" type="text" 
                value="<%: ViewData["descripcion"] %>" readonly="readonly" class="text2"/>
            </div>
       </div>

    <% } %>

</section>
</asp:Content>

