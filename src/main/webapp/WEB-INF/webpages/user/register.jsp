<%-- 
    Document   : register
    Created on : March 23, 2022
    Author     : Hung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="<c:url value="/resources/Css/Header.css"/>" rel='stylesheet' type='text/css'/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
        <link href="<c:url value="/resources/Css/Header.css"/>" rel='stylesheet' type='text/css'/>
        <link href="<c:url value="/resources/Css/body.css"/>" rel='stylesheet' type='text/css'/>
        <link href="<c:url value="/resources/register/signup.css"/>" rel='stylesheet' type='text/css'/>
        <link rel="icon" href="<c:url value="/resources/Image/LoadLogo.png"/>">


    </head>


    <style>
        span{
            margin-left: 5px;
        }
        i {
            margin-right: 5px;
        }
    </style>
    <body>




        <div class="row" style="padding-top: 50px;padding-bottom: 50px;">
            <div class="col-12">
                <div class="container"  style="width: 50%;border: 1px #DFE5E2 solid;border-radius:5%; height: auto" >
                    <div align="center ">
                        <img src="<c:url value="/resources/Image/LoadLogo.png"/>" style="border-radius: 50%"  width="10%" />
                        <div class="title">ĐĂNG KÍ</div>
                    </div>

                        <form name="form" onsubmit ="return matchpass()" action="<c:url value="/register/save"/>" id="form" method="POST" enctype="multipart/form-data">
                        <c:catch var="u">
                            <div class="row">
                                <div class="col-6">
                                    <div class="form-group">
                                        <label for="pwd"><i class="fas fa-pen"></i></span>Tên đầy đủ:</label>
                                        <input pattern="^[a-zA-Z_ÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ ]+$"
                                               title="Tên khách hàng không chứ kí tự đặc biệt hoặc số" class="form-control"type="text" value="${u.fullName}" id="tendaydu" required  placeholder="Nhập họ tên" name="tendaydu" autocomplete="off">
                                    </div>
                                </div>

                                <div class="col-6">
                                    <div class="form-group">
                                        <label for="pwd"> <i class="fas fa-user-alt"></i><span class="details">Tên đăng nhập </span></label>
                                        <input class="form-control" type="text" id="tendangnhap" required  value="${u.username}" placeholder="Nhập tên đăng nhập " name="tendangnhap" autocomplete="off">
                                        <c:catch var="err">
                                            <p style="color: red">${err}</p>
                                        </c:catch>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-6">
                                    <div class="form-group">
                                        <label for="pwd"><i class="fas fa-key"></i></span>Mật khẩu:</label>
                                        <input class="form-control" type="password" id="pass" required  value="${u.password}" placeholder="Nhập mật khẩu" name="matkhau" autocomplete="off">

                                    </div>
                                </div>

                                <div class="col-6">
                                    <div class="form-group">
                                        <label for="pwd"> <i class="fas fa-envelope-square"></i><span class="details">Email </span></label>
                                        <input class="form-control" type="email" id="email" required  value="${u.email}" placeholder="Nhập email" name="email" autocomplete="off">
                                        <c:catch var="err1">
                                            <p style="color: red">${err1}</p>
                                        </c:catch>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-6">
                                    <div class="form-group">
                                        <label for="pwd"><i class="fas fa-key"></i></span>Xác nhận mật khẩu:</label>
                                        <input class="form-control" type="password" id="cpass" required name="pass2" placeholder="Nhập lại mật khẩu" autocomplete="off">
                                        <p id="message"></p>
                                    </div>
                                </div>

                                <div class="col-6">
                                    <div class="form-group">
                                        <label for="pwd"> <i class="fas fa-mobile-alt"></i><span class="details">Số điện thoại </span></label>
                                        <input id="sodt" class="form-control" required  value="${u.phoneNumber}" placeholder="Nhập số điện thoại" name="sodt" autocomplete="off">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-6">
                                    <div class="form-group">
                                        <label for="pwd"> <i class="fas fa-calendar"></i></span>Chọn ngày sinh:</label>
                                        <input class="form-control" type="date" required id="ngaysinh" name="ngaysinh" autocomplete="off">
                                    </div>
                                </div>

                                <div class="col-6">
                                    <div class="form-group">
                                        <label for="pwd"> <i class="fas fa-user"></i><span class="details">Hình ảnh </span></label>
                                        <input class="form-control" required="" type="file" accept=".png, .jpg, .jpeg" placeholder="hinhanh" name="image" autocomplete="off">
                                    </div>
                                </div>
                            </div>

                            <div class="input-box">
                                <i class="fas fa-home"></i>
                                <span class="details"> Địa chỉ </span>

                                <div class="row">
                                    <div class="col-4">
                                        <input class="form-control" type="text" placeholder="Nhập địa chỉ" name="diachi">
                                    </div>
                                    <div class="col-4">
                                        <select class="form-control" name="calc_shipping_provinces" required="">
                                            <option value="tinh">Tỉnh / Thành phố</option>
                                        </select>                                    
                                    </div>
                                    <div class="col-4">
                                        <select class="form-control" name="calc_shipping_district" required="">
                                            <option value="quan">Quận / Huyện</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12">
                                        <br>
                                        <button class="btn btn-warning" id="btnRegis" type="submit" style="width: 100%; font-weight: bold">Đăng kí</button>
                                    </div>
                                </div>

                                <input class="billing_address_1" name="" type="hidden" value="">
                                <input class="billing_address_2" name="" type="hidden" value="">
                            </div>
                        </c:catch>
                </div>
                </form>
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
                <a href=""><img src="../Image/Logo/fb.png" style="width: 10%;"></a>
                <a href=""><img src="../Image/Logo/yt.png" style="width: 10%;"></a>
                <a href=""><img src="../Image/Logo/ins.png" style="width: 10%;"></a>
            </div>
        </div>
    </footer>

    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js' ></script>

    <script src="https://kit.fontawesome.com/041bd10679.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src='https://cdn.jsdelivr.net/gh/vietblogdao/js/districts.min.js'></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src='https://cdn.jsdelivr.net/gh/vietblogdao/js/districts.min.js'></script>
    <script>//<![CDATA[
                        if (address_2 = localStorage.getItem('address_2_saved')) {
                            $('select[name="calc_shipping_district"] option').each(function () {
                                if ($(this).text() == address_2) {
                                    $(this).attr('selected', '')
                                }
                            })
                            $('input.billing_address_2').attr('value', address_2)
                        }
                        if (district = localStorage.getItem('district')) {
                            $('select[name="calc_shipping_district"]').html(district)
                            $('select[name="calc_shipping_district"]').on('change', function () {
                                var target = $(this).children('option:selected')
                                target.attr('selected', '')
                                $('select[name="calc_shipping_district"] option').not(target).removeAttr('selected')
                                address_2 = target.text()
                                $('input.billing_address_2').attr('value', address_2)
                                district = $('select[name="calc_shipping_district"]').html()
                                localStorage.setItem('district', district)
                                localStorage.setItem('address_2_saved', address_2)
                            })
                        }
                        $('select[name="calc_shipping_provinces"]').each(function () {
                            var $this = $(this),
                                    stc = ''
                            c.forEach(function (i, e) {
                                e += +1
                                stc += '<option value=' + e + '>' + i + '</option>'
                                $this.html('<option value="">Tỉnh / Thành phố</option>' + stc)
                                if (address_1 = localStorage.getItem('address_1_saved')) {
                                    $('select[name="calc_shipping_provinces"] option').each(function () {
                                        if ($(this).text() == address_1) {
                                            $(this).attr('selected', '')
                                        }
                                    })
                                    $('input.billing_address_1').attr('value', address_1)
                                }
                                $this.on('change', function (i) {
                                    i = $this.children('option:selected').index() - 1
                                    var str = '',
                                            r = $this.val()
                                    if (r != '') {
                                        arr[i].forEach(function (el) {
                                            str += '<option value="' + el + '">' + el + '</option>'
                                            $('select[name="calc_shipping_district"]').html('<option value="">Quận / Huyện</option>' + str)
                                        })
                                        var address_1 = $this.children('option:selected').text()
                                        var district = $('select[name="calc_shipping_district"]').html()
                                        localStorage.setItem('address_1_saved', address_1)
                                        localStorage.setItem('district', district)
                                        $('select[name="calc_shipping_district"]').on('change', function () {
                                            var target = $(this).children('option:selected')
                                            target.attr('selected', '')
                                            $('select[name="calc_shipping_district"] option').not(target).removeAttr('selected')
                                            var address_2 = target.text()
                                            $('input.billing_address_2').attr('value', address_2)
                                            district = $('select[name="calc_shipping_district"]').html()
                                            localStorage.setItem('district', district)
                                            localStorage.setItem('address_2_saved', address_2)
                                        })
                                    } else {
                                        $('select[name="calc_shipping_district"]').html('<option value="">Quận / Huyện</option>')
                                        district = $('select[name="calc_shipping_district"]').html()
                                        localStorage.setItem('district', district)
                                        localStorage.removeItem('address_1_saved', address_1)
                                    }
                                })
                            })
                        })
                        //]]></script>


    <script type="text/javascript">
        function matchpass() {
            var firstpassword = document.form.matkhau.value;
            var secondpassword = document.form.pass2.value;

            if (firstpassword == secondpassword) {
                return true;
            } else {
                alert("Mật khẩu xác nhận không chính xác");
                return false;
            }
        }
    </script>
</body>
</html>