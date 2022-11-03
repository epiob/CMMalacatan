<?php
include("../seguridad.php");
include_once("../central/central.php");
include("../conexion/clsConexion.php");
ob_start();
$usu=$_SESSION["usuario"];
$idsucursal=$_SESSION["sucursal"];
$objproductos=new clsConexion;

$cod=trim($objproductos->real_escape_string(htmlentities(strip_tags($_GET['idproducto'],ENT_QUOTES))));
$data=$objproductos->consultar("SELECT * FROM productos WHERE idproducto='".$objproductos->real_escape_string($cod)."'");
		foreach($data as $row){
			$cb=$row["codigo"];
			$n=$row["descripcion"];
			$stock=$row["stock"];
			$stockmin=$row["stockminimo"];
			$pc=$row["precio_compra"];
			$pv=$row["precio_venta"];
			$fec=$row["fecha_registro"];
			$tcat=$row["idcategoria"];
			$tsi=$row["idsintoma"];
			$tla=$row["idlab_pro"];
			$tpre=$row["idpresentacion"];
			$estado=$row["estado"];
			$tipo=$row["tipo"];
			$sujeta=$row["ventasujeta"];
			$lote=$row["idlote"];
			$rs=$row["reg_sanitario"];
		  $des=$row["descuento"];
		}

?>
<!DOCTYPE html>
<html lang="en">

<div class="page-container">
    <!-- add class "sidebar-collapsed" to close sidebar by default, "chat-visible" to make chat appear always -->
    <div class="main-content">
        <?php include('../central/cabecera.php');?>
        <hr />

        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-info" data-collapsed="0">
                    <div class="panel-heading">
                        <div class="panel-title">
                            Actualizar productos
                        </div>
                    </div>

                    <div class="panel-body">
                        <form role="form" name="miformulario" action="capturar.php" method="post">


                            <div class="col-md-6 form-group">
                                <label><strong>Lote(*)</strong></label>
                                <select name="txtlo" class='form-control' required>
                                    <?php
																		$result=$objproductos->consultar("select * from lote WHERE idsucu_c='$idsucursal'");
																		foreach((array)$result as $row){
																		if($row['idlote']==$lote){
																			echo '<option value="'.$row['idlote'].'" selected>'.$row['numero'].'</option>';
																		}else{
																			echo '<option value="'.$row['idlote'].'">'.$row['numero'].'</option>';
																		}
																	}
									?>
                                </select>
                            </div>

                            <div class="col-md-6 form-group">
                                <label><strong>Descripcion(*)</strong></label>
                                <input type="text" class="form-control" required placeholder="ingrese su descripcion"
                                    name="txtde" value="<?php echo $n;?>">
                            </div>

                            <div class="col-md-6 form-group">
                                <label><strong>Tipo(*)</strong></label>
                                <select name="txtti" class="form-control" required>
                                    <option value="Generico" <?php  if($tipo=='Generico'){ echo 'selected'; } ?>>
                                        Generico</option>
                                    <option value="No Generico" <?php if($tipo=='No Generico'){ echo 'selected'; } ?>>No
                                        generico</option>
                                </select>
                            </div>

                            <div class="col-md-6 form-group">
                                <label><strong>Stock(*)</strong></label>
                                <input type="text" name="txtst" class="form-control" required
                                    placeholder="ingrese el stock" value="<?php echo $stock;?>">
                            </div>

                            <div class="col-md-6 form-group">
                                <label><strong>stock minimo(*)</strong></label>
                                <input type="text" name="txtstm" class="form-control" required
                                    placeholder="ingrese el stock minimo" value="<?php echo $stockmin;?>">
                            </div>
                            <div class="col-md-6 form-group">
                                <label><strong>precio compra(*)</strong></label>
                                <input type="text" name="txtpc" class="form-control" required
                                    placeholder="ingrese el precio compra" value="<?php echo $pc;?>">
                            </div>


                            <div class="col-md-6 form-group">
                                <label><strong>Venta Sujeta(*)</strong></label>
                                <select name="txtvs" class="form-control" required>
                                    <option value="Con receta medica"
                                        <?php  if($sujeta=='Con receta medica'){ echo 'selected'; } ?>>Con receta medica
                                    </option>
                                    <option value="sin receta medica"
                                        <?php if($sujeta=='sin receta medica'){ echo 'selected'; } ?>>sin receta medica
                                    </option>
                                </select>
                            </div>
                            <div class="col-md-6 form-group">
                                <label>Fecha De Registro(*)</label>
                                <input type="text" name="txtfec" value="<?php echo $fec;?>" require class="form-control"
                                    readonly />
                            </div>


                            <div class="col-md-6 form-group">
                                <label class="col-sm-3 control-label">Presentacion(*)</label>
                                <select name="tpre" class='form-control' required>
                                    <?php
																		$result=$objproductos->consultar("select * from presentacion WHERE idsucu_c='$idsucursal'");
																		foreach((array)$result as $row){
																		if($row['idpresentacion']==$tpre){
																			echo '<option value="'.$row['idpresentacion'].'" selected>'.$row['presentacion'].'</option>';
																		}else{
																			echo '<option value="'.$row['idpresentacion'].'">'.$row['presentacion'].'</option>';
																		}
																	}
									?>
                                </select>
                            </div>
                            <div class="col-md-6 form-group">
                                <label>Laboratorio(*)</label>
                                <select name="tla" class='form-control' required>
                                    <?php
																		$result=$objproductos->consultar("select * from laboratorio_proveedor WHERE idsucu_c='$idsucursal'");
																		foreach((array)$result as $row){
																		if($row['idlab_pro']==$tla){
																			echo '<option value="'.$row['idlab_pro'].'" selected>'.$row['laboratorio'].'</option>';
																		}else{
																			echo '<option value="'.$row['idlab_pro'].'">'.$row['laboratorio'].'</option>';
																		}
																	}
									?>
                                </select>
                            </div>
                            <div class="col-md-6 form-group">
                                <label>Sintomas(*)</label>
                                <select name="tsi" class='form-control' required>
                                    <?php
																		$result=$objproductos->consultar("select * from sintoma WHERE idsucu_c='$idsucursal'");
																		foreach((array)$result as $row){
																		if($row['idsintoma']==$tsi){
																			echo '<option value="'.$row['idsintoma'].'" selected>'.$row['sintoma'].'</option>';
																		}else{
																			echo '<option value="'.$row['idsintoma'].'">'.$row['sintoma'].'</option>';
																		}
																	}
									?>
                                </select>
                            </div>

                            <div class="col-md-6 form-group">
                                <label><strong>Estado(*)</strong></label>
                                <select name="txte" class="form-control" required>
                                    <option value="1" <?php if($estado=='1'){ echo 'selected'; } ?>>Activo</option>
                                    <option value="0" <?php if($estado=='0'){ echo 'selected'; } ?>>Inactivo</option>
                                </select>
                            </div>


                    </div>

                    <div class="panel-footer">
                        <div align="left">
                            (*) campos obligatorios
                        </div>
                        <div align="right">
                            <button type="submit" value="modificar" class="btn btn-info"><i
                                    class="entypo-pencil"></i>Modificar</button>
                            <input type="hidden" name="funcion2" id="funcion2" value="modificar" />
                            <input type="hidden" name="cod" value="<?php echo $cod;?>" />
                            <a class="btn btn btn-green" href="index.php"><i class="entypo-cancel"></i>
                                Cancelar</a></button>
                        </div>
                    </div>
                    </form>

                </div>

            </div>

        </div>
    </div>
</div>
</div>

</html>