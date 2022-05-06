<%-- 
    Document   : productdetail
    Created on : March 22, 2022
    Author     : Tuan Khang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
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
        <link rel="icon" href="<c:url value="/resources/Image/LoadLogo.png"/>">
    </head>
    <style>
        @import url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);

        /* Styling h1 and links
    ––––––––––––––––––––––––––––––––– */
        h1[alt="Simple"] {
            color: white;
        }


        .starrating>input {
            display: none;
        }

        /* Remove radio buttons */

        .starrating>label:before {
            content: "\f005";
            /* Star */
            font-size: 2em;
            font-family: FontAwesome;
            display: inline-block;
        }

        .starrating>label {
            color: #222222;
            /* Start color when not clicked */
        }

        .starrating>input:checked~label {
            color: #ffca08;
        }


        .starrating>input:hover~label {
            color: #ffca08;
        }
        span {
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
        }

        input{
            border: 0;
            width: 1px;
        }

        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

        input:disabled {
            background-color: white;
        }
        .quantity {
            position: relative;
        }

        input[type=number]::-webkit-inner-spin-button,
        input[type=number]::-webkit-outer-spin-button
        {
            -webkit-appearance: none;
            margin: 0;
        }

        input[type=number]
        {
            -moz-appearance: textfield;
        }

        .quantity input {
            width:70px;
            height: 42px;
            line-height: 1.65;
            float: left;
            display: block;
            padding: 0;
            margin: 0;
            padding-left: 20px;
            border: 1px solid #eee;
        }

        .quantity input:focus {
            outline: 0;
        }

        .quantity-nav {
            float: left;
            position: relative;
            height: 42px;
        }

        .quantity-button {
            position: relative;
            cursor: pointer;
            border-left: 1px solid #eee;
            width: 20px;
            text-align: center;
            color: #333;
            font-size: 13px;
            font-family: "Trebuchet MS", Helvetica, sans-serif !important;
            line-height: 1.7;
            -webkit-transform: translateX(-100%);
            transform: translateX(-100%);
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            -o-user-select: none;
            user-select: none;
        }

        .quantity-button.quantity-up {
            position: absolute;
            height: 50%;
            top: 0;
            border-bottom: 1px solid #eee;
        }

        .quantity-button.quantity-down {
            position: absolute;
            bottom: -1px;
            height: 50%;
        }
    </style>
    <body>
        <div class="container-custom">
            <c:catch >
                <div class="row">
                    <div class="col-12" style="margin-top: 30px;">
                        <h4>THÔNG TIN SẢN PHẨM</h4>
                        <div style="border-top: 5px solid green; margin-top: 20px; margin-bottom: 20px; width: 59%;"></div>
                    </div>
                    <div class="col-7">
                        <img src="${pageContext.request.contextPath}/image/${p.img}" alt="" width="70%">
                    </div>
                    <div class="col-5">
                        <form action="${pageContext.request.contextPath}/cart/adds/${p.productID}.html" method="Post">
                            <div class="row">

                                <div class="col-12" style="padding-top: 20px;">
                                    <b>${p.productName}</b>
                                    <div style="border-top: 5px solid red; margin-top: 20px; margin-bottom: 20px; width: 100%;">
                                    </div>
                                </div>
                                <div class="col-4" style="padding-top: 20px;">
                                    Số lượng còn
                                </div>
                                <div class="col-8" style="padding-top: 20px;">
                                    ${p.quantity}
                                </div>
                                <div class="col-4" style="padding-top: 20px;">
                                    Giá bán
                                </div>
                                <div class="col-8" style="color: red;padding-top: 20px;">
                                    <fmt:formatNumber type = "number" 
                                                      maxFractionDigits = "3" value = "${p.price}"/> VND
                                </div>
                                <div class="col-4" style="padding-top: 20px;">
                                    Bảo hành
                                </div>
                                <div class="col-8" style="padding-top: 20px;">
                                    <b>${p.warranTyperiod}</b>
                                </div>
                                <div class="col-4" style="padding-top: 20px;">
                                    Xuất xứ
                                </div>
                                <div class="col-8" style="padding-top: 20px">
                                    <b>${p.productBrandID.nationalProduction}</b>
                                </div>
                                <div class="col-4" style="padding-top: 20px;">
                                    Nhập số lượng cần mua
                                </div>
                                <br><br>
                                <div class="col-8" style="padding-top: 20px; padding-bottom: 20px">
                                    <div class="quantity">
                                        <input type="number" readonly="" min="1" max="${p.quantity}" step="1" value="1" name="qty">
                                    </div>
                                </div>
                                <div class="col-12" style="padding-top: 20px">
                                    <button type="submit" class="btn btn-warning"
                                            style="font-weight: bold">
                                        <i class="fas fa-shopping-cart"></i> Thêm vào giỏ hàng </button>
                                </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-custom">
            <div class="row">
                <div class="col-12" style="padding-top: 20px;">
                    <b>MÔ TẢ SẢN PHẨM</b>
                </div>
                <div class="col-12" style="padding-top: 20px;">
                    ${p.description}
                </div>
            </div>
        </div>
    </c:catch>
    <div class="container-custom">
        <div style="border-top: 3px solid gray; margin-top: 20px; margin-bottom: 20px; width: 100%;"></div>
    </div>
    <div style="padding-top: 20px">
        <ul class="container-custom nav nav-tabs">
            <li class="nav-item">
                <a class="nav-link active" style="color: black" data-toggle="tab" href="#home">Bình luận</a>
            </li>
        </ul>

        <!-- Tab panes -->
        <div class="tab-content">
            <div id="home" class="tab-pane active"><br>
                <div class="container-fluid" style="width: 84% !important;padding-bottom: 30px">
                    <div class="row">
                        <div class="col-xl-12">
                            <h6>Tất cả bình luận</h6>
                        </div>
                        <c:forEach items="${listComment}" var="cmt">
                            <div class="col-xl-1" style="padding-top: 40px">
                                <img style="border-radius: 50%;width: 30px" src="${pageContext.request.contextPath}/imageuser/${userShop.img}" class="card-img-top"  height="30">
                            </div>
                            <div class="col-xl-11" style="padding-top: 40px">
                                <h6 style="color: #2908a4; font-weight: bold;">${cmt.userID.fullName} <small style="color: black">Đã đánh giá ${cmt.vote}<i style="color: orange" class="fas fa-star"></i></small></h6>
                                <p>Đã bình luận: ${cmt.commentContent}
                                </p>
                                <%     
                                    UserShop userShop1 = (UserShop) session.getAttribute("userlogin");
                                %>

                                <c:set var = "usershop" scope = "session" value = "<%=userShop1%>"/>
                             
                                <c:if test="${cmt.repComment==null}">
                                    <c:if test="${userShop.role=='admin'}">
                                        <span style="cursor: pointer; color: gray;" onclick="myFunction${cmt.commentID}()"><i
                                                class="fas fa-comment"></i>&nbsp;&nbsp;Trả lời</span>
                                        
                                    </c:if>
                                </c:if>
                                    <c:if test="${cmt.repComment!=null}">

                                    <div class="row">
                                        <div class="col-1">
                                        </div>
                                        <div class="col-11" style="border-left: 1px #D2D2D2 solid;">
                                            <h6 style="color: #2908a4; font-weight: bold;">Quản trị viên</h6>
                                            <p><i class="fas fa-reply" style="transform: rotate(180deg);"></i>&nbsp;Đã trả lời: ${cmt.repComment}</p>
                                        </div>
                                    </div>
                                </c:if>
                            </div>
                            <div class="row" style="padding-top: 10px">
                                <div class="col-1">
                                </div>
                                <div class="col-11" id="myDIV${cmt.commentID}" style="display: none;">
                                    <div class="row">
                                        <div class="col-1">

                                        </div>
                                        <div class="col-11">
                                            <form action="${pageContext.request.contextPath}/comment/rep" method="post">
                                                <input type="hidden" value="${cmt.commentID}" name="id"/>
                                                <input type="hidden" value="${cmt.productID.productID}" name="productId"/>
                                                <input type="hidden" value="${cmt.userID.userID}" name="userId"/>
                                                <input type="hidden" value="${cmt.vote}" name="vote"/>
                                                <input type="hidden" value="${cmt.commentContent}" name="cmt"/>
                                                <div class=" form-group">
                                                    <textarea required="" name="repCmt" class="form-control" rows="2" cols="200" id="comment"
                                                              placeholder="Nhập bình luận trả lời của bạn"></textarea>
                                                </div>
                                                <button type="submit" class="btn btn-warning">Gửi câu trả lờis</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <c:set var = "list" scope = "session" value = "${list}"/>
                <c:if test="${!empty list}">
                    <form action="${pageContext.request.contextPath}/comment/save" method="post">"
                        <div class="container-custom">
                            <div class="row">
                                <c:catch var="p">
                                    <input type="hidden" value="${p.productID}" name="productId"/>
                                </c:catch>
                                <div class="col-12" style="padding-top: 20px;">
                                    <b>Đánh giá sản phẩm</b>
                                </div>
                                <div class="col-12" style="padding-top: 20px;" style="width: 100%  !important;">
                                    <div class=" form-group" style="width: 100%  !important;">
                                        <label for="comment">Comment:</label>
                                        <textarea required="" class="form-control" rows="5" cols="200" id="comment" name="cmt"
                                                  style="max-width: 100%"></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="container-custom">
                            <div class="starrating risingstar d-flex justify-content-center flex-row-reverse">
                                <input type="radio" required="" id="star5" name="rating" value="5" /><label for="star5" title="5 star"></label>
                                <input type="radio" required="" id="star4" name="rating" value="4" /><label for="star4" title="4 star"></label>
                                <input type="radio" required="" id="star3" name="rating" value="3" /><label for="star3" title="3 star"></label>
                                <input type="radio" required="" id="star2" name="rating" value="2" /><label for="star2" title="2 star"></label>
                                <input type="radio" required="" id="star1" name="rating" value="1" /><label for="star1" title="1 star"></label>
                            </div>

                        </div>
                        <div class="container-custom" style="margin-top: 5px; margin-bottom: 10px;">
                            <button type="submit" class="btn btn-danger" style="width: 150px; height: 40px; ">Bình luận</button>
                        </div>
                    </form>
                </c:if>
            </div>
          </div>
    </div>


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
    <script src="https://kit.fontawesome.com/041bd10679.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
                                            $(document).ready(function () {
                                                $('.count').prop('disabled', true);
                                                $(document).on('click', '.plus', function () {
                                                    $('.count').val(parseInt($('.count').val()) + 1);
                                                });
                                                $(document).on('click', '.minus', function () {
                                                    $('.count').val(parseInt($('.count').val()) - 1);
                                                    if ($('.count').val() == 0) {
                                                        $('.count').val(1);
                                                    }
                                                });
                                            });
                                            jQuery('<div class="quantity-nav"><div class="quantity-button quantity-up">+</div><div class="quantity-button quantity-down">-</div></div>').insertAfter('.quantity input');
                                            jQuery('.quantity').each(function () {
                                                var spinner = jQuery(this),
                                                        input = spinner.find('input[type="number"]'),
                                                        btnUp = spinner.find('.quantity-up'),
                                                        btnDown = spinner.find('.quantity-down'),
                                                        min = input.attr('min'),
                                                        max = input.attr('max');

                                                btnUp.click(function () {
                                                    var oldValue = parseFloat(input.val());
                                                    if (oldValue >= max) {
                                                        var newVal = oldValue;
                                                    } else {
                                                        var newVal = oldValue + 1;
                                                    }
                                                    spinner.find("input").val(newVal);
                                                    spinner.find("input").trigger("change");
                                                });

                                                btnDown.click(function () {
                                                    var oldValue = parseFloat(input.val());
                                                    if (oldValue <= min) {
                                                        var newVal = oldValue;
                                                    } else {
                                                        var newVal = oldValue - 1;
                                                    }
                                                    spinner.find("input").val(newVal);
                                                    spinner.find("input").trigger("change");
                                                });

                                            });
    </script>
    <c:forEach items="${listComment}" var="cmt">
        <script>
            function myFunction${cmt.commentID}() {
                var x = document.getElementById("myDIV${cmt.commentID}");
                if (x.style.display === "none") {
                    x.style.display = "block";
                } else {
                    x.style.display = "none";
                }
            }
        </script>
    </c:forEach>

</body>
</html>
