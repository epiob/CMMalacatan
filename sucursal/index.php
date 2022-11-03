<?php
include("../seguridad.php");
include_once("../central/central.php");
include("../conexion/clsConexion.php");
$obj=new clsConexion;
$result=$obj->consultar("select * from sucursal");
?>
<!DOCTYPE html>
<div class="page-container">
    <div class="main-content">
        <hr />
        <h2>Bodega</h2>
        <br />
        <a href="insertar.php" class="btn btn-primary">
            <i class="entypo-plus"></i>
            Nuevo
        </a>
        <br />
        <br />
        <table class="table table-bordered datatable" id="table-1">
            <thead>
                <tr class="info">
                    <th><a href="#phone">Nombre</a></th>
                    <th><a href="#phone">Bodega</a></th>
                    <!-- <th data-hide="phone"><a href="#">Telefono</a></th> -->
                    <!-- <th><a href="#">Representante</a></th> -->
                    <!-- <th><a href="#">Serie</a></th> -->
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <?php
		foreach((array)$result as $row){
			?>
                <tr>
                    <td><?php echo $row['razon_social'];?></td>
                    <td><?php echo $row['direccion'];?></td>
                    <!-- <td><?php echo $row['telefono'];?></td> -->
                    <!-- <td><?php echo $row['representante'];?></td>
					<td><?php echo $row['serie'];?></td> -->
                    <td>
                        <?php echo "<a href='actualizar.php?idsucursal=".$row['idsucursal']."' class='btn btn-info btn-sm btn-icon icon-left'><i class='entypo-pencil'></i>Editar</a>"?>
                        <?php echo "<a href='eliminar.php?cod=".$row['idsucursal']."' class='btn btn-danger btn-sm btn-icon icon-left'><i class='entypo-cancel'></i>Eliminar</a>"?>
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
            phone: 480
        };
        var tableContainer;

        jQuery(document).ready(function($) {
            tableContainer = $("#table-1");

            tableContainer.dataTable({
                "sPaginationType": "bootstrap",
                "aLengthMenu": [
                    [10, 25, 50, -1],
                    [10, 25, 50, "All"]
                ],
                "bStateSave": true,


                // Responsive Settings
                bAutoWidth: false,
                fnPreDrawCallback: function() {
                    // Initialize the responsive datatables helper once.
                    if (!responsiveHelper) {
                        responsiveHelper = new ResponsiveDatatablesHelper(tableContainer,
                            breakpointDefinition);
                    }
                },
                fnRowCallback: function(nRow, aData, iDisplayIndex, iDisplayIndexFull) {
                    responsiveHelper.createExpandIcon(nRow);
                },
                fnDrawCallback: function(oSettings) {
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