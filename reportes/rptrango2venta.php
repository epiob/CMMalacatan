<?php ob_start();
include("../seguridad.php");
$usu=$_SESSION["usuario"];
$idsucursal=$_SESSION["sucursal"];
include_once("../conexion/clsConexion.php");
$obj=new clsConexion;
$totalv = 0;
if(strlen($_GET['desde'])>0 and strlen($_GET['hasta'])>0){
$desde = trim($obj->real_escape_string(htmlentities(strip_tags($_GET['desde'],ENT_QUOTES))));
$hasta =trim($obj->real_escape_string(htmlentities(strip_tags($_GET['hasta'],ENT_QUOTES))));

	$verDesde = date('d/m/Y', strtotime($desde));
	$verHasta = date('d/m/Y', strtotime($hasta));
}else{
	$desde = '1111-01-01';
	$hasta = '9999-12-30';

	$verDesde = '__/__/____';
	$verHasta = '__/__/____';
}

$result=$obj->consultar("select * from venta WHERE idsucu_c='$idsucursal' AND fecha BETWEEN '$desde' AND '$hasta'");

///////////////////
$result=$obj->consultar("SELECT venta.*
     , detalleventa.*
     , cliente.documento
     , cliente.idcliente
     , cliente.nombres
     , productos.descripcion
     , presentacion.presentacion
     , usuario.usuario
FROM
  detalleventa
INNER JOIN productos
ON detalleventa.idproducto = productos.idproducto
INNER JOIN venta
ON detalleventa.idventa = venta.idventa
INNER JOIN cliente
ON venta.idcliente = cliente.idcliente
INNER JOIN presentacion
ON productos.idpresentacion = presentacion.idpresentacion
INNER JOIN usuario
ON venta.idusuario = usuario.idusu
inner join sucursal
on venta.idsucu_c = sucursal.idsucursal
	WHERE venta.idsucu_c = $idsucursal and venta.fecha BETWEEN '$desde' and '$hasta'");
///////////////////
///////////////////
// $result=$obj->consultar("SELECT venta.*
//      , detalleventa.*
//      , cliente.documento
//      , cliente.idcliente
//      , cliente.nombres
//      , productos.descripcion
//      , presentacion.presentacion
//      , usuario.usuario
// FROM
//   detalleventa
// INNER JOIN productos
// ON detalleventa.idproducto = productos.idproducto
// INNER JOIN venta
// ON detalleventa.idventa = venta.idventa
// INNER JOIN cliente
// ON venta.idcliente = cliente.idcliente
// INNER JOIN presentacion
// ON productos.idpresentacion = presentacion.idpresentacion
// INNER JOIN usuario
// ON venta.idusuario = usuario.idusu
// 	WHERE venta.idventa ='$idsucursal'");
// 			foreach((array)$result as $row){
// 			$cliente=$row['nombres'];
// 		  $usuario=$row['usuario'];
//             $fecha = new DateTime($row['fecha']);
// $fecha = $fecha->format("d-m-Y");  
// 			$serie=$row['serie'];
// 		  $num_docu=$row['num_docu'];
// 			$subtotal=$row['subtotal'];
// 			$igv=$row['igv'];
// 		  $total=$row['total'];
// 			$serie=$row['serie'];
// 			$efectivo=$row['efectivo'];
// 			$vuelto=$row['vuelto'];
// 						if($row['documento']==NULL){
// 							$numdocucli='';
// 						}else{
// 							$numdocucli=$row['documento'];
// 						}
// 			}


?>
<!DOCTYPE html
    PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>lista de Ventas</title>

    <style type="text/css">
    ne {
        font-weight: bold;
    }

    ne {
        font-weight: bold;
    }

    ta {
        font-size: 16px;
    }

    #n {
        text-align: center;
        font-weight: bold;
        font-size: 24px;
        font-family: Georgia, "Times New Roman", Times, serif;
        color: #000;
    }

    .g {
        font-family: Georgia, "Times New Roman", Times, serif;
    }

    #l {
        font-family: "Lucida Sans Unicode", "Lucida Grande", sans-serif;
    }
    </style>
</head>

<body class="n">
    <table width="280" height="65" border="1" align="center" cellspacing="0">
        <tr>
            <td width="241" bgcolor="#66CCCC" id="n">LISTADO DE EGRESOS</td>
        </tr>
        <tr>
            <td bgcolor="#66CCCC" align="center"><?php echo 'Desde:'.$verDesde."   ".'hasta:'.$verHasta ?></td>
        </tr>
    </table>
    <p>&nbsp;</p>
    <table width="541" border="1" align="center" cellspacing="0">
        <tr id="l">
            <th width="70" bgcolor="#66CCCC" scope="col">Ticket</th>
            <th width="80" bgcolor="#66CCCC" scope="col">Numero</th>
            <th width="50" bgcolor="#66CCCC" scope="col">Serie</th>
            <th width="66" bgcolor="#66CCCC" scope="col">Fecha</th>
            <th width="66" bgcolor="#66CCCC" scope="col">Total</th>
        </tr>
        <?php foreach((array) $result as $row){
     	$totalv = $totalv + $row['total'];
         $fecha = new DateTime($row['fecha']);
         $fecha = $fecha->format("d-m-Y");
         $descripcion = $row['descripcion'];

        //    foreach((array) $result as $row){
        //    $descripcion = row['descripcion'];
          
     ?>
        <tr>
            <td><?php echo $row['tipo_docu']; ?></span></td>
            <td><?php echo $row['num_docu'];?></span></td>
            <td><?php echo $row['serie']; ?></span></td>
            <td><?php echo $fecha; ?></span></td>
            <td><?php echo $descripcion; 
             ?></span></td>
        </tr>
        <?php };?>
    </table>

    <!-- <p align="right"><?php echo "Total Ventas:$totalv" ?></p> -->
</body>

</html>
<?php
require_once("dompdf/dompdf_config.inc.php");
$dompdf = new DOMPDF();
$dompdf->load_html(ob_get_clean());
$dompdf->render();
$pdf=$dompdf->output();
$filename = 'rptventaporfecha.pdf';
file_put_contents($filename, $pdf);
$dompdf->stream($filename,array("Attachment"=>0));
?>