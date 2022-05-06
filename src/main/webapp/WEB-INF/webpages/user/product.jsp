<%-- 
    Document   : product
    Created on : March 22, 2022
    Author     : Tuan Khang
--%>
<%@page import="sv.iuh.project.model.Product"%>
<%@page import="java.text.DecimalFormat"%>
<%@include file="header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sản phẩm</title>
        <link href="<c:url value="/resources/Css/Header.css"/>" rel='stylesheet' type='text/css'/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
        <link href="<c:url value="/resources/Css/Header.css"/>" rel='stylesheet' type='text/css'/>
        <link href="<c:url value="/resources/Css/body.css"/>" rel='stylesheet' type='text/css'/>
        <link rel="icon" href="<c:url value="/resources/Image/LoadLogo.png"/>">

    </head>
    <style>
        a {
            color: black;
        }
        a:hover{
            color: black;
        }
        input:checked + label {

        }
        input[type="radio"] {
            /* remove standard background appearance */
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            /* create custom radiobutton appearance */
            display: inline-block;
            width: 15px;
            height: 15px;
            padding: 3px;
            /* background-color only for content */
            background-clip: content-box;
            border: 1px solid #bbbbbb;
            background-color: #e7e6e7;
            border-radius: 50%;
        }

        /* appearance for checked radiobutton */
        input[type="radio"]:checked {
            background-color: orange;
        }

        /* optional styles, I'm using this for centering radiobuttons */
        .flex {
            display: flex;
            align-items: center;
        }
    </style>
    <body>
        <div>
            <div class="container-fluid" style="margin-top: 20px; width: 86%">
                <div class="row" style="display: flex; justify-content: Center;">
                    <c:forEach items="${listbrand}" var="lb">
                        <div class="col-2"><a href="${pageContext.request.contextPath}/product/filterBrand?id=${lb.productBrandID}"><img src="${pageContext.request.contextPath}/imgbrand/${lb.img}" style="width: 100%; height: 170px"></a></div>     
                            </c:forEach>
                </div>
            </div>
            <div class="container-fluid" style="padding-top: 20px;width: 86%; margin-top: 50px">
                <div class="row">
                    <div class="col-3" style="border-right: 1px #D2D2D2 solid;">
                        <form action="${pageContext.request.contextPath}/product/searchpro"/>
                        <div class="row">
                            <div class="col-12">
                                <div class="input-group mb-3">
                                    <input required="" type="text" name="ten" class="form-control" placeholder="Nhập tên sản phẩm cần tìm">
                                    <div class="input-group-append">
                                        <button class="btn btn-warning" type="submit"><b>Tìm kiếm</b></button>  
                                    </div>
                                </div>
                            </div>
                        </div>
                        </form>
                        <form action="${pageContext.request.contextPath}/product/filter">
                            <h6 style="border-top: 1px;">HÃNG SẢN XUẤT</h6>
                            <div class="custom-control custom-radio" style="padding-top: 5px">
                                <input type="radio" checked="" name="lb" value=""> Tất cả thương hiệu<br>
                            </div>
                            <c:forEach items="${listbrand}" var="lb" begin="0">
                                <div class="custom-control custom-radio" style="padding-top: 5px">
                                    <input type="radio" name="lb" value="${lb.productBrandID}"> Thương hiệu ${lb.productBrandName}<br>
                                </div>
                            </c:forEach> 
                            <div style="border-top: 1px solid #D2D2D2; margin-top: 20px; margin-bottom: 20px;">
                            </div>
                            <h6 style="border-top: 1px;">LOẠI BÁNH KẸO</h6>
                                    <div class="custom-control custom-radio" style="padding-top: 5px">
                                        <input type="radio" checked="" name="lc" value=""> Tất cả loại sản phẩm
                                    </div>
                            <c:forEach items="${listcate}" var="lc" begin="0">
                                <div class="custom-control custom-radio" style="padding-top: 5px">
                                    <input type="radio" name="lc" value="${lc.productCategoryID}"> ${lc.productCategoryName}
                                </div>
                            </c:forEach> 
                            <div style="border-top: 1px solid #D2D2D2; margin-top: 20px; margin-bottom: 20px;">
                            </div>
                            <h6 style="border-top: 1px;" >SẮP XẾP THEO</h6>
                            <div class="custom-control custom-radio" style="padding-top: 5px">
                                <input type="radio" name="sort" value="asc" checked=""> Giá tăng dần
                            </div>
                            <div class="custom-control custom-radio" style="padding-top: 5px">
                                <input type="radio" name="sort" value="desc"> Giá giảm dần
                            </div>
                            <div style="border-top: 1px solid #D2D2D2; margin-top: 20px; margin-bottom: 20px;">
                            </div>
                            <h6>Khoảng giá</h6>

                            <div class="form-row">
                                <div class="col">
                                    <input type="number" min="0" max="1000000000" class="form-control" placeholder="Từ (VND)" name="minprice">
                                </div>
                                <div class="col">
                                    <input type="number" min="0" max="1000000000" class="form-control" placeholder="Đến (VND)" name="maxprice">
                                </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-12">
                                    <button class="btn btn-warning" style="width: 100%;">ÁP DỤNG</button>
                                </div>
                            </div>

                        </form>
                    </div>
                    <div class="col-9" >
                        <div>
                            <h5><a href="${pageContext.request.contextPath}/product/productpage">Các sản phẩm</a>  
                                <c:catch var="b"> 
                                    <c:if test="${b!=null}">
                                         > <a href="">Thương hiệu ${b.productBrandName}</a>
                                    </c:if>
                                </c:catch>
                            </h5>
                        </div>
                        <div>
                            <h6>
                                <c:catch var="s"> 
                                    <c:if test="${s!=null}">
                                        Các kết quả tìm kiếm cho từ khóa "${s}"
                                    </c:if>
                                </c:catch>
                            </h6>
                        </div>
                        <br>
                        <div class="row">
                            <c:forEach items="${list}" var="p">
                                <c:if test="${!empty p}">
                                    <div class="col-3" style="padding-top: 10px">
                                        <div class="card"> <img src="${pageContext.request.contextPath}/image/${p.img}" class="card-img-top" width="100%" height="180vh">
                                            <div class="card-body pt-0 px-0">
                                                <small class="text-muted key pl-3" style="color: black;font-weight: bold">${p.productName} </small>
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
                                                <div class="mx-3 mt-3 mb-2"><a href="${pageContext.request.contextPath}/cart/addList/${p.productID}.html" class="btn btn-warning btn-block"><small><b><i class="fas fa-shopping-cart"></i> THÊM VÀO GIỎ HÀNG</small></b></a></div> <small class="d-flex justify-content-center text-muted"><a href="<c:url value="/product/detail?id=${p.productID}"/>" style="color: black;font-weight: bold">Xem chi tiết sản phẩm</a></small>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>
                            <c:if test="${empty list}">
                                <div class="col-3" style="padding-top: 10px">
                                    <div> <img src="${pageContext.request.contextPath}/resources/Image/white.jpg"  width="100%" height="160vh">

                                    </div>
                                </div>
                                <div class="col-9" style="padding-top: 10px">
                                    <div > <img src="${pageContext.request.contextPath}/resources/Image/tim-kiem.png"  width="70%" height="160vh">
                                        <p style="padding-left: 9vw;padding-top: 10px; padding-bottom: 40vh;font-weight: bold;color: red">Không tìm thấy sản phẩm nào</p>
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${!empty list}">
                                <div class="col-12" align="center" style="padding-top: 10px">
                                    <c:forEach var="i" begin="0" end="${totalItem}">    
                                        <a style="background-color: orange; padding-left: 10px;padding-right: 10px; color: black;border-radius: 3px;" href="${pageContext.request.contextPath}/product/productpage/${i+1}"><c:out value="${i+1}"/></a>
                                    </c:forEach>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <footer style="background-color: black; color: white; height: 200px; padding-left: 50px; margin-top: 10px;">
            <div class="row">
                <div class="col-9">
                    <h4 style="padding-top: 20px;padding-bottom: 20px;">CỬA HÀNG BÁNH KẸO CANDYSHOP</h4>
                    <p class="pFooter">Địa chỉ: số 12 Nguyễn Văn Bảo, Phường 4, Quận Gò Vấp, TP Hồ Chí Minh</p>
                    <p class="pFooter">Điện thoại: 0819490540 - Email: CandyShop@gmail.vn </p>
                    <p class="pFooter">&copy Copyright 2022</p>
                </div>
                <div class="col-3" style="padding-top: 20px;">
                    <a href=""><img src="../Image/Logo/fb.png" style="width: 10%;"></a>
                    <a href=""><img src="../Image/Logo/yt.png" style="width: 10%;"></a>
                    <a href=""><img src="../Image/Logo/ins.png" style="width: 10%;"></a>
                </div>
            </div>
        </footer>
        <script src="https://kit.fontawesome.com/041bd10679.js" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    </body>
</html>
