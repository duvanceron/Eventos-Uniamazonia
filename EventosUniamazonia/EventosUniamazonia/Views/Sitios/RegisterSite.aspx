<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/Layout.Master" AutoEventWireup="true" CodeBehind="RegisterSite.aspx.cs" Inherits="EventosUniamazonia.Views.Sitios.RegisterSite" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Registrar sitio</title>
    <link rel="stylesheet" href="../../Means/css/styleRegistrarSitio.css" />
    <link rel="stylesheet" href="../../Means/fonts/style.css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="main col-lg-auto  container-form" style="padding: 5% 20%; background: #f2f2f2">
        <div class="container-form  ">
            <h2 style="color: #C7DBD0; text-align: center; padding-bottom: 4px;">Registrar Sitio.</h2>

            <div class="container" id="primerRegistro">
                <div>
                    <div class="input-group">
                        <asp:TextBox type="text" ID="name" name="name" class="designInput" runat="server"></asp:TextBox>
                        <label for="name" class="labelDesign"><span class="icon-user"></span>Nombre:</label>
                    </div>
                   <!-- <div class="input-group">
                        <asp:Button ID="BtnSearch" runat="server" Text="Search" type="submit" />
                    </div>
                </div>-->
                <div class="input-group">
                    <asp:TextBox type="text" ID="capacity" name="capacity" class="designInput" runat="server"></asp:TextBox>
                    <label for="capacity" class="labelDesign"><span class="icon-user"></span>Capacidad:</label>
                </div>
                <div class="input-group">
                    <asp:TextBox type="text" ID="direccion" name="direccion" class="designInput" runat="server"></asp:TextBox>
                    <label for="direccion" class="labelDesign"><span class="icon-user"></span>Direccion:</label>

                </div>
            </div>
            <asp:Button ID="btnRegisterSite" runat="server" Text="Registrar" type="submit" OnClick="Register_Click" />

        </div>
    </section>

    <script src="../../Means/Js/validate.js"></script>
</asp:Content>
