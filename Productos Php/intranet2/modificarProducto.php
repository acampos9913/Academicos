<?php 	
sleep(1);
session_start();
header("Cache-control: private");

$cod=$_POST['cod'];
$nom=$_POST['nombre'];
$pre=$_POST['precio'];
$stock=$_POST['stock'];
$prov=$_POST['proveedor'];
$cat=$_POST['categoria'];
$nCategoria=$_POST['nCategoria'];
$nProveedor=$_POST['nProveedor'];
?>

<script type="text/javascript" src="js/jsProducto.js"></script>

<h1>Actualizar Productos</h1>


<div id="frmProducto" style="width: 100%; height: 30%;float:left">
        <div id="tabla" style="text-align: center;padding-top: 2%">
            <table align="center">
                <tr>
                    <td><input type="hidden" id="txtCodm" name="txtCodm" value="<?php echo $cod; ?>"/>Nombre:</td>
                    <td><input type="text" id="txtNombrem" name="txtNombrem" value="<?php echo $nom; ?>" autofocus placeholder="Ingrese Nombre" required/></td>					
                </tr>
                <tr>
                    <td>Precio:</td>
                    <td><input type="text" id="txtPreciom" name="txtPreciom" value="<?php echo $pre; ?>" placeholder="Ingrese Precio" required /></td>
                </tr>
                <tr>
                    <td>Stock:</td>
                    <td><input type="text" id="txtStockm" name="txtStockm" value="<?php echo $stock; ?>" placeholder="Ingrese Stock" required/></td>
                </tr>
				<tr>
                    <td><input type="hidden" id="txtProm" name="txtProm" value="<?php echo $prov; ?>"/>Proveedor:</td>
                    <td><input type="text" id="txtProveedorm" name="txtProveedorm" value="<?php echo $nProveedor; ?>" readonly required /></td>
					<td><img id="imgProveedor" name="imgProveedor" src="images/search_user.png" alt="Buscar Proveedor" title="Buscar Proveedor" onclick="show_popupBuscarProveedor();" style="cursor:pointer"/></td>
                </tr>
				<tr>
                    <td><input type="hidden" id="txtCatm" name="txtCatm" value="<?php echo $cat; ?>"/>Categoria:</td>
                    <td><input type="text" id="txtCategoriam" name="txtCategoriam" value="<?php echo $nCategoria; ?>" readonly required /></td>
					<td><img id="imgCategoria" name="imgCategoria" src="images/package.png" alt="Buscar Categoria" title="Buscar Categoria" onclick="show_popupBuscarCategoria();" style="cursor:pointer"/></td>
                </tr>			
                <tr>
                    <td><input type="submit" id="btnActualizar" name="btnActualizar" value="Actualizar" /></td>
                </tr>
            </table>
        </div>
    </div>
	
	<div id="mipopupbp" title="Buscar Proveedor"></div>
	<div id="mipopupbc" title="Buscar Categoria"></div>