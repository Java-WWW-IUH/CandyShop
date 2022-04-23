<%-- 
    Document   : dashboard
    Created on : May 17, 2021, 4:27:06 PM
    Author     : Tuan Khang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Trang chủ</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="../Css/Header.css">
        <link rel="stylesheet" href="../Css/body.css">
        <link rel="icon" href="../Image/LoadLogo.png">
        <script src="https://kit.fontawesome.com/041bd10679.js" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </head>
    <style>
        li {
            color: red;
        }
    </style>
    <body>
        <header>
            <div class="row">
                <div class="col-1"></div>
                <div class="col-4"><img src="../Image/K2NCamShop.png" style="width: 40%;" /></div>

                <div class="col-7" align="right" style="margin-top: 5vh;"></div>
            </div>
        </header>
        <nav class="navbar navbar-expand-lg navbar-dark">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample05"
                    aria-controls="navbarsExample05" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarsExample05">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="Dashboard.html">Trang chủ <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link " href="Product.html">
                            Các sản phẩm
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="About.html">Giới thiệu về chúng tôi</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Liên hệ</a>
                    </li>
                </ul>
                <ul class="navbar-nav" style="padding-right: 7vw;">
                    <li class="nav-item">
                        <a class="nav-link" href="#"><i class="fas fa-shopping-cart"></i></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Đăng nhập</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="#">Đăng kí</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../../Admin/index.html">Admin</a>
                    </li>
                </ul>
            </div>
        </nav>
        <div id="demo" class="carousel slide" data-ride="carousel">
            <ul class="carousel-indicators">
                <li data-target="#demo" data-slide-to="0" class="active"></li>
                <li data-target="#demo" data-slide-to="1"></li>
                <li data-target="#demo" data-slide-to="2"></li>
            </ul>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="../Image/poster1.jpg" alt="Poster 1" width="1100" height="500">
                </div>
                <div class="carousel-item">
                    <img src="../Image/poster2.jpg" alt="Poster 2" width="1100" height="500">
                </div>
                <div class="carousel-item">
                    <img src="../Image/poster3.jpg" alt="Poster 3" width="1100" height="500">
                </div>
            </div>
            <a class="carousel-control-prev" href="#demo" data-slide="prev">
                <span class="carousel-control-prev-icon"></span>
            </a>
            <a class="carousel-control-next" href="#demo" data-slide="next">
                <span class="carousel-control-next-icon"></span>
            </a>
        </div>
        <div style="padding:20px">
            <h3 align="center" style="font-weight: bold;">THƯƠNG HIỆU MÁY ẢNH</h3>
        </div>
        <div class="row">
            <div class="col-2"><a href=""><img src="../Image/Logo/canon.jpeg" style="width: 100%;"></a></div>
            <div class="col-2"><a href=""><img src="../Image/Logo/kodak.png" style="width: 100%;"></a></div>
            <div class="col-2"><a href=""><img src="../Image/Logo/Nikon.jpg" style="width: 100%;"></a></div>
            <div class="col-2"><a href=""><img src="../Image/Logo/sony.jpg" style="width: 100%;"></a></div>
            <div class="col-2"><a href=""><img src="../Image/Logo/panasonic.jpg" style="width: 100%;"></a></div>
            <div class="col-2"><a href=""><img src="../Image/Logo/olympus.jpg" style="width: 100%;"></a></div>
        </div>

        <div style="padding:10px">
            <h3 align="center" style="font-weight: bold;">SẢN PHẨM NỔI BẬT</h3>
        </div>
        <div class="container" align="center">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-3">
                        <div class="card" style="width:100%">
                            <img class="card-img-top" src="../Image/Product/canon1.jpg" alt="Card image" style="width:100%">
                            <div class="card-body">
                                <h4 class="card-title">CANON EOS M50</h4>
                                <p class="card-text">Some example text some example text. John Doe is an architect and
                                    engineer</p>
                                <a href="ProductInformation.html">Xem chi tiết</a> <br>
                                <a href=" #" class="btn btn-danger">MUA NGAY</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="card" style="width:100%">
                            <img class="card-img-top" src="../Image/Product/canon1.jpg" alt="Card image" style="width:100%">
                            <div class="card-body">
                                <h4 class="card-title">CANON EOS M50</h4>
                                <p class="card-text">Some example text some example text. John Doe is an architect and
                                    engineer</p>
                                <a href="#">Xem chi tiết</a> <br>
                                <a href=" #" class="btn btn-danger">MUA NGAY</a>

                            </div>
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="card" style="width:100%">
                            <img class="card-img-top" src="../Image/Product/canon1.jpg" alt="Card image" style="width:100%">
                            <div class="card-body">
                                <h4 class="card-title">CANON EOS M50</h4>
                                <p class="card-text">Some example text some example text. John Doe is an architect and
                                    engineer</p>
                                <a href="#">Xem chi tiết</a> <br>
                                <a href=" #" class="btn btn-danger">MUA NGAY</a>

                            </div>
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="card" style="width:100%">
                            <img class="card-img-top" src="../Image/Product/canon1.jpg" alt="Card image" style="width:100%">
                            <div class="card-body">
                                <h4 class="card-title">CANON EOS M50</h4>
                                <p class="card-text">Some example text some example text. John Doe is an architect and
                                    engineer</p>
                                <a href="#">Xem chi tiết</a> <br>
                                <a href=" #" class="btn btn-danger">MUA NGAY</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div style="padding:10px">
            <h3 align="center" style="font-weight: bold;">SẢN PHẨM MỚI NHẤT</h3>
        </div>
        <div class="container" align="center" style="padding-bottom: 20px;">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-3">
                        <div class="card" style="width:100%">
                            <img class="card-img-top" src="../Image/Product/canon1.jpg" alt="Card image" style="width:100%">
                            <div class="card-body">
                                <h4 class="card-title">CANON EOS M50</h4>
                                <p class="card-text">Some example text some example text. John Doe is an architect and
                                    engineer</p>
                                <a href="#">Xem chi tiết</a> <br>
                                <a href=" #" class="btn btn-danger">MUA NGAY</a>

                            </div>
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="card" style="width:100%">
                            <img class="card-img-top" src="../Image/Product/canon1.jpg" alt="Card image" style="width:100%">
                            <div class="card-body">
                                <h4 class="card-title">CANON EOS M50</h4>
                                <p class="card-text">Some example text some example text. John Doe is an architect and
                                    engineer</p>
                                <a href="#">Xem chi tiết</a> <br>
                                <a href=" #" class="btn btn-danger">MUA NGAY</a>

                            </div>
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="card" style="width:100%">
                            <img class="card-img-top" src="../Image/Product/canon1.jpg" alt="Card image" style="width:100%">
                            <div class="card-body">
                                <h4 class="card-title">CANON EOS M50</h4>
                                <p class="card-text">Some example text some example text. John Doe is an architect and
                                    engineer</p>
                                <a href="#">Xem chi tiết</a> <br>
                                <a href=" #" class="btn btn-danger">MUA NGAY</a>

                            </div>
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="card" style="width:100%">
                            <img class="card-img-top" src="../Image/Product/canon1.jpg" alt="Card image" style="width:100%">
                            <div class="card-body">
                                <h4 class="card-title">CANON EOS M50</h4>
                                <p class="card-text">Some example text some example text. John Doe is an architect and
                                    engineer</p>
                                <a href="#">Xem chi tiết</a> <br>
                                <a href=" #" class="btn btn-danger">MUA NGAY</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <footer style="background-color: black; color: white; height: 200px; padding-left: 50px;">
            <div class="row">
                <div class="col-9">
                    <h4 style="padding-top: 20px;padding-bottom: 20px;">CỬA HÀNG MÁY ẢNH K2NCamShop</h4>
                    <p class="pFooter">Địa chỉ: số 8 Nguyễn Văn Bảo, Phường 4, Quận Gò Vấp, TP Hồ Chí Minh</p>
                    <p class="pFooter">Điện thoại: 0976553787 - Email: K2NCamShop@gmail.vn </p>
                    <p class="pFooter">&copy Copyright 2021</p>
                </div>
                <div class="col-3" style="padding-top: 20px;">
                    <a href=""><img src="../Image/Logo/fb.png" style="width: 10%;"></a>
                    <a href=""><img src="../Image/Logo/yt.png" style="width: 10%;"></a>
                    <a href=""><img src="../Image/Logo/ins.png" style="width: 10%;"></a>
                </div>
            </div>
        </footer>
    </body>
</html>
