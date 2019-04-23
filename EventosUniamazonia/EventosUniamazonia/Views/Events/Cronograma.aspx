<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/Layout.Master" AutoEventWireup="true" CodeBehind="Cronograma.aspx.cs" Inherits="EventosUniamazonia.Views.Events.Cronograma" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Cronograma</title>
    <meta name="description" content="cronograma" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />


    <link rel="stylesheet" href="../Means/assets/css/lib/datatable/dataTables.bootstrap.min.css" />

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content mt-3">
        <div class="animated fadeIn">
            <div class="row">

                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <strong class="card-title">Cronograma</strong>
                        </div>
                        <div>

                            <!-- Button trigger modal -->
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
                                Seleccionar actividad
                            </button>

                            <!-- Modal -->
                            <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" data-backdrop="static" data-keyboard="false">
                                <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h4 class="modal-title" id="exampleModalLongTitle">Seleccionar sitio</h4>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <asp:ScriptManager ID="script" runat="server" EnablePartialRendering="true"></asp:ScriptManager>
                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                <ContentTemplate>
                                                    <fieldset>
                                                        <div class="row">
                                                            <div class="col-md-8">

                                                                <asp:DropDownList ID="DropDown" runat="server" class="designInput">
                                                                </asp:DropDownList>

                                                            </div>
                                                            <div class="col-md-3 " id="bttnAddRemove">

                                                                <asp:Button ID="Remove" runat="server" Text="Eliminar"  />
                                                                <asp:Button ID="Add" runat="server" Text="Agregar"/>

                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-8 ">
                                                                <asp:ListBox ID="ListSites" runat="server" class="ListSites"></asp:ListBox>
                                                            </div>

                                                        </div>
                                                    </fieldset>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>


                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                            <asp:Button runat="server" ID="Save" CssClass="btn btn-primary"  Text="Agregar" />
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="card-body">
                            <!--bootstrap-data-table..id de la tabla para diseño de boostrap -->
                            <table id="table" class="table table-striped table-bordered">
                                <caption>Cronograma</caption>
                                <thead>
                                    <tr>
                                        <th>Cedula</th>
                                        <th>Nombre</th>
                                        <th>Tema</th>
                                        <th>Actividad</th>
                                    </tr>
                                </thead>
                                <tbody id="tabla">
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>


            </div>
        </div>
        <!-- .animated -->
    </div>
    <!-- .content -->


    <script src="../../Means/assets/js/vendor/jquery-2.1.4.min.js"></script>
    <script src="../../Means/assets/js/popper.min.js"></script>
    <script src="../../Means/assets/js/plugins.js"></script>
    <script src="../../Means/assets/js/main.js"></script>

    <script src="../../Means/assets/js/lib/data-table/datatables.min.js"></script>
    <script src="../../Means/assets/js/lib/data-table/dataTables.bootstrap.min.js"></script>
    <script src="../../Means/assets/js/lib/data-table/dataTables.buttons.min.js"></script>
    <script src="../../Means/assets/js/lib/data-table/buttons.bootstrap.min.js"></script>
    <script src="../../Means/assets/js/lib/data-table/jszip.min.js"></script>
    <script src="../../Means/assets/js/lib/data-table/pdfmake.min.js"></script>
    <script src="../../Means/assets/js/lib/data-table/vfs_fonts.js"></script>
    <script src="../../Means/assets/js/lib/data-table/buttons.html5.min.js"></script>
    <script src="../../Means/assets/js/lib/data-table/buttons.print.min.js"></script>
    <script src="../../Means/assets/js/lib/data-table/buttons.colVis.min.js"></script>
    <script src="../../Means/assets/js/lib/data-table/datatables-init.js"></script>



    <script type="text/javascript">
        $(function () {
            $('#search').keydown(function () {

                var buscar = $('#search').val();
                if (buscar.length >= 1) {
                    $.ajax({
                        type: "POST",
                        url: '../../WebService.asmx/GetUser',
                        data: '{id:' + buscar + '}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: resultado,
                        error: errores
                    });
                }

            });
        });
        function resultado(msg) {
            //msg.d tiene el resultado devuelto por el método
            var nFilas = $("#tabla tr").length;
            $("tr:first")
            $('#tabla').children('tr').remove();
            var add = "Agregar";
            var items = msg.d;
            red = "red";
            $.each(items, function (index, item) {
                $("#tabla").append("<tr><td>" + item.identification + "</td> <td>" + item.name1 + " " +
                    item.name2 + " " + item.lastname1 + " " + item.lastname2 + "</td> <td>" + item.theme + "</td> <td>" +
                    item.theme + "</td><td><button type='button' class='btn btn-danger btn_delete' id='btn_add' onclick='add_function()'>Delete</button> </td></tr>");
            });


        }
        function errores(msg) {
            //msg.responseText tiene el mensaje de error enviado por el servidor
            alert('Error: ' + msg.responseText);
        }

    </script>
    <script type="text/javascript">
        function Cronograma(cedula, nombre, tema) {
            this.cedula = cedula;
            this.nombre = nombre;
            this.tema = tema;
        }

        function add_function() {
            var cedula = $('#table tbody').find('td').eq(0).text();
            var nombre = $('#table tbody').find('td').eq(1).text();
            var tema = $('#table tbody').find('td').eq(2).text();

            var itemCron = new Cronograma(cedula, nombre, tema);

        }
    </script>


</asp:Content>
