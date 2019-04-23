<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/Layout.Master" AutoEventWireup="true" CodeBehind="MassiveMail.aspx.cs" Inherits="EventosUniamazonia.Views.Events.MassiveMail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Correos masivos.</title>
    <meta name="description" content="Correos masivos" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="../../Means/css/styleGlobal.css" />
    <link rel="stylesheet" href="../../Means/fonts/style.css" />
    <link rel="stylesheet" href="../Means/assets/css/lib/datatable/dataTables.bootstrap.min.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="exampleModalLongTitle">Correos masivos</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <asp:ScriptManager ID="script" runat="server" EnablePartialRendering="true"></asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <fieldset>
                                <div class="col-md-8">
                                    <h6 class="title" id="titleEmail">Correos del evento.</h6>
                                    <asp:ListBox ID="ListEmail" runat="server" Width="100%" Height="100px"></asp:ListBox>
                                </div>
                                <div class="col-md-4">
                                    <asp:Button ID="Remove" runat="server" Text="Eliminar" OnClick="Remove_Click" CssClass="designButtonSmall" />
                                    <asp:Button ID="search" runat="server" Text="Consultar" CssClass="designButtonSmall" OnClick="Search_Click" />
                                </div>

                            </fieldset>
                        </ContentTemplate>
                    </asp:UpdatePanel>


                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>

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
                            <div class="row">
                                <div class="col-md-10">
                                    <strong class="card-title">Correos masivos.</strong>
                                    <asp:DropDownList ID="DropDownEvents" runat="server" class="designInput">
                                    </asp:DropDownList>
                                </div>
                                <div class="col-md-2">
                                    <button type="button" class="btn btn-primary pull-right rounded" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">Consultar correos.</button>
                                    <%-- <asp:Button ID="search" runat="server" Text="Consultar correos" CssClass="btn btn-primary" OnClick="Search_Click" />--%>
                                </div>
                            </div>

                        </div>


                        <div class="card-body">
                            <div class="col-md-2"></div>
                            <div class="col-md-8 col-centrada   container-form2">

                                <div class="input-group row">
                                    <input type="text" id="to" name="to" class="designInput " runat="server" />
                                    <label for="to" class="labelDesign"><span class="icon-user"></span>Para:</label>

                                </div>
                                <div class="input-group row">
                                    <input type="text" id="affair" name="affair" class="designInput " runat="server" placeholder="Agregar Asunto" />

                                </div>
                                <div class="input-group row">
                                    <textarea class="form-control txtArea" id="bodyEmail" runat="server"></textarea>
                                    <%-- <asp:TextBox ID="Body" runat="server" Width="100%" Height="150px" ></asp:TextBox>--%>
                                </div>
                                <asp:Button ID="Enviar" runat="server" CssClass="designButtonV" Text="Enviar" OnClick="Send_Click" />

                            </div>
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
