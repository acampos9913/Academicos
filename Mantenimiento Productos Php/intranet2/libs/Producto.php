<?php
require_once("Conexion.php");

$con= New DBManager();

$tip = $_POST['tip'];

if ($tip=="Registro"){
  $nombre = $_POST['nombre'];
  $precio = $_POST['precio'];
  $stock = $_POST['stock'];
  $prov = $_POST['prov'];
  $cat = $_POST['cat'];

if($con->conectar()==true){
       $result= @mysql_query("INSERT INTO Producto (Nombre,Precio,idProveedor,idCategoria,Stock) VALUES ('".$nombre."','".$precio."','".$prov."','".$cat."','".$stock."')");
  if (!$result){
      echo "error";
  }else{echo "exito";}
}

}else if($tip == "Listar"){  
  if($con->conectar()==true){
    //$result= @mysql_query("select * from Producto");
	//$result= @mysql_query("select p.idProducto as idProducto, p.Nombre as Nombre,p.Precio as Precio,p.idProveedor as idProveedor,p.idCategoria as idCategoria,p.Stock as Stock, concat(pr.Nombre,' ',pr.Apellidos) as Proveedor, c.Nombre as Categoria from Categoria c, Producto p, Proveedor pr where c.idCategoria= p.idCategoria and p.idProveedor = pr.idProveedor");
	
	$limit = 2;// maximo por pagina
	
	if (isset($_POST['pag'])) {
    $offset = ($_POST['pag'] - 1) * $limit;
    $pag = $_POST['pag'];
    //caso contrario los iniciamos
	} else {
		$offset = 0;
		$pag = 1;
	}

	$result= @mysql_query("select p.idProducto as idProducto, p.Nombre as Nombre,p.Precio as Precio,p.idProveedor as idProveedor,p.idCategoria as idCategoria,p.Stock as Stock, concat(pr.Nombre,' ',pr.Apellidos) as Proveedor, c.Nombre as Categoria from Categoria c, Producto p, Proveedor pr where c.idCategoria= p.idCategoria and p.idProveedor = pr.idProveedor order by p.idProducto DESC LIMIT $offset, $limit");
	$rsTotal = @mysql_query("SELECT * from producto");
	$total = mysql_num_rows($rsTotal);			
	//$rowTotal = mysql_fetch_assoc($rsTotal);	
	//$total = $rowTotal["total"];// Total de registros sin limit
	//$PagAnt = $pag - 1; //primera vez--->1-1
	//$PagSig = $pag + 1;
	$PagUlt = $total / $limit; //975/5=195
	$Res = $total % $limit;
	if ($Res > 0){$PagUlt = floor($PagUlt) + 1;}
	
  if (mysql_num_rows($result)== 0) {		
            echo "vacio";
        } else {			
             echo "<table id='lstBusqueda' align='center' class='gradient-style'>
        <tr>
        <th style='text-align:center;'>Nombre</th>
        <th style='text-align:center;'>Precio</th>
		<th style='text-align:center;'>Proveedor</th>
		<th style='text-align:center;'>Categoria</th>
		<th style='text-align:center;'>Stock</th>
		<th style='text-align:center;'>Editar</th>
		<th style='text-align:center;'>Eliminar</th>
		<th style='text-align:center;'>PDF</th>
        </tr>
            <tbody>";

             while ($busqueda = mysql_fetch_array($result)) {
                $cod = $busqueda['idProducto'];
				$codcat = $busqueda['idCategoria'];
				$codpro = $busqueda['idProveedor'];
                $nom = mb_convert_encoding($busqueda['Nombre'], "UTF-8");
                $pre = mb_convert_encoding($busqueda['Precio'], "UTF-8");
                $stock = mb_convert_encoding($busqueda['Stock'], "UTF-8");
				$npro = mb_convert_encoding($busqueda['Proveedor'], "UTF-8");
				$npro2 = str_replace(' ', '_',mb_convert_encoding($busqueda['Proveedor'], "UTF-8"));
				$ncat = mb_convert_encoding($busqueda['Categoria'], "UTF-8");
                echo "<tr>";
                echo "<td style='display:none;'>" . $cod . "</td>";
                echo "<td style='text-align:center;'>" . $nom . "</td>";
                echo "<td style='text-align:center;'>" . $pre . "</td>";
                echo "<td style='display:none;'>" . $codpro . "</td>";
				echo "<td style='text-align:center;'>" . $npro . "</td>";
				echo "<td style='display:none;'>" . $codcat . "</td>";
				echo "<td style='text-align:center;'>" . $ncat . "</td>";
				echo "<td style='text-align:center;'>" . $stock . "</td>";
                echo"<td><a onclick=show_popupActualizarProducto('" . $cod . "','" . $nom . "','" . $pre . "','" . $stock ."','" . $codpro ."','" . $codcat ."','" . $npro2 ."','" . $ncat ."'); href='#'><center><img src='images/edit.png' border='0' title='Modificar' alt='Modificar' /></center></a></td>";
                echo"<td><a onclick=EliminarProducto(" . $cod . "); href='#'><center><img src='images/delete.png' border='0' title='Eliminar' alt='Eliminar' /></center></a></td>";
				echo"<td><a onclick=VerPdf('" . $cod . "','" . $nom . "','" . $pre . "','" . $stock ."','" . $npro2 ."','" . $ncat ."'); href='#'><center><img src='images/pdf.png' border='0' title='Pdf' alt='Pdf' /></center></a></td>";
                echo "</tr>";
             }
             echo"</tbody>
             </table> <br />";		
			 
			 //desplazamiento
			if ($pag > 1) {//1 > 6
				echo "<a onclick='Paginacion(1)' class='paginador'><< Primero</a>";
				echo "&nbsp;";
			}
			
			for ($i = ($pag - $limit); $i <= ($pag - 1); $i++) {
				if ($i >= 1) {
					echo "<a onclick='Paginacion($i);' class='paginador'>" . $i . "</a>";
					echo "&nbsp;";
				}
			}
			
			echo "<span class='paginadoractivo'>" . $pag . "</span>";
			echo "&nbsp;";
			
			for ($i = ($pag + 1); $i <= ($pag + $limit); $i++) {				
				
				if ($i <= $PagUlt) {
					echo "<a onclick='Paginacion($i)' class='paginador'>" . $i . "</a>";
					echo "&nbsp;";
				}
			}

			if ($pag < $PagUlt) {
				echo "<a onclick='Paginacion($PagUlt);' class='paginador'>Ultimo >></a>";
			}
        }
    }
}else if($tip == "upd"){
  $mcod = $_POST['mcod'];
  $mnombre = $_POST['mnom'];
  $mprecio = $_POST['mprecio'];
  $mstock = $_POST['mstock'];
  $mpro = $_POST['mprov'];
  $mcat = $_POST['mcat'];
  $mimg = $_POST['mimg'];

  if($con->conectar()==true){
     $result= @mysql_query("UPDATE Producto set Nombre ='".$mnombre."',Precio ='".$mprecio."',Stock ='".$mstock."',idProveedor ='".$mpro."',idCategoria ='".$mcat."' WHERE idProducto = ".$mcod);
  if (!$result){
      echo "error";
  }else{echo "exito";}
  }
}else if($tip == "del"){
  $cod = $_POST['dcod'];

if($con->conectar()==true){
     $result= @mysql_query("DELETE FROM Producto WHERE idProducto = ".$cod."");
  if (!$result){
      echo "error";
  }else{echo "exito";}
  }
}else if($tip == "c"){
if($con->conectar()==true){
       $result= @mysql_query("select * from Categoria");
	   sleep(2);
	   echo "<option  value=''>" . 'SELECCIONA' . "</option>\n";
       while ($rscat = mysql_fetch_array($result)) {            
                echo "<option  value=" . $rscat['idCategoria'] . ">" . mb_convert_encoding($rscat['Nombre'], "UTF-8") . "</option>\n";	
        }  
 }
}else if($tip == "p"){
if($con->conectar()==true){
       $result= @mysql_query("select * from Proveedor");
	   sleep(2);
	   echo "<option  value=''>" . 'SELECCIONA' . "</option>\n";
       while ($rsprov = mysql_fetch_array($result)) {
				$apenom = mb_convert_encoding($rsprov['Nombre'], "UTF-8")." ".mb_convert_encoding($rsprov['Apellidos'], "UTF-8");
                echo "<option  value=" . $rsprov['idProveedor'] . ">" . $apenom . "</option>\n";	
        }  
 }
}else if($tip == "lp"){  
  if($con->conectar()==true){
    $result= @mysql_query("select idProveedor,concat(Nombre,' ',Apellidos) as Proveedor from Proveedor");	
  if (mysql_num_rows($result)== 0) {		
            echo "vacio";
        } else {			
             echo "<table id='lstBusquedaP' align='center' class='gradient-style'>
        <tr>
		<th style='text-align:center;'>Codigo</th>
		<th style='text-align:center;'>Proveedor</th>
		<th style='text-align:center;'>Agregar</th>
        </tr>
            <tbody>";

             while ($bp = mysql_fetch_array($result)) {
				$codprov = $bp['idProveedor'];
				$nomprov = str_replace(' ', '_',mb_convert_encoding($bp['Proveedor'], "UTF-8"));
                echo "<tr>";
                echo "<td style='text-align:center;'>" . mb_convert_encoding($bp['idProveedor'], "UTF-8") . "</td>";
                echo "<td style='text-align:center;'>" . mb_convert_encoding($bp['Proveedor'], "UTF-8") . "</td>";
				echo"<td><a onclick=AgregarProveedor('" . $codprov . "','" . $nomprov . "'); href='#'><center><img src='images/add.png' border='0' title='Agregar' alt='Agregar' /></center></a></td>";				
                echo "</tr>";
             }
             echo"</tbody>
             </table>";
			 
        }
    }
}else if($tip == "bp"){  
  if($con->conectar()==true){
	$nomp = $_POST['nomp'];
    $result= @mysql_query("select idProveedor,concat(Nombre,' ',Apellidos) as Proveedor from Proveedor where Nombre LIKE '%".$nomp."%' OR Apellidos LIKE '%".$nomp."%'");	
  if (mysql_num_rows($result)== 0) {		
            echo "vacio";
        } else {			
             echo "<table id='lstBusquedaP' align='center' class='gradient-style'>
        <tr>
		<th style='text-align:center;'>Codigo</th>
		<th style='text-align:center;'>Proveedor</th>
		<th style='text-align:center;'>Agregar</th>
        </tr>
            <tbody>";

             while ($bp = mysql_fetch_array($result)) {
				$codprov = $bp['idProveedor'];
				$nomprov = str_replace(' ', '_',mb_convert_encoding($bp['Proveedor'], "UTF-8"));
                echo "<tr>";
                echo "<td style='text-align:center;'>" . mb_convert_encoding($bp['idProveedor'], "UTF-8") . "</td>";
                echo "<td style='text-align:center;'>" . mb_convert_encoding($bp['Proveedor'], "UTF-8") . "</td>";
				echo"<td><a onclick=AgregarProveedor('" . $codprov . "','" . $nomprov . "'); href='#'><center><img src='images/add.png' border='0' title='Agregar' alt='Agregar' /></center></a></td>";				
                echo "</tr>";
             }
             echo"</tbody>
             </table>";
			 
        }
    }
}else if($tip == "lc"){  
  if($con->conectar()==true){
    $result= @mysql_query("select * from Categoria");	
  if (mysql_num_rows($result)== 0) {		
            echo "vacio";
        } else {			
             echo "<table id='lstBusquedaC' align='center' class='gradient-style'>
        <tr>
		<th style='text-align:center;'>Codigo</th>
		<th style='text-align:center;'>Categoria</th>
		<th style='text-align:center;'>Agregar</th>
        </tr>
            <tbody>";

             while ($bc = mysql_fetch_array($result)) {    
				$codcate = $bc['idCategoria'];
				$nomcate = mb_convert_encoding($bc['Nombre'], "UTF-8");
                echo "<tr>";
                echo "<td style='text-align:center;'>" . mb_convert_encoding($bc['idCategoria'], "UTF-8") . "</td>";
                echo "<td style='text-align:center;'>" . mb_convert_encoding($bc['Nombre'], "UTF-8") . "</td>";
				echo"<td><a onclick=AgregarCategoria('" . $codcate . "','" . $nomcate . "'); href='#'><center><img src='images/add.png' border='0' title='Agregar' alt='Agregar' /></center></a></td>";				
                echo "</tr>";
             }
             echo"</tbody>
             </table>";			
        }
    }
}else if($tip == "bc"){  
  if($con->conectar()==true){
  $nomc = $_POST['nomc'];
    $result= @mysql_query("select * from Categoria where Nombre LIKE '%".$nomc."%'");	
  if (mysql_num_rows($result)== 0) {		
            echo "vacio";
        } else {			
             echo "<table id='lstBusquedaC' align='center' class='gradient-style'>
        <tr>
		<th style='text-align:center;'>Codigo</th>
		<th style='text-align:center;'>Categoria</th>
		<th style='text-align:center;'>Agregar</th>
        </tr>
            <tbody>";

             while ($bc = mysql_fetch_array($result)) {    
				$codcate = $bc['idCategoria'];
				$nomcate = mb_convert_encoding($bc['Nombre'], "UTF-8");
                echo "<tr>";
                echo "<td style='text-align:center;'>" . mb_convert_encoding($bc['idCategoria'], "UTF-8") . "</td>";
                echo "<td style='text-align:center;'>" . mb_convert_encoding($bc['Nombre'], "UTF-8") . "</td>";
				echo"<td><a onclick=AgregarCategoria('" . $codcate . "','" . $nomcate . "'); href='#'><center><img src='images/add.png' border='0' title='Agregar' alt='Agregar' /></center></a></td>";				
                echo "</tr>";
             }
             echo"</tbody>
             </table>";			
        }
    }
}

?>
