<script type="text/javascript" src="js/jsProducto.js"></script>
<link rel="stylesheet" type="text/css" href="css/producto.css"/>
<div id="producto">
	<form id="frmProducto" name="frmProducto">
			<h1>Productos</h1>
            <table cellspacing="2">
                <tr>
                    <td><label>Nombre:</label></td>
                    <td class='cajasbig'><input type="text" id="txtNombre" name="txtNombre" autofocus placeholder="Ingrese Nombre" /></td>
                </tr>
                <tr>
                    <td><label>Precio:</label></td>
                    <td class='cajasbig'><input type="text" id="txtPrecio" name="txtPrecio" placeholder="Ingrese Precio"  /></td>
                </tr>
                <tr>
                    <td><label>Stock:</label></td>
                    <td class='cajasbig'><input type="text" id="txtStock" name="txtStock" placeholder="Ingrese Stock" /></td>
                </tr>
				<tr>
                    <td><label>Proveedor:</label></td>
                    <td class="cajasbig"><select id="cboProveedor" name="cboProveedor">
							<option value=''>CARGANDO...</option>
						</select>					
					</td>
                </tr>
				<tr>
                    <td><label>Categoria:</label></td>
                     <td class="cajasbig"><select id="cboCategoria" name="cboCategoria">
							<option value=''>CARGANDO...</option>
						 </select>					
					</td>
                </tr>			
					
                <tr>
                    <td><input type="submit" id="btnRegistrar" name="btnRegistrar" value="Registrar" /></td>
					<td><a onClick="limpiar();"><input type="button" id="btnLimpiar" name="btnLimpiar" value="Limpiar" /></a></td>
                </tr>
            </table>
	</form>	
</div>
 <div id="bajo">   
	   <div id="result"></div>
	   <div id="msje"></div>
 </div>
<div id="mipopup" title="Actualizar Productos"></div>
<div id="popupVerPdf" title="Ver Documento Pdf"></div>