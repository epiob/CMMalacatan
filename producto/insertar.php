<?php
include("../seguridad.php");
include_once("../central/central.php");
include("../conexion/clsConexion.php");
$objproductos=new clsConexion;
ob_start();
$idsucursal=$_SESSION["sucursal"];
$estado='';
$tipo='';
$sujeta='';
?>
<!DOCTYPE html>

<head>
    <link rel="stylesheet" href="../assets/alert/alertify/alertify.css">
    <link rel="stylesheet" href="../assets/alert/alertify/themes/default.css">
    <link rel="stylesheet" href="../assets/alert/jquery-ui.css">
    <style>
    .modal-backdrop {
        position: fixed;
        top: 0;
        right: 0;
        bottom: 0;
        left: 0;
        z-index: 0;
        background-color: #000000;
    }

    .modal-content {
        border: 10px solid rgba(28, 110, 164, 0.64);
        border-radius: 21px;
    }
    </style>
</head>
<div class="page-container">
    <div class="main-content">
        <?php include('../central/cabecera.php');?>
        <hr />
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-info" data-collapsed="0">

                    <div class="panel-heading">
                        <div class="panel-title">
                            Registro productos
                        </div>
                    </div>

                    <div class="panel-body">

                        <form role="form" name="miformulario" action="capturar.php" method="post">
                            <input type="hidden" name="txtidsucu_c" value=<?php echo "$idsucursal"; ?>>


                            <div class="col-md-6 form-group">
                                <label>Lote(*) </label>
                                <button type="button" class="btn btn-primary"
                                    onclick="jQuery('#modal-lote').modal('show');">
                                    <i class="entypo-plus"></i> Agregar</button>
                                <select name="txtlo" class='form-control' required>
                                    <?php
                                                                        $result=$objproductos->consultar("select * from lote WHERE idsucu_c='$idsucursal' order by numero asc");
                                                                        foreach((array)$result as $row){
                                                                        if($row['idlote']==$txtlo){
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
                                    name="txtde">
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
                                    placeholder="ingrese el stock">
                            </div>

                            <div class="col-md-6 form-group">
                                <label><strong>stock minimo(*)</strong></label>
                                <input type="text" name="txtstm" class="form-control" required
                                    placeholder="ingrese el stock minimo">
                            </div>

                            <div class="col-md-6 form-group">
                                <label><strong>precio compra(*)</strong></label>
                                <input type="text" name="txtpc" class="form-control" required
                                    placeholder="ingrese el precio compra">
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
                                <input type="text" name="txtfec" value="<?php echo (date('Y-m-d'));?>"
                                    class="form-control" readonly required="true" />
                            </div>

                            <div class="col-md-6 form-group">
                                <label>Presentacion(*) </label>
                                <button type="button" class="btn btn-primary"
                                    onclick="jQuery('#modal-pre').modal('show');">
                                    <i class="entypo-plus"></i> Agregar</button>
                                <select name="tpre" class='form-control' required>
                                    <?php
                                                                        $result=$objproductos->consultar("select * from presentacion WHERE idsucu_c='$idsucursal' order by presentacion asc ");
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
                                <label>Laboratorio(*) </label>
                                <button type="button" class="btn btn-primary"
                                    onclick="jQuery('#modal-lab').modal('show');">
                                    <i class="entypo-plus"></i> Agregar</button>
                                <select name="tla" class='form-control' required>
                                    <?php
                                                                        $result=$objproductos->consultar("select * from laboratorio_proveedor WHERE idsucu_c='$idsucursal' order by laboratorio asc");
                                                                        foreach((array)$result as $row){
                                                                        if($row['idlab']==$tla){
                                                                            echo '<option value="'.$row['idlab_pro'].'" selected>'.$row['laboratorio'].'</option>';
                                                                        }else{
                                                                            echo '<option value="'.$row['idlab_pro'].'">'.$row['laboratorio'].'</option>';
                                                                        }
                                                                    }
                                    ?>
                                </select>
                            </div>

                            <div class="col-md-6 form-group">
                                <label>Sintomas(*) </label>
                                <button type="button" class="btn btn-primary"
                                    onclick="jQuery('#modal-sin').modal('show');">
                                    <i class="entypo-plus"></i> Agregar</button>
                                <select name="tsi" class='form-control' required>
                                    <?php
                                                                        $result=$objproductos->consultar("select * from sintoma WHERE idsucu_c='$idsucursal' order by sintoma asc");
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


                            <div class="panel-footer">
                                <div align="right">
                                    <div align="left">
                                        (*) campos obligatorios
                                    </div>
                                    <button type="submit" name="funcion2" value="registrar2"
                                        class="btn btn-info btn-icon icon-left"><i
                                            class="entypo-check"></i>Registrar</button>
                                    <a class="btn btn-green btn-icon icon-left" href="index.php"><i
                                            class="entypo-cancel"></i>Cancelar</a>
                                </div>
                            </div>

                        </form>
                    </div>

                    <!-- Modal Lote-->
                    <div class="modal fade" id="modal-lote">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">

                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"
                                        aria-hidden="true">&times;</button>
                                    <h4 class="modal-title">Agregar Lote</h4>
                                </div>

                                <div class="modal-body">

                                    <form role="form" class="form-horizontal form-groups-bordered"
                                        action="../lote/capturar2.php" method="post">
                                        <input type="hidden" name="txtidsucu_c" value=<?php echo "$idsucursal"; ?>>
                                        <div class="form-group">
                                            <label for="field-1" class="col-sm-3 control-label">lote(*)</label>
                                            <div class="col-sm-5">
                                                <input type="text" name="txtlo" class="form-control" required
                                                    placeholder="ingrese el lote">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="field-1" class="col-sm-3 control-label">Fecha De
                                                Vencimiento(*)</label>
                                            <div class="col-sm-5">
                                                <input type="date" name="txtfec" step="1" class="form-control"
                                                    min="<?php echo date("Y-m-d");?>">
                                            </div>
                                        </div>
                                        <div class="panel-footer">
                                            <div align="right">
                                                <div align="center">
                                                    (*) campos obligatorios
                                                </div>
                                                <button type="submit" name="funcion" value="registrar"
                                                    class="btn btn-info btn-icon icon-left"><i
                                                        class="entypo-check"></i>Registrar</button>
                                            </div>
                                        </div>
                                    </form>

                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default"
                                            data-dismiss="modal">Cerrar</button>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                    <!-- Modal Lote-->


                    <!-- Modal  Presentacion-->
                    <div class="modal fade" id="modal-pre">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">

                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"
                                        aria-hidden="true">&times;</button>
                                    <h4 class="modal-title">Agregar Presentacion</h4>
                                </div>

                                <div class="modal-body">

                                    <form role="form" class="form-horizontal form-groups-bordered"
                                        action="../presentacion/capturar2.php" method="post">
                                        <input type="hidden" name="txtidsucu_c" value=<?php echo "$idsucursal"; ?>>

                                        <div class="form-group">
                                            <label for="field-1" class="col-sm-3 control-label">presentacion</label>
                                            <div class="col-sm-5">
                                                <input type="text" name="txtn" class="form-control" required
                                                    placeholder="ingrese su presentacion">
                                            </div>
                                        </div>

                                        <div class="panel-footer">
                                            <div align="right">
                                                <div align="center">
                                                    (*) campos obligatorios
                                                </div>
                                                <button type="submit" name="funcion" value="registrar"
                                                    class="btn btn-info btn-icon icon-left"><i
                                                        class="entypo-check"></i>Registrar</button>
                                            </div>
                                        </div>

                                    </form>

                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default"
                                            data-dismiss="modal">Cerrar</button>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>

                    <!--Modal  Presentacion  -->


                    <!-- Modal  Laboratorio-->
                    <div class="modal fade" id="modal-lab">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"
                                        aria-hidden="true">&times;</button>
                                    <h4 class="modal-title">Agregar Laboratorio </h4>
                                </div>

                                <div class="modal-body">

                                    <form role="form" name="miformulario" action="../laboratorio/capturar2.php"
                                        method="post">

                                        <input type="hidden" name="txtidsucu_c" value=<?php echo "$idsucursal"; ?>>

                                        <div class="col-md-6 form-group">
                                            <label><strong>Laboratorio(*)</strong></label>
                                            <input type="text" name="txtla" class="form-control" required
                                                placeholder="ingrese el laboratorio">
                                        </div>

                                        <div class="col-md-6 form-group">
                                            <label><strong>Direccion(*):</strong></label>
                                            <input type="text" name="txtdir" class="form-control" required
                                                id="field-file" placeholder="ingrese su Direccion">
                                        </div>

                                        <div class="col-md-6 form-group">
                                            <label><strong>Telf(*)</strong></label>
                                            <input type="text" name="txtt" class="form-control" required id="field-file"
                                                maxlength="15" placeholder="ingrese su Telefono">
                                        </div>

                                        <div class="col-md-6 form-group">
                                            <label><strong>E-mail:</strong></label>
                                            <input type="text" name="txtemail" class="form-control" id="field-file"
                                                placeholder="ingrese su email ">
                                        </div>

                                        <div class="panel-footer">
                                            <div align="right">
                                                <div align="center">
                                                    (*) campos obligatorios
                                                </div>
                                                <button type="submit" name="funcion" value="registrar"
                                                    class="btn btn-info btn-icon icon-left"><i
                                                        class="entypo-check"></i>Registrar</button>
                                            </div>
                                        </div>

                                    </form>

                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default"
                                            data-dismiss="modal">Cerrar</button>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                    <!--Modal  Laboratorio  -->


                    <!-- Modal  Sintomas-->
                    <div class="modal fade" id="modal-sin">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"
                                        aria-hidden="true">&times;</button>
                                    <h4 class="modal-title">Agregar Sintoma</h4>
                                </div>

                                <div class="modal-body">
                                    <form role="form" class="form-horizontal form-groups-bordered"
                                        action="../sintomas/capturar2.php" method="post">

                                        <div class="form-group">
                                            <label for="field-1" class="col-sm-3 control-label">sintomas(*)</label>
                                            <div class="col-sm-5">
                                                <input type="text" name="txtsi" class="form-control" required
                                                    placeholder="ingrese el sintoma">
                                            </div>
                                        </div>

                                        <div class="panel-footer">
                                            <div align="right">
                                                <div align="center">
                                                    (*) campos obligatorios
                                                </div>
                                                <button type="submit" name="funcion" value="registrar"
                                                    class="btn btn-info btn-icon icon-left"><i
                                                        class="entypo-check"></i>Registrar</button>
                                            </div>
                                        </div>

                                    </form>

                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default"
                                            data-dismiss="modal">Cerrar</button>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                    <!--Modal  Sintomas  -->



                </div>
            </div>
        </div>
    </div>
</div>