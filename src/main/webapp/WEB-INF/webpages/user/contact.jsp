<%-- 
    Document   : contact
    Created on : March 31, 2022
    Author     : Thanh Hoai
--%>

<%@include file="header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Liên hệ</title>
        <link href="<c:url value="/resources/Css/Header.css"/>" rel='stylesheet' type='text/css'/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
        <link href="<c:url value="/resources/Css/Header.css"/>" rel='stylesheet' type='text/css'/>
        <link href="<c:url value="/resources/Css/body.css"/>" rel='stylesheet' type='text/css'/>
        <link rel="icon" href="<c:url value="/resources/Image/LoadLogo.png"/>">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
            .pepper{
                background-color: #1BA0E2; 
                display: block; 
                text-align: center; 
                margin-left: -10px; 
                margin-top: -10px;
                padding: 50px 0px 20px 0px;
                color: white;
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <div class="pepper">
            <h1>Liên hệ chúng tôi</h1>
            <p>Chúng tôi luôn sẵn sàng hỗ trợ, dù bạn ở bất cứ nơi đâu!</p>
        </div>
        <br/><br/>

        <div class="main-panel">
            <div align="right">
                <c:if test="${success!=null}">
                    <div class="toast" data-autohide="true" data-delay="1000">
                        <div class="toast-header">
                            <strong class="mr-auto text-primary">Thành công</strong>
                            <small class="text-muted"></small>
                            <button type="button" class="ml-2 mb-1 close" data-dismiss="toast">&times;</button>
                        </div>
                        <div class="toast-body" align="center">
                            <c:catch var="success">
                                ${success}
                            </c:catch>
                        </div>
                    </div>
                </c:if>
            </div>

            <div class="container">
                <div class="row">
                    <div class="col-lg-5">
                        <form action="<c:url value="/contact/save" />" method="Post" class="needs-validation" style="border: 2px solid lightgray; padding: 20px 20px 20px 20px;" novalidate>
                            <div class="form-group">
                                <h3 style="text-align: center">Thông tin hỗ trợ</h3>
                            </div>
                            <hr /> <br/>
                            <div class="form-group">
                                <label for="uname" style="font-weight: bold">Tên của bạn</label>
                                <input type="text" class="form-control" id="uname" placeholder="Nguyễn Văn A" name="uname" required>
                                <div class="valid-feedback">Valid.</div>
                                <div class="invalid-feedback">Please fill out this field.</div>
                            </div>
                            <div class="form-group">
                                <label for="email" style="font-weight: bold">Email của bạn</label>
                                <input type="email" class="form-control" id="email" placeholder="exam@gmail.com" name="email" required>
                                <div class="valid-feedback">Valid.</div>
                                <div class="invalid-feedback">Please fill out this field.</div>
                            </div>
                            <div class="form-group">
                                <label for="comment" style="font-weight: bold">Hãy chia sẽ lo lắng của bạn</label>
                                <textarea class="form-control" rows="5" id="comment" name="comment" required=""></textarea>
                                <div class="valid-feedback">Valid.</div>
                                <div class="invalid-feedback">Please fill out this field.</div>
                            </div>
                            <button type="submit" class="btn btn-primary" style="display: block; width: 100%;" >Gửi</button>
                        </form>
                    </div>

                    <div class="col-lg-7">
                        <img src="<c:url value="/resources/Image/ima.svg" />"  style="width: 240px; height: 100%;margin: auto; display: block; margin-top: -100px; "/>
                        <h5 style="color: #686868; text-align: center; margin-top: -100px;">Để được hỗ trợ nhanh hơn, vui lòng gửi yêu cầu của bạn qua biểu mẫu sau.</h5>
                        <br />
                        <h3 style="color: #686868; text-align: center;"><img src="<c:url value="/resources/Image/icon_phone.svg" />"  style="width: 35px; height: 35px"/> Tổng đài hỗ trợ: 0353.784.735</h3>
                    </div>
                </div>
            </div>
            <br/><br/><br />
            <footer style="background-color: black; color: white; height: 200px; padding-left: 50px;">
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
            <script>
                // Disable form submissions if there are invalid fields
                (function () {
                    'use strict';
                    window.addEventListener('load', function () {
                        // Get the forms we want to add validation styles to
                        var forms = document.getElementsByClassName('needs-validation');
                        // Loop over them and prevent submission
                        var validation = Array.prototype.filter.call(forms, function (form) {
                            form.addEventListener('submit', function (event) {
                                if (form.checkValidity() === false) {
                                    event.preventDefault();
                                    event.stopPropagation();
                                }
                                form.classList.add('was-validated');
                            }, false);
                        });
                    }, false);
                })();
            </script>

            <script src="<c:url value="/resources/vendors/js/vendor.bundle.base.js"/>"></script>
            <script src="<c:url value="/resources/vendors/chart.js/Chart.min.js"/>"></script>
            <script src="<c:url value="/resources/vendors/moment/moment.min.js"/>"></script>
            <script src="<c:url value="/resources/vendors/daterangepicker/daterangepicker.js"/>"></script>
            <script src="<c:url value="/resources/vendors/chartist/chartist.min.js"/>"></script>
            <script src="<c:url value="/resources/js/off-canvas.js"/>"></script>
            <script src="<c:url value="/resources/js/dashboard.js"/>"></script>
            <script src="<c:url value="/resources/js/misc.js"/>"></script>
            <script>
                $(document).ready(function () {
                    $('.toast').toast('show');
                });
            </script>
    </body>
</html>
