<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="EventosUniamazonia.Views.Person.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Login </title>
    <link href="https://fonts.googleapis.com/css?family=Bellefair|Vast+Shadow" rel="stylesheet" />
    <style>
        * {
            margin: 0px;
            padding: 0px;
        }

        body {
            background: url("../../Means/images/cristal.jpg");
            background-repeat: no-repeat;
            background-size: cover;
        }

        form {
            background: #EDF1F2;
            opacity: 0.8;
            filter: alpha(opacity=50);
            width: 380px;
            border: 1px solid #fff;
            border-radius: 5px;
            box-shadow: inset 0 0 10px #000;
            margin: 100px auto;
            padding: 1.25rem;
        }

            form h1 {
                text-align: center;
                font-weight: 300;
                font-size: 40pt;
                font-family: 'Vast Shadow', cursive;
                /*font-family: 'Bellefair', serif;*/
                margin: 30px 0px;
            }

        .inputForm {
            width: 280px;
            height: 35px;
            padding: 0px 10px;
            text-align: center;
            color: #6d6d6d;
            border: none;
            border-bottom: solid 0.2rem #dddddd;
            margin: 10px 30px;
            /*background: #EDF1F2;*/
            /* border-radius: 8px;*/
        }

            .inputForm:focus {
                outline: none;
            }

        .buttonForm {
            width: 135px;
            margin: 20px 0px 30px 30px;
            height: 40px;
            border: 1px solid #3d80a7;
            box-shadow: 0px 2px 0px #3d80a7;
            border-radius: 8px;
            color: #EDF1F2;
            /* Permalink - use to edit and share this gradient: http://colorzilla.com/gradient-editor/#2071a3+1,2989d8+50,207cca+51,2086bf+100 */
            background: rgb(32, 113, 163);
            /* Old browsers */
            background: -moz-linear-gradient(top, rgba(32, 113, 163, 1) 1%, rgba(41, 137, 216, 1) 50%, rgba(32, 124, 202, 1) 51%, rgba(32, 134, 191, 1) 100%);
            /* FF3.6-15 */
            background: -webkit-linear-gradient(top, rgba(32, 113, 163, 1) 1%, rgba(41, 137, 216, 1) 50%, rgba(32, 124, 202, 1) 51%, rgba(32, 134, 191, 1) 100%);
            /* Chrome10-25,Safari5.1-6 */
            background: linear-gradient(to bottom, rgba(32, 113, 163, 1) 1%, rgba(41, 137, 216, 1) 50%, rgba(32, 124, 202, 1) 51%, rgba(32, 134, 191, 1) 100%);
            /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
            filter: progid: DXImageTransform.Microsoft.gradient( startColorstr='#2071a3', endColorstr='#2086bf', GradientType=0);
            /* IE6-9 */
        }

            .buttonForm:hover {
                background: #3c718e;
            }

        .labelForm {
            color: #2086bf;
            margin: 10px 10px 10px 10px;
            height: 10px;
            padding: 1.25rem;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
         <h1>Eventos.</h1>
        <br />
        <asp:TextBox ID="TextUser" runat="server" placeholder="&#128100; Ingrese su usuario" class="inputForm"></asp:TextBox><br />
        <asp:TextBox ID="TextPassword" runat="server" placeholder="&#x1F512;  Ingrese su contraseña" class="inputForm" TextMode="Password"></asp:TextBox><br />
        <asp:Button ID="btnRegistrar" runat="server" Text="Registrarse" class="buttonForm" OnClick="btnRegistrar_Click" />
        <asp:Button ID="btnLogin" runat="server" Text="Iniciar sesion" class="buttonForm" OnClick="btnLogin_Click" /><br />
        <asp:Label ID="labelForget" runat="server" Text="¿Olvido su contraseña?" class="labelForm"></asp:Label><br />
        <asp:Label ID="labelHelp" runat="server" Text="¿Necesitas ayuda?" class="labelForm"></asp:Label>
    
    </form>
</body>
</html>
