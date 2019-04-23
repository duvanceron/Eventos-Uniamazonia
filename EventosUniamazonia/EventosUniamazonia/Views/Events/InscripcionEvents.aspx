<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/Layout.Master" AutoEventWireup="true" CodeBehind="InscripcionEvents.aspx.cs" Inherits="EventosUniamazonia.Views.Events.InscripcionEvents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Inscripciones</title>
    <meta name="description" content="Inscripcion" />
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
                            <strong class="card-title">Eventos en la Universidad de la Amazonia</strong>
                        </div>
                        <div class="card-body">
                            <table id="bootstrap-data-table1s" class="table table-striped table-bordered">
                                <thead>
                                    <tr>
                                        <th>Evento</th>
                                        <th>Director</th>
                                        <th>Tema</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:ListView runat="server" ID="ListView1">
                                        <ItemTemplate>
                                            <tr>
                                                <td><%#Eval("Nombre")%> </td>
                                                <td><%#Eval("Director")%> </td>
                                                <td><%#Eval("Tema")%> </td>
                                                <td>
                                                    <asp:LinkButton runat="server" OnCommand="Unnamed_Command" CssClass="btn btn-success" CommandArgument='<%#Eval("idEvento")%>' CommandName="Registro">
                                                        Registrar
                                                    </asp:LinkButton>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:ListView>

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
        $(document).ready(function () {
            $('#bootstrap-data-table-export').DataTable();
        });
        $('#bootstrap-data-table1s').dataTable({
            "ordering": false
        });
    </script>

</asp:Content>
