<%-- 
    Document   : login
    Created on : March 23, 2022
    Author     : Tuan Khang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng nhập</title>
        <link href="<c:url value="/resources/Css/Header.css"/>" rel='stylesheet' type='text/css'/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
        <link href="<c:url value="/resources/Css/Header.css"/>" rel='stylesheet' type='text/css'/>
        <link href="<c:url value="/resources/Css/body.css"/>" rel='stylesheet' type='text/css'/>
        <link rel="icon" href="<c:url value="/resources/Image/LoadLogo.png"/>">
    </head>
    <body>
        <div class="container mt-3" style="width: 20%;padding-top: 50px;padding-bottom: 50px; border: 1px #DFE5E2 solid;border-radius:5% " align="center" >
            <img src="<c:url value="/resources/Image/LoadLogo.png"/>" style="border-radius: 50%"  width="20%"/>
            <h4 align="center">Đăng Nhập Vào CandyShop</h4><br>
            <c:catch var="mess">
                <c:if test="${mess!=null}">
                    <div class="alert alert-danger">
                        <strong>Vui lòng đăng nhập lại!</strong> Thông tin tài khoản hoặc mật khẩu không chính xác!!!
                    </div>
                </c:if>
            </c:catch>
            <c:catch var="success">
                <c:if test="${success!=null}">
                    <div class="alert alert-success">
                        <strong>Tài khoản đã được đăng kí!</strong> ${success}
                    </div>
                </c:if>
            </c:catch>
            <form action="<c:url value="/login/user"/>" method="Post">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fas fa-user"></i></span>
                    </div>
                    <input type="text" class="form-control" required="true" placeholder="Username" id="usr" name="uname" autocomplete=off>
                </div>
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fas fa-lock"></i></span>
                    </div>
                    <input type="password" class="form-control" required="true" placeholder="Password" id="usr" name="pass">
                </div>
                <button type="submit" class="btn btn-warning" style="width: 100%;font-weight: bold">Đăng nhập</button>
            </form>
                <div>
                    <br>
                    <p>Bạn chưa có tài khoản ?</p>
                    <a href="<c:url value="/register"/>">Đăng kí tại đây</a>
                </div>
        </div>
        <footer style="background-color: black; color: white; height: 200px; padding-left: 50px; margin-top: 110px;">
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
        <script src="https://kit.fontawesome.com/041bd10679.js" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
