<%-- 
    Document   : userform
    Created on : April 1, 2022
    Author     : Hung
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chỉnh sửa thông tin cá nhân</title>
        <link href="<c:url value="/resources/Css/Header.css"/>" rel='stylesheet' type='text/css'/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
        <link href="<c:url value="/resources/Css/Header.css"/>" rel='stylesheet' type='text/css'/>
        <link href="<c:url value="/resources/Css/body.css"/>" rel='stylesheet' type='text/css'/>
        <link rel="icon" href="<c:url value="/resources/Image/LoadLogo.png"/>">
    </head>
    <body>
        <div class="container-fluid" style="width: 85%; padding-top: 30px">
            <c:catch var="userShop" >
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">Thông tin khách hàng</h4>
                        <form class="form-sample" autocomplete="off" action="<c:url value="/user/saveUser"/>" enctype="multipart/form-data" method="post">
                            <p class="card-description"> Thông tin khách hàng </p>
                            <div class="row">
                                <div class="col-5"></div>
                                <div class="col-2"><img style="border-radius: 50%" src="${pageContext.request.contextPath}/imageuser/${userShop.img}" class="card-img-top" width="150vw" height="180vh"></div>
                                <div class="col-5"></div>
                                <div class="col-6">
                                    <div class="form-group">
                                        <label for="pwd"><i class="fas fa-pen"></i></span>Tên đầy đủ:</label>
                                        <input class="form-control"type="text" id="tendaydu" required value="${userShop.fullName}"  placeholder="Nhập họ tên" name="tendaydu" autocomplete="off">
                                    </div>
                                </div>

                                <div class="col-6">
                                    <div class="form-group">
                                        <label for="pwd"> <i class="fas fa-user-alt"></i><span class="details">Tên đăng nhập </span></label>
                                        <input class="form-control" type="text" id="tendangnhap" value="${userShop.username}" readonly required  placeholder="Nhập tên đăng nhập " name="tendangnhap" autocomplete="off">

                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-6">
                                    <div class="form-group">
                                        <label for="pwd"> <i class="fas fa-envelope-square"></i><span class="details">Email </span></label>
                                        <input class="form-control" type="email" id="email" required value="${userShop.email}" placeholder="Nhập email" name="email" autocomplete="off">
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="form-group">
                                        <label for="pwd"> <i class="fas fa-mobile-alt"></i><span class="details">Số điện thoại </span></label>
                                        <input class="form-control" type="text" id="sodt" value="${userShop.phoneNumber}" required placeholder="Nhập số điện thoại" name="sodt" autocomplete="off">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-6">
                                    <div class="form-group">
                                        <label for="pwd"> <i class="fas fa-calendar"></i></span>Chọn ngày sinh:</label>
                                                          
                                        <input class="form-control" type="date" required id="ngaysinh" value="<fmt:formatDate pattern = "yyyy-MM-dd" value = "${userShop.birthday}" />" name="ngaysinh" autocomplete="off">
                                    </div>
                                </div>
                            </div>

                            <div class="input-box">
                                <i class="fas fa-home"></i>
                                <span class="details"> Địa chỉ </span>

                                <div class="row">
                                    <div class="col-12">
                                        <input class="form-control" type="text" value="${userShop.address}" placeholder="Nhập địa chỉ" name="diachi">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12">
                                        <br>
                                        <button class="btn btn-success" id="btnRegis" type="submit" style="width: 100%; font-weight: bold">Cập nhật</button>
                                    </div>
                                </div>
                                <input type="hidden" value="${userShop.password}" name="pass">
                                <input type="hidden" value="${userShop.img}" name="img">
                                <input type="hidden" value="${userShop.userID}" name="id">
                                <input class="billing_address_1" name="" type="hidden" value="">
                                <input class="billing_address_2" name="" type="hidden" value="">
                            </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
</c:catch>
</div>
</body>


<footer style="background-color: black; color: white; height: 200px; padding-left: 50px; margin-top: 110px;">
    <div class="row">
        <div class="col-9">
            <h4 style="padding-top: 20px;padding-bottom: 20px;">CỬA HÀNG BÁNH KẸO CANDY SHOP</h4>
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
</html>
