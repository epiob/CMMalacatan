<?php
ob_start();
include("../seguridad.php");
include("../central/central.php");
include_once("../conexion/clsConexion.php");
$usu=$_SESSION["usuario"];
$idsucursal=$_SESSION["sucursal"];
$obj= new clsConexion();
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <link rel="stylesheet" href="../assets/alert/alertify/alertify.css">
    <link rel="stylesheet" href="../assets/alert/alertify/themes/default.css">
    <link rel="stylesheet" href="../assets/alert/jquery-ui.css">
    <style>
    .columnas2 {
        text-align: center
    }

    .left {
        float: left;
    }

    .right {
        float: right;
    }

    .center {
        display: inline-block
    }

    .FACTURA,
    .BOLETA,
    .TICKET {
        display: none;
    }

    .modal-backdrop {
        position: fixed;
        top: 0;
        right: 0;
        bottom: 0;
        left: 0;
        z-index: 1050;
        background-color: #000000;
    }
    </style>
</head>

<body class="page-body">
    <div class="page-container">
        <div class="main-content">
            <?php include('../central/cabecera.php');?>
            <div class="panel-title">
                <b>Ingreso</b>
            </div>
            <form class="nuevo" action="guardarcompra.php" method="post">
                <div class="row">
                    <div class="col-sm-9">
                        <div class="panel panel-info">
                            <div class="panel-body">
                                <label><strong>Producto:</strong></label>
                                <div class="col-sm-12">
                                    <div class="input-group">
                                        <input type="hidden" class="form-control" name="idproducto" id="idproducto">
                                        <input type="text" class="form-control" placeholder="buscar por descripcion"
                                            name="des" id="des">
                                        <input type="hidden" class="form-control" name="pres" id="pres">
                                        <input type="hidden" class="form-control" name="precio" id="precio">
                                        <input type="hidden" class="form-control" name="descuento" id="descuento">
                                        <div class="input-group-btn">
                                            <button type="button" class="btn btn-info" name="btn_add" id="btn_add"><span
                                                    class="glyphicon glyphicon-shopping-cart"> agrega</span></button>
                                        </div>
                                    </div>
                                </div><br>
                            </div>
                        </div>
                        <div class="panel panel-info">
                            <div class="table-responsive">
                                <div id="live_data"></div>
                            </div>
                        </div>
                        <div class="panel panel-info">
                            <div class="panel-footer">
                                <div align="center">
                                    <button type="button" class="btn btn-info"
                                        onClick="location.href='limpiar.php'"><span class="glyphicon glyphicon-refresh">
                                            Limpiar</span></button>
                                    <button type="submit" class="btn btn-primary"><span
                                            class="glyphicon glyphicon glyphicon-floppy-saved">
                                            Registrar</span></button>

                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-3">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="panel panel-info">
                                    <div class="panel-heading">
                                        <div id="live_total"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="panel panel-info">
                                    <div class="panel-body">
                                        <label>TIPO DOCUMENTO:</label>
                                        <select class="form-control" name="docu" required>
                                            <option value="FACTURA">FACTURA</option>
                                            <option value="BOLETA">BOLETA</option>
                                        </select><br>
                                        <label>N?? DE ORDEN:</label>
                                        <input type="text" class="form-control" required name="numdocu" id="numdocu" />
                                        <br>

                                        <label>PROVEEDOR: </label>

                                        <button type="button" class="btn btn-primary"
                                            onclick="jQuery('#modal-1').modal('show');">
                                            <i class="entypo-plus"></i> Agregar</button>

                                        <input type="hidden" name="idlab_pro" required id="idlab_pro" />
                                        <input type="text" class="form-control" required name="prov" id="prov" /><br>

                                        <label>FECHA DE EMISION:</label>
                                        <input type="text" id="fecha" name="fecha" value="<?php echo (date('Y-m-d'));?>"
                                            class="form-control" readonly /><br>

                                        <div class="table-responsive">
                                            <div id="live_igv"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <div class="modal fade" id="modal-1">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">Agregar Laboratorio Proveedor</h4>
                </div>

                <div class="modal-body">
                    <form role="form" name="miformulario" action="../laboratorio/capturar2.php" method="post">
                        <input type="hidden" name="txtidsucu_c" value=<?php echo "$idsucursal"; ?>>
                        <div class="col-md-6 form-group">
                            <label><strong>Laboratorio(*)</strong></label>
                            <input type="text" name="txtla" class="form-control" required
                                placeholder="ingrese el laboratorio">
                        </div>



                        <div class="col-md-6 form-group">
                            <label><strong>Direccion(*):</strong></label>
                            <input type="text" name="txtdir" class="form-control" required id="field-file"
                                placeholder="ingrese su Direccion">
                        </div>

                        <div class="col-md-6 form-group">
                            <label><strong>Telf(*)</strong></label>
                            <input type="text" name="txtt" class="form-control" required id="field-file" maxlength="15"
                                placeholder="ingrese su Telefono">
                        </div>

                        <div class="col-md-6 form-group">
                            <label><strong>E-mail:</strong></label>
                            <input type="text" name="txtemail" class="form-control" id="field-file"
                                placeholder="ingrese su email ">
                        </div>
                </div>

                <div class="panel-footer">
                    <div align="right">
                        <div align="left">
                            (*) campos obligatorios
                        </div>
                        <button type="submit" name="funcion" value="registrar"
                            class="btn btn-info btn-icon icon-left"><i class="entypo-check"></i>Registrar</button>

                    </div>
                </div>

                </form>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                </div>
            </div>

        </div>
    </div>

    </div>

    <script src="../assets/alert/alertify/alertify.js"></script>
    <script src="../assets/alert/jquery-ui.js"></script>
    <script type="text/javascript">
    //busquedaproductos
    $(function() {
        $("#des").autocomplete({
            source: "busquedaproductos.php",
            minLength: 2,
            select: function(event, ui) {
                event.preventDefault();
                $('#cod').val(ui.item.codigo);
                $('#des').val(ui.item.descripcion);
                $('#pres').val(ui.item.presentacion);
                $('#precio').val(ui.item.precio);
                $('#descuento').val(ui.item.descuento);
                $('#idproducto').val(ui.item.idproducto);
            }
        });
    });

    //busqueda de clientes
    $(function() {
        $("#prov").autocomplete({
            source: "busquedaprovedor.php",
            minLength: 2,
            select: function(event, ui) {
                event.preventDefault();
                $('#prov').val(ui.item.laboratorio);
                $('#idlab_pro').val(ui.item.idlab_pro);
            }
        });
    });
    </script>
    <script>
    $(document).ready(function() {
        function fetch_data() {
            $.ajax({
                url: "consultacarrito.php",
                method: "POST",
                success: function(data) {
                    $('#live_data').html(data);
                }
            });
        }
        fetch_data();
        //calculo del igv , subtotal, etc
        function fetch_igv() {
            $.ajax({
                url: "consultaigv.php",
                method: "POST",
                success: function(data) {
                    $('#live_igv').html(data);

                }
            });
        }
        fetch_igv();

        function fetch_total() {
            $.ajax({
                url: "consultatotal.php",
                method: "POST",
                success: function(data) {
                    $('#live_total').html(data);

                }
            });
        }
        fetch_total();

        // guardar por descripcion
        $(document).on('click', '#btn_add', function() {
            var idproducto = $('#idproducto').val();
            var des = $('#des').val();
            var pres = $('#pres').val();
            var precio = $('#precio').val();
            var descuento = $('#descuento').val();
            $.ajax({
                url: "guardarcarrito.php",
                method: "POST",
                data: {
                    idproducto: idproducto,
                    des: des,
                    pres: pres,
                    precio: precio,
                    descuento: descuento
                },
                dataType: "text",
                success: function(data) {
                    console.log(data);
                    //alertify.alert('Agregar',data);
                    fetch_data();
                    fetch_igv();
                    fetch_total();
                    limpiar();
                }
            })
        });

        $(document).on('click', '.btn_delete', function() {
            var id = $(this).data("id3");
            $.ajax({
                url: "eliminarcarrito.php",
                method: "POST",
                data: {
                    id: id
                },
                dataType: "text",
                success: function(data) {
                    fetch_data();
                    fetch_igv();
                    fetch_total();
                }
            });
        });

        function limpiar() {
            $('#cod').val('');
            $('#des').val('');
            $('#pres').val('');
            $('#precio').val('');
            $('#idproducto').val('');
            $('#des').focus();
        }

        function edit_data(id, text, cantidad) {
            $.ajax({
                url: "actualizarcarrito.php",
                method: "POST",
                data: {
                    id: id,
                    text: text,
                    cantidad: cantidad
                },
                dataType: "text",

            }).success(function(data) {
                alertify.alert('mensaje', data);
                //alert(data);
                fetch_data();
                fetch_igv();
                fetch_total();
            });
        }

        function edit_datap(id, text, precio) {
            $.ajax({
                url: "actualizarcarritop.php",
                method: "POST",
                data: {
                    id: id,
                    text: text,
                    precio: precio
                },
                dataType: "text",

            }).success(function(data) {
                alertify.alert('mensaje', data);
                //alert(data);
                fetch_data();
                fetch_igv();
                fetch_total();
            });
        }
        $(document).on('blur', '.cantidad', function(event) {
            event.preventDefault();
            var id = $(this).attr("id2");
            var cantidad = $(this).text();
            edit_data(id, cantidad, "cantidad");
        });

        $(document).on('blur', '.precio', function(event) {
            event.preventDefault();
            var id = $(this).attr("id1");
            var precio = $(this).text();
            edit_datap(id, precio, "precio");
        });
    });
    </script>
</body>

</html>