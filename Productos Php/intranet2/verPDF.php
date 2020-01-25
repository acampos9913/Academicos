<?php
require_once("dompdf051/dompdf_config.inc.php");

session_start();

    $accion = $_POST['tip'];

    if ($accion == 'verProd') {  
	
		  $cod = $_POST['cod'];
		  $nombre = $_POST['nom'];
		  $precio = $_POST['precio'];
		  $stock = $_POST['stock'];
		  $pro = str_replace('_', ' ',$_POST['prov']);
		  $cat = $_POST['cat'];
	  
        $nArchivo = $cod.$nombre;
 
        $path = "pdfs/";      

        $html = "<html>
                <meta http-equiv='Content-Type' content='text/html;charset=utf-8'/>

                <style type='text/css'>
                body{
                margin-top:50px;
                margin-left:40px;
                margin-right:40px;
                margin-bottom:50px;
                }
				h1{
				font-size: 35px; color: #445668; text-transform:uppercase;
				text-align:center; margin: 0 0 35px 0; text-shadow:0px 1px 0px #f2f2f2;
				}
				label{
				font-size: 16px; color: #445668; text-transform:uppercase;
				text-shadow:0px 1px 0px #f2f2f2;
				}
				
                </style>

                <body>
				<h1 style='text-align:center'>Producto:  ".$nombre."</h1>
				<table border='0' align='center'>
					<tr>
						<td><label>Precio:</label></td>
						<td><label>".$precio."</label></td>
					</tr>
					<tr>
						<td><label>Stock:</label></td>
						<td><label>".$stock."</label></td>
					</tr>
					<tr>
						<td><label>Proveedor:</label></td>
						<td><label>".$pro."</label></td>
					</tr>
					<tr>
						<td><label>Categoria:</label></td>
						<td><label>".$cat."</label></td>
					</tr>							
				</table>
                </body>
              </html>";

        doPDF($path . $nArchivo, $html, false, true, 'a4');

		$pdf = $path.$nArchivo.'.pdf';
        
         echo "<iframe id='ifrmPdf' src='".$pdf."' frameborder='0' style='width:100%; height:100%;'></iframe>";

    }

function doPDF($path='', $content='', $body=false, $mode=false, $paper_1='a4', $paper_2='portrait') {
        //Añadimos la extensión del archivo. Si está vacío el nombre lo creamos
        if ($path != '') {
            $path .='.pdf';
        }
        //Las opciones del papel del PDF. Si no existen se asignan las siguientes:[*]
        if ($paper_1 == '')
            $paper_1 = 'a4';
        if ($paper_2 == '')
            $paper_2 = 'portrait';

        $dompdf = new DOMPDF();
        $dompdf->set_paper($paper_1, $paper_2);
        $dompdf->load_html(utf8_encode($content));
        ini_set("memory_limit","32M");
        $dompdf->render();

        //Creamos el pdf
        if ($mode == false) {
            $dompdf->stream($path);
        }

        //Lo guardamos en un directorio y lo mostramos
        if ($mode == true) {
            if (file_put_contents($path, $dompdf->output())) {                
                // Headers for an download:
                header('Content-Type: application/octet-stream');
                header('Content-Transfer-Encoding: binary');
                // load the file to send:
                header('Content-type: application/pdf');
                header('Content-Disposition: attachment; filename="' . $path . '"');

            }
        }    
}

?>