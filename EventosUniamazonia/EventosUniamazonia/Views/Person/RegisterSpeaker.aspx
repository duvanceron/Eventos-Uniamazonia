<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/Layout.Master" AutoEventWireup="true" CodeBehind="RegisterSpeaker.aspx.cs" Inherits="EventosUniamazonia.Views.Person.RegisterSpeaker" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Registrar ponente</title>
    <link rel="stylesheet" href="../../Means/css/styleRegisterPonente.css" />
    <link rel="stylesheet" href="../../Means/fonts/style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="main col-lg-auto  container-form" style="padding: 5% 20%; background: #f2f2f2">
        <div class="container-form  ">
            <h2 style="color: #248461; text-align: center; padding-bottom: 14px;">Registrar ponente.</h2>

            <div class="container" style="padding-top: 14px;">
                <div class="col-sm-12">
                    <div class="input-group col-sm-11">
                        <asp:TextBox type="text" ID="ccSpeaker" name="cc" class="designInput " runat="server"></asp:TextBox>
                        <label runat="server"  for="cc" id="labelCc" class="labelDesign labelActive" ><span class="icon-user"></span>Identificación:</label>

                    </div>

                    <div class="input-group col-sm-1">
                        
                        <button  class="btn btn-primary  pull-left rounded" onserverclick="SearchPerson" type="submit" runat="server"><i class="fa fa-search">Buscar</i>&nbsp;</button>
                    </div>
                </div>

                <div class="input-group  col-sm-11">
                    <asp:TextBox type="text" ID="name" name="name" class="designInput" runat="server"></asp:TextBox>
                    <label  runat="server" id="labelName" for="name" class="labelDesign labelActive"><span class="icon-user"></span>Nombre:</label>
                </div>

                <div class="input-group  col-sm-11">
                    <asp:TextBox type="text" ID="theme" name="theme" class="designInput" runat="server"></asp:TextBox>
                    <label for="theme" class="labelDesign labelActive"><span class="icon-user"></span>Tema:</label>
                </div>
            </div>
            <asp:Button ID="btnRegisterSpeaaker" class="designButton" runat="server" Text="Registrar" type="submit" OnClick="btnRegisterSpeaaker_Click" />

        </div>
    </section>
</asp:Content>
