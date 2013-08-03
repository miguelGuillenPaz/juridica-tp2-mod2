<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Registrar
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeaderContent" runat="server">
    <link href="../../Content/legal.css" rel="stylesheet" type="text/css" />
    <script src="../../Scripts/legal.js" type="text/javascript"></script>

    <script type="text/javascript">

        $("document").ready(function () {
            var bSuccess = '<%= TempData["bInsertSuccess"] %>';
            if (bSuccess) {
                alert("La solicitud de su requerimiento legal ha sido registrada.\nEspere por su atención.");
            }
        });

    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <section id="seccionReqLegal">
    
        <h1>Registrar Requerimiento Legal</h1>

        <%--<div class="msgConfirmacion"><%= TempData["MsgConfirmacion"]%></div>--%>

    <% using (Html.BeginForm())
       { %>
            <div class="fila">
                <div class="col1">Proyecto:</div>
                <div class="col2 final">
                   <%: Html.DropDownList("codPro", (SelectList)ViewData["Proyectos"])%></p>
                </div>
            </div>
        
            <div class="fila">
                <div class="col1">Descripción:</div>
                <div class="col2 final"><textarea id="txtDescripcion" name="txtDescripcion" cols="" rows=""></textarea></div>
            </div>
        
            <fieldset id="datosPersonas">
                <legend>Datos Carta Notarial</legend>
            
                <div class="fila">
                    <div class="col2 paddingTop">Tipo Edificación:</div>
                    <div class="col4">
                        <label for="optCAS"><input id="optCAS" name="optTipoEdif" type="radio" value="CAS" />Casa</label> &nbsp;
                        <label for="optCON"><input id="optCON" name="optTipoEdif" type="radio" value="CON" />Condominio</label>
                    </div>
                    <div class="col2 paddingTop">Nombre condominio:</div>
                    <div class="col4 final"><input id="txtNombreCondominio" name="txtNombreCondominio" type="text" class="text1" /></div>
                </div>
            
                <div class="fila">
                    <div class="col2 paddingTop">Nombres:</div>
                    <div class="col6"><input id="txtNombreVecino" name="txtNombreVecino" type="text" class="text1" /></div>
                    <div class="col1 paddingTop">Apellidos:</div>
                    <div class="col4 final"><input id="txtApellidoVecino" name="txtApellidoVecino" type="text" class="text1" /></div>
                
                </div>
            
                <div class="fila">
                    <div class="col2 paddingTop">Dirección:</div>
                    <div class="col6"><input id="txtDireccionVecino" name="txtDireccionVecino" type="text" class="text2" /></div>
                    <div class="col1 paddingTop">Distrito:</div>
                    <div class="col2 final">
                        <select id="cboDistrito">
                            <option value="0">Seleccionar</option>
                            <option value="1">Lima</option>
                            <option value="2">Callao</option>
                            <option value="3">Miraflores</option>
                        </select>
                    </div>
                </div>
            
                <div class="fila">
                    <div class="col2 paddingTop">DNI:</div>
                    <div class="col2 final"><input id="txtDNIVecino" name="txtDNIVecino" maxlength="8" type="text" class="text0" /></div>
                </div>
            
                <div class="fila"><a class="btnAgregarVecino btn" href="#">Agregar persona</a></div>
            
            </fieldset>
        
            <div id="btnEliminarVecino">&nbsp;<a class="btnEliminarVecino btn" href="#">Eliminar seleccionados</a></div>
        
            <div id="grillaVecinos">
        
                <div class="fila cabeceraGrilla">
                    <div class="colNombre">Nombre Completo</div>
                    <div class="colDireccion">Dirección</div>
                    <div class="colDistrito">Distrito</div>
                    <div class="colTipoEdif">Tipo Edificación</div>
                    <div class="colNomCond">Nombre Condominio</div>
                    <div class="colEliminar final">Eliminar</div>
                </div>
            
                <label id="grillaVacia">No se han ingresado personas.</label>
            
                <div id="personas">
                    <!--Se llenará dinámicamente. ver archivo Scripts/legal.js-->
                </div>
        
            </div>
        
            <div id="btnGrabarReqLegal">
                <%--<a class="btnGrabarReqLegal btn" href="#">Grabar</a>--%>
                <input type="submit" class="btnGrabarReqLegal btn" onclick="return validarForm();" value="Grabar" />
            </div>

        <% } %>
    </section>

</asp:Content>
