<%-- 
    Document   : Header
    Created on : March 20, 2022
    Author     : Tuan Khang
--%>

<%@page import="sv.iuh.project.model.UserShop"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Admin</title>
        <link rel="stylesheet" href="<c:url value="/resources/admin/css/style.css"/>" rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="<c:url value="/resources/vendors/simple-line-icons/css/simple-line-icons.css"/>" rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="<c:url value="/resources/vendors/css/vendor.bundle.base.css"/>" rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="<c:url value="/resources/vendors/flag-icon-css/css/flag-icon.min.css"/>" rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="<c:url value="/resources/vendors/daterangepicker/daterangepicker.css"/>" rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="<c:url value="/resources/vendors/chartist/chartist.min.css"/>" rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
        <link rel="icon" href="<c:url value="/resources/images/LoadLogo.png"/>">
        <script src="https://kit.fontawesome.com/041bd10679.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <!-- partial:partials/_navbar.html -->
        <nav class="navbar default-layout-navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
            <div class="navbar-brand-wrapper d-flex align-items-center">
                <a class="navbar-brand brand-logo" href="<c:url value="/admin"/>">
                    <h3 style="color: white;">CandyShop</h3>

                </a>
                <a class="navbar-brand brand-logo-mini" href="index.html"><img src="<c:url value="/resources/images/K2NCamShop.png"/>" alt="logo" /></a>
            </div>
            <div class="navbar-menu-wrapper d-flex align-items-center flex-grow-1">
                <h5 class="mb-0 font-weight-medium d-none d-lg-flex">Ch??o m???ng b???n ?????n v???i trang qu???n l?? c???a ch??ng t??i</h5>
                <ul class="navbar-nav navbar-nav-right ml-auto">
                    <%
                        UserShop userShop1 = (UserShop) session.getAttribute("userlogin");
                    %>

                    <c:set var = "usershop" scope = "session" value = "<%=userShop1%>"/>
                    <c:catch var="usershop">
                    <li class="nav-item dropdown d-none d-xl-inline-flex user-dropdown">
                        <a class="nav-link dropdown-toggle" id="UserDropdown" href="#" data-toggle="dropdown" aria-expanded="false">
                            <img class="img-xs rounded-circle ml-2" src="<c:url value="/resources/images/faces/face8.jpg"/>" alt="Profile image"> <span
                                class="font-weight-normal"> ${usershop.fullName} </span></a>
                        <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="UserDropdown">
                            <div class="dropdown-header text-center">
                                <img class="img-md rounded-circle" src="<c:url value="/resources/images/faces/face8.jpg"/>" alt="Profile image">
                                <p class="mb-1 mt-3">${usershop.fullName}</p>
                                <p class="font-weight-light text-muted mb-0">${usershop.email}</p>
                            </div>
                            <a class="dropdown-item" href="<c:url value="/"/>"><i class="dropdown-item-icon icon-energy text-primary"></i> Quay v??? trang ch??nh</a>
                            <a class="dropdown-item" href="<c:url value="/login/logout"/>"><i class="dropdown-item-icon icon-power text-primary"></i>????ng xu???t</a>
                        </div>
                    </li>
                    
                </ul>
                <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button"
                        data-toggle="offcanvas">
                    <span class="icon-menu"></span>
                </button>
            </div>
        </nav>
        <!-- partial -->
        <div class="container-fluid page-body-wrapper">
            <!-- partial:partials/_sidebar.html -->
            <nav class="sidebar sidebar-offcanvas" id="sidebar">
                <ul class="nav">
                    <li class="nav-item nav-profile">
                        <a href="#" class="nav-link">
                            <div class="profile-image">
                                <img class="img-xs rounded-circle" src="<c:url value="/resources/images/faces/face8.jpg"/>" alt="profile image">
                                <div class="dot-indicator bg-success"></div>
                            </div>
                            <div class="text-wrapper">
                                <p class="profile-name">${usershop.fullName}</p>
                                <p class="designation">${usershop.role}</p>
                            </div>
                            <div class="icon-container">
                                <i class="icon-bubbles"></i>
                                <div class="dot-indicator bg-danger"></div>
                            </div>
                        </a>
                    </li>
                    </c:catch>
                    <li class="nav-item nav-category">
                        <span class="nav-link">Dashboard</span>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/admin"/>">
                            <span class="menu-title">Dashboard</span>
                            <i class="icon-screen-desktop menu-icon"></i>
                        </a>
                    </li>
                    <li class="nav-item nav-category">
                        <span class="nav-link">Qu???n l??</span>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/product/show"/>">
                            <span class="menu-title">Qu???n l?? s???n ph???m</span>
                            <i class="icon-camera menu-icon"></i>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/orderManagement/show"/>">
                            <span class="menu-title">Qu???n l?? ????n h??ng</span>
                            <i class="icon-basket-loaded menu-icon"></i>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/user/show"/>">
                            <span class="menu-title">Qu???n l?? kh??ch h??ng</span>
                            <i class="icon-people menu-icon"></i>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/productcategory/show"/>">
                            <span class="menu-title">Qu???n l?? lo???i s???n ph???m</span>
                            <i class="icon-list menu-icon"></i>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/productbrand/show"/>">
                            <span class="menu-title">Qu???n l?? th????ng hi???u</span>
                            <i class="icon-grid menu-icon"></i>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/comment/show"/>">
                            <span class="menu-title">Qu???n l?? b??nh lu???n</span>
                            <i class="icon-bubbles menu-icon"></i>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/contact/managementShow" />">
                            <span class="menu-title">Li??n h??? t??? kh??ch h??ng</span>
                            <i class="icon-phone menu-icon"></i>
                        </a>
                    </li>

                </ul>
            </nav>
    </body>
</html>
