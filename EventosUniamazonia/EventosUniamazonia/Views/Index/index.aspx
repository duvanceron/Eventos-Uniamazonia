<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="EventosUniamazonia.Views.Index.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Inicio</title>
   
    <link href="../../Means/init/css/bootstrap.min.css" rel="stylesheet">
    <link href="../../Means/init/css/stylish-portfolio.css" rel="stylesheet">
    <link href="../../Means/init/css/fileinput.min.css" rel="stylesheet">
    <link href="../../Means/init/css/font-awesome.min.css" rel="stylesheet">
    
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="#">Navbar</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Home
                        <span class="sr-only">(current)</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Link</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true"
                            aria-expanded="false">Dropdown
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Action</a>
                            <a class="dropdown-item" href="#">Another action</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Something else here</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link disabled" href="#">Disabled</a>
                    </li>
                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                </form>
            </div>
        </nav>

        <br>

        <div class="container">
            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img class="d-block w-100" runat="server" id= "firstImg"  alt="First slide">
                        <div class="carousel-caption d-none d-md-block">
                            <!-- <h5>.assasa.</h5>
                    <p class="text-dark"> .sasasasa.</p> -->
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100"  runat="server" id="secondImg"  alt="Second slide"/>
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" runat="server" id="thirdImg" alt="Third slide">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>

        <!-- Footer -->
        <footer>
            <footer class="sitio-footer">
                <div class="container">
                    <div class="row">
                        <div class="col-md-4">
                            <h4>Dirección de Contacto</h4>
                            <address>
                                <div class="url-universidad">
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
                            <div class="sociales">
                                <a class="fa fa-facebook-square fa-2x" href="#"></a>
                                <a class="fa fa-twitter-square fa-2x" href="#"></a>
                                <a class="fa fa-google-plus-square fa-2x" href="#"></a>
                            </div>
                        </div>

                    </div>
                </div>
            </footer>
        </footer>
        <!--Fin footer-->

        <script src="../../Means/init/js/jquery.min.js"> </script>
        <!-- Plugin JavaScript -->
        <script src="../../Means/init/js/bootstrap.min.js"></script>
    </form>
</body>
</html>
