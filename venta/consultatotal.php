<?php
include("../seguridad.php");
ob_start();
$usu=$_SESSION["usuario"];
include_once("../conexion/clsConexion.php");
$obj=new clsConexion;
$data=$obj->consultar("SELECT imp_num,moneda FROM configuracion");
		foreach($data as $row){
			$impuesto=$row['imp_num'];
			$mon=$row["moneda"];
		}
$num=$result=$obj->consultar("SELECT * FROM carrito WHERE session_id='$usu'");

$data=$obj->consultar("SELECT ROUND(SUM(importe)*$impuesto/100+SUM(importe),2) as total FROM carrito WHERE session_id='$usu'");
		foreach($data as $row){
			$total=$row['total'];
		}
?>
<h1 align="center">Datos</h1>
