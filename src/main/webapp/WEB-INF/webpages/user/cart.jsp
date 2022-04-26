<%-- 
    Document   : cart
    Created on : March 23, 2022, 9:55:34 AM
    Author     : Thanh Hoai
--%>
<%@include file="header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Giỏ hàng</title>
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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
            li {
                color: red;
            }

            .cart_product_inner button {
                width: 20%;
                margin-left: auto;
                margin-right: auto;
                display: block;
            }

            .cart_product_inner img{
                width: 120px;
                height: 140px;
            }

            #empty img, #empty button{
                width: 20%;
                margin-left: auto;
                margin-right: auto;
                display: block;
            }
        </style>
    </head>
    <body>

        <br/><br/>

        <div class="container">
            <h4>
                GIỎ HÀNG
                <span id="" style="font-weight:normal; font-size:16px; color: slategray">(<span id="cart_count"><c:out value="${sessionScope.myCartNum}"/></span> sản phẩm)</span>
            </h4>
            <br/> <br/> <br/>

            <div id="empty">
                <img src="<c:url value="/resources/Image/cart.png" />" />
                <p style="font-weight: bold; text-align: center">Không có sản phẩm nào trong giỏ hàng của bạn.</p>
                <a href="<c:url value="/"/>" style="text-decoration: none">
                    <button type="button" class="btn btn-warning" style="width: 20%; border: none; font-weight: bold;" onclick="dieu_huong()">Tiếp tục mua sắm</button>
                </a>
            </div>


            <div class="row" id="cart">
                <div class="col-lg-8" id="cartlist">
                    <div class="cart_product_inner">
                        <c:forEach var="map" items="${sessionScope.myCartItems}">
                            <div class="container" style="background-color:#f5f5f5; padding:10px 5px 10px 15px;">
                                <div class="row">

                                    <div class="col-lg-3">
                                        <img src="${pageContext.request.contextPath}/image/${map.value.product.img}" />
                                    </div>
                                    <div class="col-lg-8">
                                        <a href="<c:url value="/product/detail?id=${map.value.product.productID}"/>" style="color:black; "><c:out value="${map.value.product.productName}"/></a>
                                        <br /><br />
                                        <div class="row" style="margin-right: -60px;">
                                            <div class="col-lg-5">
                                                <p style="color:orange">Chỉ còn <Span id="quantityProduct"><c:out value="${map.value.product.quantity}" /></Span> sản phẩm</p>
                                                <span style="color:blue; font-size: 14px"><a href="${pageContext.request.contextPath}/cart/remove/${map.value.product.productID}.html">Xóa</a></span>
                                                <span style="margin-left:20px; color:blue; font-size: 14px">Để dành mua sau</span>
                                            </div>
                                            <div class="col-lg-7">
                                                <div class="row">
                                                    <div class="col-lg-6">
                                                        <p style="color:red; font-weight:bold; margin-bottom: -5px;"><c:out value="${map.value.product.price}" /> VND</p>

                                                    </div>
                                                    <div class="col-lg-6">
                                                        <a href="${pageContext.request.contextPath}/cart/decrease/${map.value.product.productID}.html">
                                                            <input type="button" class="decrease" value="-" style="margin-right:-6px" />
                                                        </a>
                                                        <input type="tel" class="quantity" readonly name="quantity" value="<c:out value="${map.value.quantity}"/>" style="text-align: center" size="1" onkeypress="return (event.charCode != 8 && event.charCode == 0 || (event.charCode >= 48 && event.charCode <= 57))" />
                                                        <a href="${pageContext.request.contextPath}/cart/increase/${map.value.product.productID}.html">
                                                            <input type="button" class="increase" value="+" style="margin-left:-6px" />
                                                        </a>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <br/>
                        </c:forEach>
                        <div class="container" style="margin-top: 100px; padding:10px 5px 10px 15px;">
                            <a href="<c:url value="/"/>" style="text-decoration: none">
                                <button type="button" class="btn btn-warning" style=" width: 50%; height: 45px; border: none; font-weight: bold;">Tiếp tục mua sắm</button>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4" style="margin-left:-15px;" id="cartlist">
                    <div class="cart_total_price">

                        <div class="container" style="background-color:#f5f5f5; padding-top: 10px;">
                            <p style="font-weight:bold; font-size: 15px;">CandyShop Khuyến Mãi</p>
                            <hr />
                            <img src="<c:url value="/resources/Image/discount.png"/>" style="width:80px; height:45px; margin-top: -10px;" />
                            <span style="color: #427df8; margin-left: -20px; font-weight:bold">Chọn hoặc nhập khuyến mãi</span>
                        </div>

                        <div class="container" style="background-color:#f5f5f5; padding-top: 10px; padding-bottom:20px; margin-top: 10px">
                            <p>
                                <span style="color:#6d6767">Tạm tính</span>
                                <span style="float:right; color:black; font-weight:bold"><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${sessionScope.myCartTotal}" /> VNĐ</span>
                            </p>
                            <hr />
                            <p>
                                <span style="color:#6d6767">Thành Tiền</span>
                                <span style="float:right; color:red; font-weight:bold; font-size: 22px"><fmt:formatNumber type = "number" maxFractionDigits = "3" value ="${sessionScope.myCartTotal + (sessionScope.myCartTotal * 0.1)}" /> VNĐ </span>
                                <br />
                                <i style="float: right; color:#2c2929; font-size: 13px">(Đã bao gồm thuế VAT nếu có)</i>
                            </p>
                        </div>

                        <br />

                        <a href="<c:url value="/cart/checkoutshow" />" style="text-decoration: none">
                            <button type="button" class="btn btn-primary btn-block">Tiến hành đặt hàng</button>
                        </a>

                    </div>
                </div>
            </div>

        </div>    

        <br/><br/><br />
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
    </body>            

    <br/><br/>

    <script>
        var count = document.getElementById("cart_count").innerHTML;
        if (count == '') {
            document.getElementById("cart_count").innerHTML = '0';
            count = 0;
        }
        if (count == '0') {
            document.getElementById("empty").style.display = 'block';
            document.getElementById("cart").style.display = 'none';
        } else {
            document.getElementById("empty").style.display = 'none';
            document.getElementById("cartlist").style.display = 'block';
        }
    </script>
</body>
</html>
