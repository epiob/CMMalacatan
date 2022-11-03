<?php
include("../seguridad.php");
include_once("../central/central.php");
include("../conexion/clsConexion.php");
$obj=new clsConexion;
$cod=trim($obj->real_escape_string(htmlentities(strip_tags($_GET['idsucursal'],ENT_QUOTES))));
$data=$obj->consultar("SELECT * FROM sucursal WHERE idsucursal='".$obj->real_escape_string($cod)."'");
		foreach($data as $row){
			  $id=$row['idsucursal'];
				$direccion=$row['direccion'];
				$telefono=$row['telefono'];
				$ruc_letra=$row['ruc_letra'];
				$ruc_num=$row['ruc_num'];
				$representante=$row['representante'];
				$serie=$row['serie'];
				$razon=$row['razon_social'];
		}
?>
<!DOCTYPE html>
<div class="page-container">
    <!-- add class "sidebar-collapsed" to close sidebar by default, "chat-visible" to make chat appear always -->
    <div class="main-content">
        <hr />
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-info" data-collapsed="0">
                    <div class="panel-heading">
                        <div class="panel-title">
                            Actualizar Bodega
                        </div>
                    </div>
                    <div class="panel-body">
                        <form role="form" class="form-horizontal form-groups-bordered" action="capturar.php"
                            method="post">
                            <div class="form-group">
                                <label for="field-1" class="col-sm-3 control-label">Nombre(*):</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" required
                                        placeholder="ingrese la razon social" name="txtra" value="<?php echo $razon;?>">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="field-1" class="col-sm-3 control-label">Bodega(*):</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" required placeholder="ingrese su direccion"
                                        name="txtdi" value="<?php echo $direccion;?>">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="field-1" class="col-sm-3 control-label">Serie(*):</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" required placeholder="ingrese su serie"
                                        name="txtse" value="<?php echo $serie;?>">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-3 col-sm-5">
                                    <button type="submit" value="modificar" class="btn btn-info"><i
                                            class="entypo-pencil"></i>Modificar</button>
                                    <input type="hidden" name="funcion" id="funcion" value="modificar" />
                                    <input type="hidden" name="cod" value="<?php echo $cod;?>" />
                                    <a class="btn btn btn-green" href="index.php"><i
                                            class="entypo-cancel"></i>Cancelar</a></button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>