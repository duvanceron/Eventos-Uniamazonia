<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterPerson.aspx.cs" Inherits="EventosUniamazonia.Views.Person.RegisterPerson" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Registrar usuario</title>
    <link rel="stylesheet" href="../../Means/css/styleRegistrarUser.css" />
    <link rel="stylesheet" href="../../Means/fonts/style.css" />

</head>
<body>
  <%--  <section class="wrapper">--%>
      <%--  <section class="main">--%>
            <div class="container-form">
                <form class="form" id="formRegisterID" runat="server" name="formularioRegistro" method="post">
                    <h2  style="color: #248461; text-align: center; padding-top: 10px;">REGISTRO</h2>
                    <div class="row">
                        <div class="col-sm-5" id="primerRegistro">

                            <div class="input-group">
                                <asp:TextBox type="text" ID="cc" name="cc" class="designInput" runat="server"></asp:TextBox>
                                <asp:Label ID="labelCC" For="cc" runat="server" class="labelDesign"><span class="icon-mobile"></span> Cedula</asp:Label>
                            </div>

                            <div class="input-group">
                                <asp:TextBox type="text" ID="name" name="name" class="designInput" runat="server"></asp:TextBox>
                                <asp:Label ID="labelName" For="name" runat="server" class="labelDesign"><span class="icon-user"></span>Primer Nombre</asp:Label>
                            </div>

                            <div class="input-group">
                                <asp:TextBox type="text" ID="name2" name="name2" class="designInput" runat="server"></asp:TextBox>
                                <asp:Label ID="labelName2" For="name2" runat="server" class="labelDesign"><span class="icon-user"></span> Segundo nombre</asp:Label>
                            </div>
                            <div class="input-group">
                                <asp:TextBox type="text" ID="user" class="designInput" runat="server"></asp:TextBox>
                                <asp:Label ID="labelUser" For="user" runat="server" class="labelDesign"><span class="icon-user"></span> Usuario</asp:Label>
                            </div>
                            <div class="input-group">
                                <asp:TextBox type="email" ID="emailPerson" class="designInput" runat="server"></asp:TextBox>
                                <label for="emailPerson" class="labelDesign"><span class="icon-mail"></span>  E-mail:</label>
                            </div>

                        </div>
                        <div class="col-sm-5" id="segundoRegistro">
                            <div class="input-group">
                                <asp:TextBox type="text" ID="lastName" name="lastName" class="designInput" runat="server"></asp:TextBox>
                                <asp:Label ID="labelLast" For="lastName" runat="server" class="labelDesign"><span class="icon-user"></span>Primer Apellido</asp:Label>

                            </div>

                            <div class="input-group">
                                <asp:TextBox type="text" ID="lastName2" name="lastName2" class="designInput" runat="server"></asp:TextBox>
                                <asp:Label ID="labelLast2" For="lastName2" runat="server" class="labelDesign"><span class="icon-user"></span>Segundo Apellido</asp:Label>

                            </div>

                            <div class="input-group">
                                <asp:TextBox type="password" ID="password" class="designInput" runat="server"></asp:TextBox>
                                <asp:Label ID="labelPass" For="password" runat="server" class="labelDesign"><span class="icon-hour-glass"></span> Contraseña</asp:Label>
                            </div>
                            <div class="input-group">
                                <asp:TextBox type="password" ID="verifyPassword" class="designInput" runat="server"></asp:TextBox>
                                <label for="verificarContrasena" class="labelDesign"><span class="icon-hour-glass"></span>Repetir Contraseña:</label>
                            </div>

                        </div>
                    </div>




                    <asp:Button ID="BtnRegister" runat="server" Text="Registrar" type="submit" OnClick="Register_Click" />

                </form>
            </div>
        <!--</section>-->
<%--    </section>--%>
    <script src="../../Means/Js/validate.js"></script>

</body>
</html>


