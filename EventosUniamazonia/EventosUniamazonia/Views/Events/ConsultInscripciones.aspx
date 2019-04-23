<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/Layout.Master" AutoEventWireup="true" CodeBehind="ConsultInscripciones.aspx.cs" Inherits="EventosUniamazonia.Views.Events.ConsultInscripciones" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Consultar inscripciones.</title>
    <meta name="description" content="Consultar inscripciones" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="../../Means/css/styleGlobal.css" />
    <link rel="stylesheet" href="../../Means/fonts/style.css" />
    <link rel="stylesheet" href="../Means/assets/css/lib/datatable/dataTables.bootstrap.min.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content mt-3">
        <div class="animated fadeIn">
            <div class="row">

                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <div class="row">
                                <div class="col-md-10">
                                    <strong class="card-title">Inscritos al evento.</strong>
                                    <asp:DropDownList ID="DropDownEvents" runat="server" class="designInput">
                                    </asp:DropDownList>
                                </div>
                                <div class="col-md-2">
                                    <asp:Button ID="search" runat="server" Text="Consultar" CssClass="btn btn-primary" OnClick="Search_Click" />
                                </div>
                            </div>

                        </div>

                        <div class="card-body">
                            <table id="bootstrap-data-table1s" class="table table-striped table-bordered">
                                <thead>
                                    <tr>
                                        <th class="text-center">CEDULA</th>
                                        <th class="text-center">NOMBRE DEL PARTICIPANTE</th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:ListView runat="server" ID="listEvents">
                                        <ItemTemplate>
                                            <tr>
                                                <td><%#Eval("cedula") %> </td>
                                                <td><%#Eval("primerNombre") %> <%#Eval("segundoNombre") %>  <%#Eval("primerApellido") %> <%#Eval("SegundoApellido") %> </td>

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

    </div>


    <%-- <script src="../../Means/assets/js/vendor/jquery-2.1.4.min.js"></script>--%>
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
