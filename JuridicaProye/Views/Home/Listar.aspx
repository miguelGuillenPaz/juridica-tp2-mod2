<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DemoMVC.Models.ListarForm>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Listar
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Listar</h2>


    <% foreach (DemoMVC.Models.Cliente elemento in Model.ListadoClientesTipo1)
       { %>

       <%= elemento.Nombre %> <br />

    <% } %>

    
    <br />
    <br />
    <br />
    <br />
    <br />


    <% foreach (DemoMVC.Models.Cliente elemento in Model.ListadoClientesTipo2){ %>

       <%= elemento.Nombre %> <br />

    <% }%>



</asp:Content>
