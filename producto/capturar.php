<head>
    <link rel="stylesheet" href="../assets/alert/alertify/alertify.css">
    <link rel="stylesheet" href="../assets/alert/alertify/themes/default.css">
    <script src="../assets/alert/alertify/alertify.js"></script>
</head>

<body>
    <?php
include("../seguridad.php");
include_once("../conexion/clsConexion.php");
$obj= new clsConexion();
$funcion2=$_POST["funcion2"];
if($funcion2=="modificar"){
  $cod=trim($obj->real_escape_string($_POST['cod'],ENT_QUOTES));
  
  $lo=trim($obj->real_escape_string($_POST['txtlo'],ENT_QUOTES));
  $de=trim($obj->real_escape_string($_POST['txtde'],ENT_QUOTES));
  $ti=trim($obj->real_escape_string($_POST['txtti'],ENT_QUOTES));
  $st=trim($obj->real_escape_string($_POST['txtst'],ENT_QUOTES));
  $stm=trim($obj->real_escape_string($_POST['txtstm'],ENT_QUOTES));
  $pc=trim($obj->real_escape_string($_POST['txtpc'],ENT_QUOTES));  
  $vs=trim($obj->real_escape_string($_POST['txtvs'],ENT_QUOTES));
  $fec=trim($obj->real_escape_string($_POST['txtfec'],ENT_QUOTES));  
  $pre=trim($obj->real_escape_string($_POST['tpre'],ENT_QUOTES));
  $la=trim($obj->real_escape_string($_POST['tla'],ENT_QUOTES));
  $si=trim($obj->real_escape_string($_POST['tsi'],ENT_QUOTES));
  $estado=trim($obj->real_escape_string($_POST['txte'],ENT_QUOTES));

$sql="UPDATE `productos` SET `idlote`='$lo',`descripcion`='$de',`tipo`='$ti',`stock`='$st',
`stockminimo`='$stm',`precio_compra`='$pc',`ventasujeta`='$vs',
`fecha_registro`='$fec',`idpresentacion`='$pre',`idlab_pro`='$la',`idsintoma`='$si',`estado`='$estado' where idproducto=$cod";

$obj->ejecutar($sql);
   	echo"<script>
    alertify.alert('Producto', 'Registro Actualizado!', function(){
	alertify.success('Ok');
	self.location='index.php';
	});
</script>";
	}

if($funcion2=="registrar2"){
  
  $lo=trim($obj->real_escape_string($_POST['txtlo'],ENT_QUOTES));
  $de=trim($obj->real_escape_string($_POST['txtde'],ENT_QUOTES));
  $ti=trim($obj->real_escape_string($_POST['txtti'],ENT_QUOTES));
  $st=trim($obj->real_escape_string($_POST['txtst'],ENT_QUOTES));
  $stm=trim($obj->real_escape_string($_POST['txtstm'],ENT_QUOTES));
  $pc=trim($obj->real_escape_string($_POST['txtpc'],ENT_QUOTES));  
  $vs=trim($obj->real_escape_string($_POST['txtvs'],ENT_QUOTES));
  $fec=trim($obj->real_escape_string($_POST['txtfec'],ENT_QUOTES));  
  $pre=trim($obj->real_escape_string($_POST['tpre'],ENT_QUOTES));
  $la=trim($obj->real_escape_string($_POST['tla'],ENT_QUOTES));
  $si=trim($obj->real_escape_string($_POST['tsi'],ENT_QUOTES));
  $estado=trim($obj->real_escape_string($_POST['txte'],ENT_QUOTES));
  $idsucursal=$_POST['txtidsucu_c'];

$sql="INSERT INTO `productos`
(`idlote`, `descripcion`, `tipo`, `stock`, `stockminimo`, `precio_compra`, `ventasujeta`, `fecha_registro`,  `idpresentacion`, `idlab_pro`, `idsintoma`, `estado`,`idsucu_c`) VALUES
('$lo','$de','$ti','$st','$stm','$pc','$vs','$fec','$pre','$la','$si','$estado','$idsucursal')";
$obj->ejecutar($sql);
	echo"<script>
    alertify.alert('Producto', 'Registro Grabado!', function(){
	alertify.success('Ok');
	self.location='index.php';
	});
</script>";
}
?>
</body>