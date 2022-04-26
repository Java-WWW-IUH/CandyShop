<%-- 
    Document   : dashboard
    Created on : March 19, 2022
    Author     : Tuan Khang
--%>
<%@include file="header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Trang chủ</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="<c:url value="/resources/Css/Header.css"/>" rel='stylesheet' type='text/css'/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
        <link href="<c:url value="/resources/Css/Header.css"/>" rel='stylesheet' type='text/css'/>
        <link href="<c:url value="/resources/Css/body.css"/>" rel='stylesheet' type='text/css'/>
        <link rel="icon" href="<c:url value="/resources/Image/LoadLogo.png"/>">
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

        <div id="demo" class="carousel slide" data-ride="carousel">
            <ul class="carousel-indicators">
                <li data-target="#demo" data-slide-to="0" class="active"></li>
                <li data-target="#demo" data-slide-to="1"></li>
                <li data-target="#demo" data-slide-to="2"></li>
            </ul>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="<c:url value="/resources/Image/poster1.jpg"/>" alt="Poster 1" width="1100" height="500">
                </div>
                <div class="carousel-item">
                    <img src="<c:url value="/resources/Image/poster2.jpg"/>" alt="Poster 1" width="1100" height="500">
                </div>
                <div class="carousel-item">
                    <img src="<c:url value="/resources/Image/poster3.jpg"/>" alt="Poster 1" width="1100" height="500">
                </div>
            </div>
            <a class="carousel-control-prev" href="#demo" data-slide="prev">
                <span class="carousel-control-prev-icon"></span>
            </a>
            <a class="carousel-control-next" href="#demo" data-slide="next">
                <span class="carousel-control-next-icon"></span>
            </a>
        </div>
        <div class="container" align="center">
	        <div style="padding:20px;  margin-top: 30px;">
	            <h3 align="center" style="font-weight: bold;">THƯƠNG HIỆU BÁNH KẸO</h3>
	        </div>
	        <div class="row" align="center" style="display: flex; justify-content: center;">
	            <c:forEach items="${listbrand}" var="lb">
	                <div class="col-2"><a href=""><img src="${pageContext.request.contextPath}/imgbrand/${lb.img}" accept=".png, .jpg, .jpeg" style="width: 100%; height: 170px;"></a></div>     
	            </c:forEach>
	        </div>
        </div>

        <div style="padding:10px; margin-top: 60px;">
            <h3 align="center" style="font-weight: bold;">SẢN PHẨM NỔI BẬT</h3>
        </div>
        <div class="container" align="center">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-3">
                        <div class="card" style="width:100%">
                            <img class="card-img-top" src="<c:url value="/resources/Image/Product/banh1.png"/>"  alt="Card image" style="width: 100%;height: 170px">
                            <div class="card-body">
                                <h4 class="card-title">BÁNH - KẸO 1</h4>
                                <p class="card-text">Some example text some example text. John Doe is an architect and
                                    engineer</p>
                                <a href="ProductInformation.html">Xem chi tiết</a> <br>
                                <a href=" #" class="btn btn-danger">MUA NGAY</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="card" style="width:100%">
                            <img class="card-img-top" src="<c:url value="/resources/Image/Product/banh2.jpg"/>" alt="Card image" style="width:100%; height: 170px">
                            <div class="card-body">
                                <h4 class="card-title">BÁNH - KẸO 2</h4>
                                <p class="card-text">Some example text some example text. John Doe is an architect and
                                    engineer</p>
                                <a href="#">Xem chi tiết</a> <br>
                                <a href=" #" class="btn btn-danger">MUA NGAY</a>

                            </div>
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="card" style="width:100%">
                            <img class="card-img-top" src="<c:url value="/resources/Image/Product/banh3.jpg"/>" alt="Card image" style="width:100%; height: 170px">
                            <div class="card-body">
                                <h4 class="card-title">BÁNH - KẸO 3</h4>
                                <p class="card-text">Some example text some example text. John Doe is an architect and
                                    engineer</p>
                                <a href="#">Xem chi tiết</a> <br>
                                <a href=" #" class="btn btn-danger">MUA NGAY</a>

                            </div>
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="card" style="width:100%">
                            <img class="card-img-top" src="<c:url value="/resources/Image/Product/banh4.jpg"/>" alt="Card image" style="width: 100%; height: 170px">
                            <div class="card-body">
                                <h4 class="card-title">BÁNH - KẸO 4</h4>
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
        <div style="padding:10px; margin-top: 60px;">
            <h3 align="center" style="font-weight: bold;">SẢN PHẨM MỚI NHẤT</h3>
        </div>
        <div class="container" align="center" style="padding-bottom: 20px;">
            <div class="container-fluid">
                <div class="row">
                    <c:forEach items="${newproduct}" var="p">
                        <div class="col-3" style="padding-top: 10px">
                            <div class="card"> <img src="${pageContext.request.contextPath}/image/${p.img}" class="card-img-top" width="100%" height="160vh">
                                <div class="card-body pt-0 px-0">
                                    <div class="d-flex flex-row justify-content-between mb-0 px-3"> <small class="text-muted mt-1">Giá Bán</small>
                                        <h6><fmt:formatNumber type = "number" 
                                                          maxFractionDigits = "3" value = "${p.price}"/> VND</h6>
                                    </div>
                                    <hr class="mt-2 mx-3">
                                    <div class="d-flex flex-row justify-content-between px-3 pb-4">
                                        <div class="d-flex flex-column"><span class="text-muted">Xuất xứ</span><small class="text-muted"></small></div>
                                        <div class="d-flex flex-column">
                                            <h6 class="mb-0">${p.productBrandID.nationalProduction}</h6><small class="text-muted text-right">(Quốc gia)</small>
                                        </div>
                                    </div>
                                    <small class="text-muted key pl-3">&#10025; Sản phẩm chính hãng </small>
                                    <div class="mx-3 mt-3 mb-2"><a href="${pageContext.request.contextPath}/cart/add/${p.productID}.html" class="btn btn-warning btn-block"><small><b><i class="fas fa-shopping-cart"></i> THÊM VÀO GIỎ HÀNG</small></b></a></div> 
                                    <small class="d-flex justify-content-center text-muted"><a href="<c:url value="/product/detail?id=${p.productID}"/>" style="color: black;font-weight: bold">Xem chi tiết sản phẩm</a></small>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <footer style="background-color: black; color: white; height: 200px; padding-left: 50px;">
            <div class="row">
                <div class="col-9">
                    <h4 style="padding-top: 20px;padding-bottom: 20px;">CỬA HÀNG BÁNH KẸO CANDY SHOP</h4>
                    <p class="pFooter">Địa chỉ: số 12 Nguyễn Văn Bảo, Phường 4, Quận Gò Vấp, TP Hồ Chí Minh</p>
                    <p class="pFooter">Điện thoại: 0819490540 - Email: CandyShop@gmail.vn </p>
                    <p class="pFooter">&copy Copyright 2022</p>
                </div>
                <div class="col-3" style="padding-top: 20px;">
                    <a href=""><img src="<c:url value="/resources/Image/Logo/fb.png"/>" style="width: 10%;"></a>
                    <a href=""><img src="<c:url value="/resources/Image/Logo/yt.png"/>" style="width: 10%;"></a>
                    <a href=""><img src="<c:url value="/resources/Image/Logo/ins.png"/>" style="width: 10%;"></a>
                </div>
            </div>
        </footer>
    </body>
</html>
