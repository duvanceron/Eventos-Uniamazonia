<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/Layout.Master" AutoEventWireup="true" CodeBehind="ConsultPersons.aspx.cs" Inherits="EventosUniamazonia.Views.Person.ConsultPersons" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Consultar usuarios.</title>
    <meta name="description" content="ConsultUsers" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="../../Means/css/styleGlobal.css" />
    <link rel="stylesheet" href="../../Means/fonts/style.css" />
    <link rel="stylesheet" href="../Means/assets/css/lib/datatable/dataTables.bootstrap.min.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="containerUno">
        <!-- Button trigger modal -->


        <!-- Modal -->
        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" data-backdrop="static" data-keyboard="false">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="exampleModalLongTitle">Cambiar rol</h4>
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
                                            <input type="text" id="cedula" name="cedula" class="designInput" runat="server" placeholder="Ingrese la cedula" />
                                        </div>

                                        <div class="col-md-3 " id="bttnAddRemove">

                                            <asp:Button ID="Search" runat="server" Text="Buscar" CssClass="designButtonSmall" OnClick="Search_Click" />

                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-8 ">

                                            <input type="text" id="name" name="name" class="designInput" runat="server" placeholder="Nombre del usuario." />

                                        </div>
                                        <div class="col-md-8 ">

                                            <input type="text" id="rolActual" name="rolActual" class="designInput" runat="server" placeholder="Rol actual." />

                                        </div>
                                        <div class="col-md-8 ">
                                            <asp:DropDownList ID="listRoles" runat="server" class="designInput">
                                            </asp:DropDownList>
                                        </div>

                                    </div>


                                </fieldset>
                            </ContentTemplate>
                        </asp:UpdatePanel>


                    </div>
                    <div class="modal-footer">

                        <asp:Button runat="server" ID="btnClose" CssClass="btn btn-secondary" Text="Cerrar" />
                        <asp:Button runat="server" ID="Save" CssClass="btn btn-primary" Text="Modificar" onclick="Save_Click"/>
                    </div>
                </div>
            </div>
        </div>

        <div class="content mt-3">
            <div class="animated fadeIn">
                <div class="row">

                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <strong class="card-title">Usuarios.</strong>
                                <button type="button" class="btn btn-primary pull-right rounded" data-toggle="modal" data-target="#exampleModalCenter">
                                    Asignar rol.
                                </button>
                            </div>

                            <div class="card-body">
                                <table id="bootstrap-data-table1s" class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                            <th>Cedula</th>
                                            <th>Nombre</th>
                                            <th>Rol</th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:ListView runat="server" ID="ListPersons">
                                            <ItemTemplate>
                                                <tr>
                                                    <td><%#Eval("cedula") %> </td>
                                                    <td><%#Eval("primerNombre") %> <%#Eval("primerApellido") %> <%#Eval("SegundoApellido") %> </td>
                                                    <td><%#Eval("Rol") %> </td>

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

    </div>


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
