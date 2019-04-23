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
                            <strong class="card-title">Mis eventos.</strong>
                            <asp:DropDownList ID="DropDownEvents" runat="server" class="designInput">
                            </asp:DropDownList>
                            <asp:Button ID="search" runat="server" Text="Consultar" />
                        </div>

                        <div class="card-body">
                            <table id="bootstrap-data-table1s" class="table table-striped table-bordered">
                                <thead>
                                    <tr>
                                        <th>Nombre</th>
                                        <th>Evento</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:ListView runat="server" ID="listEvents">
                                        <ItemTemplate>
                                            <tr>
                                                <td><%#Eval("primerNombre") %> <%#Eval("primerApellido") %> <%#Eval("SegundoApellido") %> </td>
                                                <td><%#Eval("nombre") %> </td>
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
</asp:Content>
