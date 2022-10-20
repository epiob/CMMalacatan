<?php
include("../seguridad.php");
include_once("../central/central.php");
include("../conexion/clsConexion.php");
$obj=new clsConexion;
ob_start();
$usu=$_SESSION["usuario"];
// $idsucursal=$_SESSION["sucursal"];
$cod=trim($obj->real_escape_string(htmlentities(strip_tags($_GET['idsintoma'],ENT_QUOTES))));
$data=$obj->consultar("SELECT * FROM sintoma WHERE idsintoma='".$obj->real_escape_string($cod)."'");
		foreach($data as $row){
			  $si= $row['sintoma'];
		}
?>
<!DOCTYPE html>
<div class="page-container"><!-- add class "sidebar-collapsed" to close sidebar by default, "chat-visible" to make chat appear always -->
	<div class="main-content">
<?php include('../central/cabecera.php');?>
<hr />
<div class="row">
	<div class="col-md-12">
		<div class="panel panel-info" data-collapsed="0">
			<div class="panel-heading">
				<div class="panel-title">
					Actualizar Sintomas
				</div>
			</div>
			<div class="panel-body">
				<form role="form" class="form-horizontal form-groups-bordered" action="capturar.php" method="post">
					<div class="form-group">
						<label for="field-1" class="col-sm-3 control-label" >Sintoma(*)</label>
						<div class="col-sm-5">
							<input type="text" name="txtsi" class="form-control" required placeholder="ingrese la Forma Farmaceutica" value="<?php echo $si?>">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-3 col-sm-5">
							<button type="submit" value="modificar" class="btn btn-info"><i class="entypo-pencil"></i>Modificar</button>
							<input type="hidden" name="funcion" id="funcion" value="modificar"/>
							<input type="hidden" name="cod" value="<?php echo $cod;?>"/>
							 <a class="btn btn btn-default" href="index.php"><i class="entypo-cancel"></i> Cancelar</a></button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>	</div>
	</div>
