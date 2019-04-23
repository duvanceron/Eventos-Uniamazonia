<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="indexMain.aspx.cs" Inherits="EventosUniamazonia.Views.Index.indexMain" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>!Eventos</title>

    <!-- Bootstrap -->
    <link href="../../Means/startMain/css/bootstrap.css" rel="stylesheet" />
    <link rel="shortcut icon" href="../../Means/startMain/images/e.ico" />

    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700' rel='stylesheet' type='text/css' />
    <script src="http://use.edgefonts.net/unifrakturmaguntia:n4:default;source-sans-pro:n4:default.js" type="text/javascript"></script>

</head>
<body>
    <form runat="server">

        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">!Eventos</a>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="defaultNavbar1">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="../Person/Login.aspx">Ingresar</a></li>
                        <li><a href="#desarrolladores">Desarroladores</a></li>
                        <li><a href="#contact">Contacto</a></li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container-fluid -->
        </nav>
        <div class="container-fluid image-carousel">
            <div class="row">
                <div class="col-md-offset-2 col-md-8">
                    <div id="carousel1" class="carousel slide" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <li data-target="#carousel1" data-slide-to="0" class="active"></li>
                            <li data-target="#carousel1" data-slide-to="1"></li>
                            <li data-target="#carousel1" data-slide-to="2"></li>
                        </ol>
                        <div class="carousel-inner" role="listbox">
                            <div class="item active">
                                <img runat="server" id="firstImg" alt="First slide image" class="center-block">
                                <div class="carousel-caption">
                                    <h3 runat="server" id="firstText">Nombre del evento</h3>
                                </div>
                            </div>
                            <div class="item">
                                <img runat="server" id="secondImg" alt="Second slide image" class="center-block">
                                <div class="carousel-caption">
                                    <h3 runat="server" id="secondText">Nombre del evento</h3>
                                </div>
                            </div>
                            <div class="item">
                                <img runat="server" id="thirdImg" alt="Third slide image" class="center-block">
                                <div class="carousel-caption">
                                    <h3 runat="server" id="thirdText">Nombre del evento</h3>
                                </div>
                            </div>
                        </div>
                        <a class="left carousel-control" href="#carousel1" role="button" data-slide="prev"><span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span><span class="sr-only">Previous</span></a><a class="right carousel-control" href="#carousel1" role="button" data-slide="next"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><span class="sr-only">Next</span></a>
                    </div>
                </div>
            </div>
            <hr>
        </div>
        <div class="container">
            <div class="row">
                <div class="text-center col-md-6 col-md-offset-3">
                    <div class="title-center">
                        Eventos
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div>
                <div class="text-justify col-sm-6">
                    <div class="title-event">
                        <a runat="server" target="_parent" title="" id="firstSmall" href="">titulo evento</a>
                    </div>
                    <div class="img-events">
                        <img id="imgSmallOne" runat="server"  alt="Third slide image" class="centre-events">
                    </div>
                </div>
                <div class="text-justify col-sm-6">
                    <div class="title-event">
                        <a target="_parent" title="" href="" runat="server" id="secondSmall">titulo evento</a>
                    </div>
                    <div class="img-events">
                        <img id="imgSmallTwo" runat="server" alt="Third slide image" class="centre-events">
                    </div>
                </div>
            </div>
            <div>
                <div class="text-justify col-sm-6">
                    <div class="title-event">
                        <a runat="server" target="_parent" title="" href="" id="thirdSmall">titulo evento</a>
                    </div>
                    <div class="img-events">
                        <img id="imgSmallthird" runat="server" alt="Third slide image" class="centre-events">
                    </div>
                </div>
                <div class="text-justify col-sm-6">
                    <div class="title-event">
                        <a runat="server" target="_parent" title="" href="" id="fourtSmall">titulo evento</a>
                    </div>
                    <div class="img-events">
                        <img id="imgSmallFourth" runat="server" alt="Third slide image" class="centre-events">
                    </div>
                </div>
            </div>
        </div>
        <hr />
        <div>
            <asp:Calendar ID="CalendarEvents" OnDayRender="Calendar_DayRender" runat="server"  Font-Size="9pt" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Full" Font-Names="Verdana" ForeColor="#08734E" Height="515px" Width="100%" FirstDayOfWeek="Sunday" NextPrevFormat="ShortMonth">
                <DayHeaderStyle BackColor="#25A478" ForeColor="#FFFFFF" Font-Size="15pt" Height="50px"></DayHeaderStyle>

                <NextPrevStyle Font-Size="12pt"  ForeColor="#FFFFFF" ></NextPrevStyle>

                <OtherMonthDayStyle ForeColor="#999999"></OtherMonthDayStyle>

                <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99"></SelectedDayStyle>

                <SelectorStyle BackColor="#99CCCC" ForeColor="#336666"></SelectorStyle>

                <TitleStyle BackColor="#08734E" BorderColor="#08734E" BorderWidth="1px" Font-Bold="True" Font-Size="16pt" ForeColor="#FFFFFF" Height="70px"></TitleStyle>

                <TodayDayStyle BackColor="#82CFB4" ForeColor="White"></TodayDayStyle>

                <WeekendDayStyle BackColor="#D7E1DD"></WeekendDayStyle>
            </asp:Calendar>

        </div>
        <hr />
        <div id="desarrolladores" class="row">
            <div class="text-center">
                <div class="title-center">
                    Desarrolladores
                </div>
                <div class="col-md-4">
                    <div class="parallax">
                        <img src="../../Means/startMain/images\ceron.jpg" alt="default" class="img-circle" />
                    </div>
                    <li class="lead"><a href="https://www.facebook.com/duvan.ceron.9" target="_blank">Duvan Cerón Muñoz</a></li>
                </div>
                <div class="col-md-4">
                    <div class="parallax">
                        <img src="../../Means/startMain/images\dr.jpg" alt="default" class="img-circle" />
                    </div>
                    <li class="lead"><a href="https://www.facebook.com/DanielAndresRD" target="_blank">Daniel Andres Restrepo Diaz</a></li>
                </div>
                <div class="col-md-4">
                    <div class="parallax">
                        <img src="../../Means/startMain/images\pp.jpg" alt="default" class="img-circle" />
                    </div>
                    <li class="lead"><a href="https://www.facebook.com/YESIK15" target="_blank">Yetsika Yulieth Rueda Lizcano</a></li>
                </div>
            </div>
        </div>
        <hr />
        <section id="contact" class="row">
            <div id="google-map" class="wow fadeIn" data-latitude="52.365629" data-longitude="4.871331" data-wow-duration="1000ms" data-wow-delay="400ms"></div>
            <div id="contact-us" class="parallax">
                <div class="container">
                    <div class="row">
                        <div class="heading text-center col-sm-8 col-sm-offset-2 wow fadeInUp" data-wow-duration="1000ms" data-wow-delay="300ms">
                            <div class="title-center">
                                Contacto
                            </div>
                        </div>
                    </div>
                    <div class="contact-form wow fadeIn" data-wow-duration="1000ms" data-wow-delay="600ms">
                        <div class="row">
                            <div class="col-sm-6">
                                <div id="Div1" name="contact-form" method="post" action="#" runat="server">
                                    <div class="row  wow fadeInUp" data-wow-duration="1000ms" data-wow-delay="300ms">
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <input type="text" name="name" class="form-control" placeholder="Nombre" required="required" />
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <input type="email" name="email" class="form-control" placeholder="Correo" required="required" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <input type="text" name="subject" class="form-control" placeholder="Motivo" required="required" />
                                    </div>
                                    <div class="form-group">
                                        <textarea name="message" id="message" class="form-control" rows="4" placeholder="Escriba su mensaje" required></textarea>
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" class="btn-submit">Enviar</button>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="contact-info wow fadeInUp" data-wow-duration="1000ms" data-wow-delay="300ms">
                                    <ul class="address">
                                        <li><i class="fa fa-map-marker"></i><span>Dirección:</span>  Calle 17 Diagonal 17 con Carrera 3F Barrio Porvenir </li>
                                        <li><i class="fa fa-phone"></i><span>Telefono:</span> (+57) 8-4366160  </li>
                                        <li><i class="fa fa-envelope"></i><span>Email:</span><a href="mailto:soporte@!Eventos.com"> soporte@!Eventos.com</a></li>
                                        <li><i class="fa fa-globe"></i><span>SitioWeb:</span> <a href="#">www.!Eventos.com</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <hr />
        <footer class="sitio-footer">
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <div class="text-18">
                            Dirección de Contacto
                        </div>
                        <address>
                            <div>
                                <a href="http://www.udla.edu.co/v10/">Universidad de la Amazonia</a>
                                <br />
                            </div>
                            Florencia<br />
                            Caquetá
                        </address>
                    </div>


                    <div class="col-md-4">
                        I.C.&copy; 2018 | Design by: <a href="http://www.uniamazonia.edu.co/v10/">Uniamazonia</a>
                    </div>
                    <div class="col-md-4">
                    </div>

                </div>
            </div>
        </footer>
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="../../Means/startMain/js/jquery-1.11.2.min.js"></script>

        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="../../Means/startMain/js/bootstrap.js"></script>



    </form>
</body>
</html>
