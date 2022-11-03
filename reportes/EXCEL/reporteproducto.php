<?php
if(isset($_GET["export"])) {
include_once("../../conexion/clsConexion.php");
$obj=new clsConexion;
header('Content-Type: text/csv; charset=utf-8');
header('Content-Disposition: attachment; filename=data.csv');
$output = fopen("php://output", "w");
fputcsv($output, array( 'descripcion', 'presentacion', 'stock', 'precio_venta', 'precio_compra','laboratorio'));
$result=$obj->consultar("SELECT productos.descripcion
     , presentacion.presentacion
     , productos.stock
     , productos.precio_venta
     , productos.precio_compra
     , laboratorio_proveedor.laboratorio
FROM
  productos
INNER JOIN presentacion
ON productos.idpresentacion = presentacion.idpresentacion
INNER JOIN laboratorio_proveedor
ON productos.idlab_pro = laboratorio_proveedor.idlab_pro ORDER BY codigo DESC");
      foreach((array)$result as $row){
        fputcsv($output, $row);
        }
        fclose($output);
  }
?>