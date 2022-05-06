<%-- 
    Document   : about
    Created on : March 23, 2022
    Author     : Tuan Khang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Giới thiệu về chúng tôi</title>
        <link href="<c:url value="/resources/Css/Header.css"/>" rel='stylesheet' type='text/css'/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
        <link href="<c:url value="/resources/Css/Header.css"/>" rel='stylesheet' type='text/css'/>
        <link href="<c:url value="/resources/Css/body.css"/>" rel='stylesheet' type='text/css'/>
        <link rel="icon" href="<c:url value="/resources/Image/LoadLogo.png"/>">
    </head>
    <style>
        li {
            color: red;
        }
    </style>
    <body>
        <div style="height: 150px; background-color: #e6e6e6;margin-bottom: 50px;">
            <div class="container-custom">
                <h3 style=" padding-top: 50px;">Giới thiệu về chúng tôi</h3>
            </div>
        </div>
        <div class="container-custom">
            <div class="row">
                <div class="col-6">
                    <h4 style="margin-top: 30px;">VỀ CHÚNG TÔI</h4>
                    <div style="border-top: 5px solid green; margin-top: 20px; margin-bottom: 20px;"></div>
                    <p>
                        CANDYSHOP là một trang web hàng đầu trong lĩnh vực cung cấp các sản phẩm bánh kẹo. Chúng tôi khẳng
                        định
                        sẽ
                        đem lại những trải nghiệm tuyệt vời cho quý khách
                        hy vọng quý khách sẽ tiếp tục ủng hộ chúng tôi trong thời gian sắp tới
                    </p>
                </div>
                <div class="col-6">
                    <img src="<c:url value="/resources/Image/vitri.png"/>" alt="" width="100%">
                </div>
            </div>

        </div>

        <div class="container-custom">

            <div class="row">
                <div class="col-6">
                    <h4 style="margin-top: 30px;">THÀNH VIÊN SÁNG LẬP</h4>
                    <div style="border-top: 5px solid red; margin-top: 20px; margin-bottom: 20px;"></div>
                </div>
                <div class="col-6">

                </div>
                <div class="col-3">
                    <div class="card" style="width:100%; margin-top: 10px;">
                        <img class="card-img-top" src="<c:url value="/resources/Image/person.jpg"/>" alt="Card image" style="width:100%">
                        <div class="card-body">
                            <h4 class="card-title" align="center">Lê Tuấn Khang</h4>
                            <p class="card-text" align="center">Develop</p>
                        </div>
                    </div>
                </div>
                <div class="col-3">
                    <div class="card" style="width:100%; margin-top: 10px;">
                        <img class="card-img-top" src="<c:url value="/resources/Image/person.jpg"/>" alt="Card image" style="width:100%">
                        <div class="card-body">
                            <h4 class="card-title" align="center">Nguyễn Thanh Hoài</h4>
                            <p class="card-text" align="center">Develop</p>
                        </div>
                    </div>
                </div>
                <div class="col-3">
                    <div class="card" style="width:100%; margin-top: 10px;">
                        <img class="card-img-top" src="<c:url value="/resources/Image/person.jpg"/>" alt="Card image" style="width:100%">
                        <div class="card-body">
                            <h4 class="card-title" align="center">Nguyễn Trần Nhật Hưng</h4>
                            <p class="card-text" align="center">Develop</p>
                        </div>
                    </div>
                </div>
                <div class="col-3">
                    <div class="card" style="width:100%; margin-top: 10px;">
                        <img class="card-img-top" src="<c:url value="/resources/Image/person.jpg"/>" alt="Card image" style="width:100%">
                        <div class="card-body">
                            <h4 class="card-title" align="center">Lê Văn Toàn</h4>
                            <p class="card-text" align="center">Develop</p>
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
    </body>
</html>
