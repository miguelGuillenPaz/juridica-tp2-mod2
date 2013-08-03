<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<DemoMVC.Models.Proyecto>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	ListadoProyPlan2
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>ListadoProyPlan2</h2>

    <table>
        <tr>
            <th></th>
            <th>
                codPro
            </th>
            <th>
                codTipPro
            </th>
            <th>
                codUbiDep
            </th>
            <th>
                codFluCaj
            </th>
            <th>
                codUbiProv
            </th>
            <th>
                codUbiDist
            </th>
            <th>
                nomPro
            </th>
            <th>
                feciniplaPro
            </th>
            <th>
                fecfinplaPro
            </th>
            <th>
                fecinireaPro
            </th>
            <th>
                fecfinreaPro
            </th>
            <th>
                priPro
            </th>
            <th>
                desPro
            </th>
            <th>
                razsocfacPro
            </th>
            <th>
                conpagPro
            </th>
            <th>
                monfacPro
            </th>
            <th>
                nrohojenvPro
            </th>
            <th>
                fechojenvPro
            </th>
            <th>
                estPro
            </th>
            <th>
                rucfacPro
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%: Html.ActionLink("Edit", "Edit", new { /* id=item.PrimaryKey */ }) %> |
                <%: Html.ActionLink("Details", "Details", new { /* id=item.PrimaryKey */ })%> |
                <%: Html.ActionLink("Delete", "Delete", new { /* id=item.PrimaryKey */ })%>
            </td>
            <td>
                <%: item.codPro %>
            </td>
            <td>
                <%: item.codTipPro %>
            </td>
            <td>
                <%: item.codUbiDep %>
            </td>
            <td>
                <%: item.codFluCaj %>
            </td>
            <td>
                <%: item.codUbiProv %>
            </td>
            <td>
                <%: item.codUbiDist %>
            </td>
            <td>
                <%: item.nomPro %>
            </td>
            <td>
                <%: item.feciniplaPro %>
            </td>
            <td>
                <%: item.fecfinplaPro %>
            </td>
            <td>
                <%: item.fecinireaPro %>
            </td>
            <td>
                <%: item.fecfinreaPro %>
            </td>
            <td>
                <%: item.priPro %>
            </td>
            <td>
                <%: item.desPro %>
            </td>
            <td>
                <%: item.razsocfacPro %>
            </td>
            <td>
                <%: item.conpagPro %>
            </td>
            <td>
                <%: item.monfacPro %>
            </td>
            <td>
                <%: item.nrohojenvPro %>
            </td>
            <td>
                <%: item.fechojenvPro %>
            </td>
            <td>
                <%: item.estPro %>
            </td>
            <td>
                <%: item.rucfacPro %>
            </td>
        </tr>
    
    <% } %>

    </table>

    <p>
        <%: Html.ActionLink("Create New", "Create") %>
    </p>

</asp:Content>

