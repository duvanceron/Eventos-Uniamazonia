<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/Layout.Master" AutoEventWireup="true" CodeBehind="RegisterEvent.aspx.cs" Inherits="EventosUniamazonia.Views.Events.RegisterEvent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Registrar Evento</title>
    <link rel="stylesheet" href="../../Means/css/styleRegistrarEvento.css" />
    <link rel="stylesheet" href="../../Means/fonts/style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="wrapper">
        <section class="main">

            <div class="container-form">


                <button type="button" class="btn btn-primary pull-right rounded" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">Solicitar recurso.</button>

                <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Solicitar recursos</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">

                                <div class="form-group">
                                    <label for="message-text" class="col-form-label">Recursos.</label>
                                    <textarea class="form-control" id="message-text"></textarea>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                <button type="button" class="btn btn-primary">Agregar</button>
                            </div>
                        </div>
                    </div>
                </div>

                <h2 style="color: #C7DBD0; text-align: center; padding-bottom: 4px;">Registrar evento.</h2>
                <div class="form" id="formRegisterID">
                    <div class="col-sm-6" id="primerRegistro">
                        <div class="input-group">
                            <input type="text" id="name" name="name" class="designInput " runat="server" />
                            <label for="name" class="labelDesign"><span class="icon-user"></span>Nombre:</label>
                        </div>
                        <div class="input-group">
                            <input type="text" id="schedule" name="schedule" class="designInput" runat="server" />
                            <label for="schedule" class="labelDesign"><span class="icon-user"></span>Horario:</label>
                        </div>
                        <div class="input-group">
                            <input type="text" id="director" name="director" class="designInput" runat="server" />
                            <label for="director" class="labelDesign"><span class="icon-user"></span>Director:</label>
                        </div>
                        <div class="input-group">
                            <input type="text" id="theme" name="theme" class="designInput" runat="server" />
                            <label for="theme" class="labelDesign"><span class="icon-user"></span>Tema:</label>
                        </div>
                    </div>
                    <div class="col-sm-6">

                        <div class="input-group">
                            <div class="container">
                                <div class="containerUno">
                                    <label for="fecha" class="labelDesign"><span class="icon-user"></span>Fecha inicio:</label>

                                </div>
                                <div class="containerDos">
                                    <input type="date" name="date" id="date" class="designInput" runat="server" />
                                </div>
                            </div>
                        </div>
                        <div class="input-group">
                            <div class="container">
                                <div class="containerUno">
                                    <label for="fechaEnd" class="labelDesign"><span class="icon-user"></span>Fecha fin:</label>

                                </div>
                                <div class="containerDos">
                                    <input type="date" name="dateEnd" id="dateEnd" class="designInput" runat="server" />
                                </div>
                            </div>
                        </div>
                        <div class="input-group">
                            <div class="container">
                                <div class="containerUno">
                                    <!-- <label for="sitio" class="labelDesign"><span class="icon-user"></span>Sitio:</label>-->
                                    <!--  <asp:DropDownList ID="DropDown1" runat="server" class="designInput">
                                    </asp:DropDownList> -->

                                    <!-- Button trigger modal -->
                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
                                        Seleccionar sitio
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

                                                                        <asp:Button ID="Remove" runat="server" Text="Eliminar" OnClick="Remove_Click" CssClass="designButtonSmall" />
                                                                        <asp:Button ID="Add" runat="server" Text="Agregar" OnClick="Add_Click" CssClass="designButtonSmall" />

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
                                                    <asp:Button runat="server" ID="Save" CssClass="btn btn-primary" OnClick="Save_Click" Text="Agregar" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <!--<asp:TextBox ID="WriteSite" runat="server"></asp:TextBox>
                           <asp:Button ID="Search" runat="server" Text="Button" OnClick="Search_Click" />
                            <asp:GridView ID="GridView1" runat="server"></asp:GridView>-->

                    </div>

                    <asp:Button ID="Register" runat="server" CssClass="designButtonV" Text="Registrar" OnClick="Register_Click" />

                </div>
            </div>
        </section>


    </section>

</asp:Content>



