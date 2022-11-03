<?php
include("../seguridad.php");
include("../central/central.php");
include("../conexion/clsConexion.php");
ob_start();
$usu=$_SESSION["usuario"];
$idsucursal=$_SESSION["sucursal"];
$objVentas=new clsConexion;

//$result=$objVentas->consultar("select * from venta WHERE idsucu_c='$idsucursal' ORDER BY num_docu DESC");

$result=$objVentas->consultar("select venta.*, usuario.*, cliente.* from venta
inner join usuario
on venta.idusuario = usuario.idusu
inner join cliente
on venta.idcliente = cliente.idcliente
inner join sucursal
on venta.idsucu_c = sucursal.idsucursal
WHERE  venta.idsucu_c='$idsucursal' ORDER BY num_docu DESC");


//print_r($result);

// $result=$objVentas->consultar("SELECT venta.*
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
// 	WHERE  venta.idsucu_c='$idsucursal' ORDER BY num_docu DESC");
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
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8_spanish_ci" />
</head>
<!-- add class "sidebar-collapsed" to close sidebar by default, "chat-visible" to make chat appear always -->
		<div class="page-container">

	<div class="main-content">
	<?php include('../central/cabecera.php');?>
<hr/>
<h2>Egresos</h2>
<br/>
<table class="table table-bordered datatable" id="table-1">
        <thead>
						<tr class="info">
						<th ><a href="#">Codigo</a></th>
						<th data-hide="phone"><a href="#">Numero.</a></th>
						<th><a href="#">Cliente</a></th>
						<th><a href="#">Atendido por</a></th>
						<th><a href="#">Fecha</a></th>
						<th>Imprimir</th>
						<th>Cancelar</th>
					  </tr>
		</thead>
				<tbody>
		<?php
		foreach((array)$result as $row){
			$fecha = new DateTime($row['fecha']);
			$fecha = $fecha->format("d-m-Y");
			?>
					<tr>
					<td><?php echo $row['idventa']; ?></td>
					<td><?php echo $row['num_docu']; ?></td>
          			<td><?php echo $row['nombres']; ?></td>
					 <td><?php echo $row['usuario']; ?></td>
					 <td><?php echo $fecha; ?></td>
					<td>
					<?php if($row['tipo_docu']=='TICKET'){
					echo "<a href='../reportes/ticketconsulta.php?idventa=".$row['idventa']."' class='btn btn-info btn-sm btn-icon icon-left'>";
					}else{
					echo "<a href='../reportes/comprobanteparam.php?idventa=".$row['idventa']."' class='btn btn-info btn-sm btn-icon icon-left'>";
					}
					?>
					<i class="entypo-print"></i>Imprimir
					</td>
					<td>
						<?php
						 echo "<a href='cancelarventa.php?cod=".$row['idventa']."' class='btn btn-danger btn-sm btn-icon icon-left' title='cancelar venta'>";
						?>
						<i class="entypo-cancel"></i>Cancelar
				  </td>

					</tr>
			<?php
		};
		?>
				</tbody>
</table>

<script type="text/javascript">
var responsiveHelper;
var breakpointDefinition = {
    tablet: 1024,
    phone : 480
};
var tableContainer;

	jQuery(document).ready(function($)
	{
		tableContainer = $("#table-1");

		tableContainer.dataTable({
			"sPaginationType": "bootstrap",
			"aLengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
			"bStateSave": true,
			// ordena de manera desendente de mayor a menor la columna 1 de la consulta
		  "aaSorting": [[ 1, "desc" ]],
		    // Responsive Settings
		    bAutoWidth     : false,
		    fnPreDrawCallback: function () {
		        // Initialize the responsive datatables helper once.
		        if (!responsiveHelper) {
		            responsiveHelper = new ResponsiveDatatablesHelper(tableContainer, breakpointDefinition);
		        }
		    },
		    fnRowCallback  : function (nRow, aData, iDisplayIndex, iDisplayIndexFull) {
		        responsiveHelper.createExpandIcon(nRow);
		    },
		    fnDrawCallback : function (oSettings) {
		        responsiveHelper.respond();
		    }
		});

		$(".dataTables_wrapper select").select2({
			minimumResultsForSearch: -1
		});
	});
</script>
<br /><!-- Footer -->
	</div>
</div>
</html>
