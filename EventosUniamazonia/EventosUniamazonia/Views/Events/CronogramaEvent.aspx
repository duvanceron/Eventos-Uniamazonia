﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/Layout.Master" AutoEventWireup="true" CodeBehind="CronogramaEvent.aspx.cs" Inherits="EventosUniamazonia.Views.Events.CronogramaEvent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Cronograma</title>
    <meta name="description" content="cronograma" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="../../Means/css/styleRegistrarEvento.css" />
    <link rel="stylesheet" href="../../Means/fonts/style.css" />
    <link rel="stylesheet" href="../Means/assets/css/lib/datatable/dataTables.bootstrap.min.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content mt-3">
        <!-- Modal -->
        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" data-backdrop="static" data-keyboard="false">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="exampleModalLongTitle">Registrar Actividad</h4>
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

                                            <input type="text" id="name" name="name" class="designInput" runat="server" placeholder="Nombre del ponente" />

                                        </div>
                                        <div class="col-md-8 ">

                                            <input type="text" id="Tema" name="tema" class="designInput" runat="server" placeholder="Tema." />

                                        </div>
                                        <div class="col-md-8 ">
                                            <asp:DropDownList ID="listActivities" runat="server" class="designInput">
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col-md-8 ">
                                            <input type="datetime-local" name="date" id="date" class="designInput" runat="server" />

                                        </div>
                                    </div>


                                </fieldset>
                            </ContentTemplate>
                        </asp:UpdatePanel>


                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                        <asp:Button runat="server" ID="Save" CssClass="btn btn-primary" Text="Agregar" OnClick="Save_Click" />
                    </div>
                </div>
            </div>
        </div>


        <div class="animated fadeIn">
            <div class="row">

                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <div class="row">
                                <div class="col-md-9">
                                    <strong class="card-title">Mis eventos.</strong>
                                    <asp:DropDownList ID="DropDownEvent" runat="server" class="designInput">
                                    </asp:DropDownList>
                                </div>
                                <div class="col-md-3">
                                    <!-- Button trigger modal -->
                                    <div style="margin-bottom: 5px;">
                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
                                            Registrar Actividad.
                                        </button>
                                    </div>
                                    <div style="margin-bottom: 5px;">
                                        <button runat="server" type="button" class="btn btn-primary" onserverclick="Search_Cronogram">
                                            Consultar Cronograma 
                                        </button>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="card-body">
                            <table id="bootstrap-data-table1s" class="table table-striped table-bordered">
                                <thead>
                                    <tr>
                                        <th>Evento</th>
                                        <th>Nombre</th>
                                        <th>Tipo actividad</th>
                                        <th>Fecha/Hora</th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:ListView runat="server" ID="ListView1">
                                        <ItemTemplate>
                                            <tr>

                                                <td><%#Eval("tema")%> </td>
                                                <td><%#Eval("primerNombre") %> <%#Eval("primerApellido") %> <%#Eval("SegundoApellido") %></td>
                                                <td><%#Eval("tipo actividad")%> </td>
                                                <td><%#Eval("horaFecha")%>   <%#Eval("horaFechaFin")%></td>
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
