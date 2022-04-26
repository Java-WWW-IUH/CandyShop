<%-- 
    Document   : header
    Created on : March 20, 2022
    Author     : Tuan Khang
--%>

<%@page import="java.util.List"%>
<%@page import="sv.iuh.project.model.OrderDetail"%>
<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@page import="sv.iuh.project.model.UserShop"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .dropdown-content {
                display: none;
                position: absolute;
                background-color: #f9f9f9;
                min-width: 300px;
                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
                padding: 12px 16px;
                z-index: 1;
            }

            .dropdown:hover .dropdown-content {
                display: block;
            }

            #dropdown:hover > .dropdown-menu{
                display: block;
            }

            #dropdown .dropdown-menu{
                margin-top: -5px; 
                padding: 0px 10px 10px 10px; 
                font-size: 16px;
            }

            #dropdown .dropdown-menu  > li > a{
                color: black;
            }

            #dropdown .dropdown-menu  > li{
                margin-top: 10px;
            }

            #dropdown .dropdown-menu  > li:hover{
                background-color: lightgray;
            }

        </style>
    </head>
    <body>
        <header >
            <div class="row">
                <div class="col-1"></div>
                <div class="col-2"><img src="<c:url value="/resources/Image/LOGOSHOP.jpg"/>" style="width: 40%" /></div>

                <div class="col-9" align="right" style="margin-top: 5vh;"></div>
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
                        <a class="nav-link" href="<c:url value="/"/>">Trang chủ <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link " href="<c:url value="/product/productpage"/>">
                            Các sản phẩm
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/about"/>">Giới thiệu về chúng tôi</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/contact/show" />">Liên hệ</a>
                    </li>
                </ul>
                <ul class="navbar-nav" style="padding-right: 7vw;">
                    <li class="dropdown" style="position: relative; display: inline-block;">
                        <div class="cart">
                            <a class="nav-link" href="<c:url value="/cart/show"/>"><i class="fas fa-shopping-cart" style="color: white"> <span id="cart_count" style="color: red"><c:out value="${sessionScope.myCartNum}"/></span></i></a>

                        </div>
                        <div class="dropdown-content">
                            <ul class="sub-icon1 list" style="margin-left: -30px">
                                <h5>Giỏ hàng (<c:out value="${sessionScope.myCartNum}"/>)</h5>
                                <div class="shopping_cart">
                                    <c:forEach var="map" items="${sessionScope.myCartItems}">
                                        <div class="container" style="background-color:#f5f5f5; padding:10px 5px 10px 15px;">
                                            <div class="row">

                                                <div class="col-lg-2">
                                                    <img src="${pageContext.request.contextPath}/image/${map.value.product.img}" style="width: 40px; height: 50px;"/>
                                                </div>
                                                <div class="col-lg-10">
                                                    <a href="<c:url value="/product/detail?id=${map.value.product.productID}"/>" style="color:black; "><c:out value="${map.value.product.productName}"/></a>
                                                    </br>
                                                    <b><c:out value="${map.value.quantity}" /> x <c:out value="${map.value.product.price}" /></b>
                                                    <div class="row" style="margin-right: -60px;">
                                                        <div class="col-lg-3">
                                                            <span style="color:blue; font-size: 14px"><a href="${pageContext.request.contextPath}/cart/remove/${map.value.product.productID}.html">Xóa</a></span>

                                                        </div>
                                                        <div class="col-lg-9">
                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    <p style="color:red; font-weight:bold; margin-bottom: -5px;"><c:out value="${map.value.product.price}" /> VND</p>

                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>

                                            </div>
                                        </div>
                                        <br/>
                                    </c:forEach>
                                </div>
                                <hr />
                                <p>
                                    <span style="color:#6d6767">Thành Tiền</span>
                                    <span style="float:right; color:red; font-weight:bold; font-size: 16px"><fmt:formatNumber type = "number" maxFractionDigits = "3" value ="${sessionScope.myCartTotal + (sessionScope.myCartTotal * 0.1)}" /> VNĐ</span>
                                    <br />
                                    <i style="float: right; color:#2c2929; font-size: 10px">(Đã bao gồm thuế VAT nếu có)</i>
                                </p>


                                <div class="clearfix"></div>

                            </ul>
                        </div>
                    </li>
                    <%
                        UserShop userShop = (UserShop) session.getAttribute("userlogin");
                    %>

                    <c:set var = "usershop" scope = "session" value = "<%=userShop%>"/>
                    <c:if test="${usershop!=null}">
                        <c:catch var="userShop">
                            <li class="nav-item">
                                <div class="dropdown" id="dropdown">
                                    <a class="nav-link" href="#" data-toggle="dropdown"><%=userShop.getFullName()%></a>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="<c:url value="/orderList/show" />" style="text-decoration: none"><i class="fas fa-shopping-bag"></i> Đơn hàng của tôi</a></li>
                                            <c:if test="${usershop.role=='admin'}">
                                            <li><a class="dropdown-item" href="<c:url value="/admin"/>" style="text-decoration: none;"><i class="fas fa-tasks"></i> Đến trang quản lý</a></li>
                                            </c:if>
                                         <li><a class="dropdown-item" href="<c:url value="/user/showformuserupdate"/>" style="text-decoration: none;"><i class="fas fa-user-edit"></i> Xem thông tin cá nhân</a></li>   
                                        <li><a class="dropdown-item" href="<c:url value="/login/logout"/>" style="text-decoration: none;"><i class="fas fa-sign-out-alt"></i> Đăng xuất</a></li>
                                    </ul>
                                </div>
                            </li>
                        </c:catch>
                    </c:if>
                    <c:if test="${usershop==null}">
                        <li class="nav-item">
                            <a class="nav-link" href="<c:url value="/login"/>">Đăng nhập</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="<c:url value="/register"/>">Đăng kí</a>
                        </li>
                    </c:if>
                </ul>
            </div>
        </nav>
    </body>

    <script>
        var count = document.getElementById("cart_count").innerHTML;
        if (count == 0) {
            document.getElementById("cart_count").style.display = 'none';
        } else {
            document.getElementById("cart_count").style.display = 'inline-block';

        }
    </script>
</html>
