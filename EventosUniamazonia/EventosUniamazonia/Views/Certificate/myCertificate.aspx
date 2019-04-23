<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/Layout.Master" AutoEventWireup="true" CodeBehind="myCertificate.aspx.cs" Inherits="EventosUniamazonia.Views.Certificate.myCertificate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Mis certificados</title>
    <meta name="description" content="Certificados" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="../../Means/css/styleGlobal.css" />
    <link rel="stylesheet" href="../../Means/fonts/style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content mt-3">
        <div class="animated fadeIn">
            <div class="row">

                <div class="col-md-12">
                    <div class="card">
                        <asp:ScriptManager ID="script" runat="server" EnablePartialRendering="true"></asp:ScriptManager>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <fieldset>
                                    <div class="card-header">

                                        <div class="row">
                                            <div class="col-md-8">
                                                <strong class="card-title">Reporte.</strong>

                                            </div>
                                            <div class="col-md-2">
                                                <asp:Button ID="visualize" runat="server" Text="Visualizar" CssClass="btn btn-primary" OnClick="Visualize_Click" />
                                            </div>
                                            <div class="col-md-2">

                                                <asp:Button ID="GenerateReport" runat="server" Text="Generar reporte" CssClass="btn btn-primary" OnClick="GenerateReport_Click" />
                                            </div>
                                        </div>

                                    </div>

                                    <div class="card-body">

                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-check">
                                                    <input runat="server" class="form-check-input" type="radio" name="checkReports" id="checkCertificate" value="checkCertificate" />
                                                    <label class="form-check-label" for="checkCertificate">
                                                        Certificados.
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <asp:Panel ID="PanelDropDownEvents" runat="server">
                                                    <asp:DropDownList ID="DropDownEvents" runat="server" class="designInput">
                                                    </asp:DropDownList>
                                                </asp:Panel>
                                                <asp:Panel ID="panelLabelInfo" runat="server">

                                                    <asp:Label ID="LabelInfo" runat="server" Text="Presione el boton generar reporte."></asp:Label>
                                                </asp:Panel>


                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-5">
                                            </div>
                                            <div class="col-md-3">
                                                <img class="d-block w-100" runat="server" src="~/Means/images/graduado.gif" id="Img" width="143" height="195" />

                                            </div>
                                            <div class="col-md-4">
                                            </div>

                                        </div>


                                    </div>
                                </fieldset>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>


            </div>
        </div>

    </div>
</asp:Content>
