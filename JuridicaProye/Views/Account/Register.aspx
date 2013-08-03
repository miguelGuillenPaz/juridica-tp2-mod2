<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DemoMVC.Models.RegisterModel>" %>

<asp:Content ID="registerTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Register
</asp:Content>

<asp:Content ID="registerContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Seguridad > Ingresar Usuario</h2>
    <p>
        Por favor, ingrese los datos del nuevo usuario en el sistema: 
    </p>
    <p>
        La nueva clave requerida puede ser de un mínimo de <%: ViewData["PasswordLength"] %> caracteres en longitud.
    </p>
    <% using (Html.BeginForm()) { %>
        <%: Html.ValidationSummary(true, "Creación de usuario no satisfactoria. Por favor, corregir los errores e intentar de nuevo.") %>
        <div>
            <fieldset>
                <legend>Información del Nuevo Usuario</legend>
                
                <div class="editor-label">
                    <%: Html.LabelFor(m => m.UserName) %>
                </div>
                <div class="editor-field">
                    <%: Html.TextBoxFor(m => m.UserName) %>
                    <%: Html.ValidationMessageFor(m => m.UserName) %>
                </div>
                
                <div class="editor-label">
                    <%: Html.LabelFor(m => m.Email) %>
                </div>
                <div class="editor-field">
                    <%: Html.TextBoxFor(m => m.Email) %>
                    <%: Html.ValidationMessageFor(m => m.Email) %>
                </div>
                
                <div class="editor-label">
                    <%: Html.LabelFor(m => m.Password) %>
                </div>
                <div class="editor-field">
                    <%: Html.PasswordFor(m => m.Password) %>
                    <%: Html.ValidationMessageFor(m => m.Password) %>
                </div>
                
                <div class="editor-label">
                    <%: Html.LabelFor(m => m.ConfirmPassword) %>
                </div>
                <div class="editor-field">
                    <%: Html.PasswordFor(m => m.ConfirmPassword) %>
                    <%: Html.ValidationMessageFor(m => m.ConfirmPassword) %>
                </div>
                <div class="editor-label">
                    <label for="Email">Dirección</label>
                </div>
                <div class="editor-field">
                    <input id="Email" name="Email" type="text" value="" />
                </div>
                <div class="editor-label">
                    <label for="Email">Ubigeo</label>
                </div>
                <div class="editor-field">
                    <select id="dpto" name="dpto">
			<option>--- Escoja un departamento ---</option>
			<option>Lima</option>
			<option>La Libertad</option>
			<option>Callao</option>
		    </select>
		    &nbsp;&nbsp;
                    <select id="dpto" name="prov">
			<option>--- Escoja una provincia ---</option>
			<option>Lima</option>
			<option>Canta</option>
			<option>Huaral</option>
		    </select>
		    &nbsp;&nbsp;	
                    <select id="dpto" name="dist">
			<option>--- Escoja un distrito ---</option>
			<option>Lima</option>
			<option>Miraflores</option>
			<option>Santa Anita</option>
		    </select>
                </div>
                <div class="editor-label">
                    <label for="Email">Telefono</label>
                </div>
                <div class="editor-field">
                    <input id="Email" name="Email" type="text" value="" />
                </div>
                <div class="editor-label">
                    <label for="Email">Celular</label>
                </div>
                <div class="editor-field">
                    <input id="Email" name="Email" type="text" value="" />
                </div>
                <div class="editor-label">
                    <label for="Email">Fecha Nacimiento</label>
                </div>
                <div class="editor-field">
                    <select id="dpto" name="Dia">
			<option>01</option>
			<option>02</option>
			<option>03</option>
		    </select>
		    &nbsp;&nbsp;
                    <select id="dpto" name="Mes">
			<option>01</option>
			<option>02</option>
			<option>03</option>
		    </select>
		    &nbsp;&nbsp;	
                    <select id="dpto" name="Anho">
			<option>1982</option>
			<option>1983</option>
			<option>1984</option>
		    </select>
                </div>
                <div class="editor-label">
                    <label for="Email">Cargo</label>
                </div>
                <div class="editor-field">
                    <select id="dpto" name="Dia">
			<option>--- Seleccione un cargo ---</option>
			<option>Cargo 01</option>
			<option>Cargo 02</option>
			<option>Cargo 03</option>
		    </select>
                </div>
		<br>
                <div class="editor-label">
                    <label for="Email">Rol del usuario en el sistema</label>
                </div>
                <div class="editor-field">
			<table id='Tabla1' >
			  <tr>
			    <th width='30px'>Seleccionar</th><th width='180px'>Rol</th>
    			  </tr>
			  <tr>
			    <td align="center"><input type="checkbox" id="check1"></td><td>Rol 01</td>
    			  </tr>
			  <tr>
			    <td align="center"><input type="checkbox" id="check1"></td><td>Rol 02</td>
    			  </tr>
			  <tr>
			    <td align="center"><input type="checkbox" id="check1"></td><td>Rol 03</td>
    			  </tr>
			  <tr>
			    <td align="center"><input type="checkbox" id="check1"></td><td>Rol 04</td>
    			  </tr>
			  <tr>
			    <td align="center"><input type="checkbox" id="check1"></td><td>Rol 05</td>
    			  </tr>
			</table>
            <br>
                <input type="submit" value="Ingresar Usuario" />
            </fieldset>
        </div>
    <% } %>
</asp:Content>
