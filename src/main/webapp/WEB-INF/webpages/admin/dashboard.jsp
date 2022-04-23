<%-- 
    Document   : dashboard
    Created on : May 20, 2021, 9:59:59 AM
    Author     : Tuan Khang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="header.jsp" %>
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

        <link rel="icon" href="<c:url value="/resources/images/LoadLogo.png"/>">
    </head>
    <body>
        <!-- partial -->
        <div class="main-panel">
            <div class="content-wrapper">
                <!-- Quick Action Toolbar Ends-->
                <div class="row">
                    <div class="col-md-12 grid-margin">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="d-sm-flex align-items-baseline report-summary-header">
                                            <h5 class="font-weight-semibold">Tóm tắc</h5>

                                        </div>
                                    </div>
                                </div>
                                <div class="row report-inner-cards-wrapper">
                                    <div class=" col-md -6 col-xl report-inner-card">
                                        <div class="inner-card-text">
                                            <span class="report-title">TỔNG SỐ KHÁCH HÀNG</span>
                                            <c:catch var="tuser">
                                                <h4>${tuser}</h4>
                                            </c:catch>


                                        </div>
                                        <div class="inner-card-icon bg-success">
                                            <i class="icon-people"></i>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-xl report-inner-card">
                                        <div class="inner-card-text">
                                            <span class="report-title">TỔNG SỐ ĐƠN HÀNG</span>
                                            <c:catch var="torder">
                                                <h4>${torder}</h4>
                                            </c:catch>
                                        </div>
                                        <div class="inner-card-icon bg-danger">
                                            <i class="icon-briefcase"></i>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-xl report-inner-card">
                                        <div class="inner-card-text">
                                            <span class="report-title">TỔNG SỐ SẢN PHẨM TRONG KHO</span>
                                            <c:catch var="tproduct">
                                                <h4>${tproduct}</h4>
                                            </c:catch>
                                        </div>
                                        <div class="inner-card-icon bg-warning">
                                            <i class="icon-camera"></i>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-xl report-inner-card">
                                        <div class="inner-card-text">
                                            <span class="report-title">TỔNG SỐ THƯƠNG HIỆU</span>
                                            <c:catch var="tbrand">
                                                <h4>${tbrand}</h4>
                                            </c:catch>

                                        </div>
                                        <div class="inner-card-icon bg-primary">
                                            <i class="icon-diamond"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-sm-flex align-items-center mb-4">
                                    <h4 class="card-title mb-sm-0">Các đơn hàng vừa được đặt</h4>
                                    <a href="#" class="text-dark ml-auto mb-3 mb-sm-0"> View all Products</a>
                                </div>
                                <div class="table-responsive border rounded p-1">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th class="font-weight-bold">Sản phẩm</th>
                                                <th class="font-weight-bold">Số lượng đặt hàng</th>
                                                <th class="font-weight-bold">Ngày đặt</th>
                                                <th class="font-weight-bold">Tổng tiền</th>
                                                <th class="font-weight-bold">Trạng thái</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${listOr}" var="o">
                                                <tr>
                                                    <td>
                                                        ${o.productID.productName}
                                                    </td>
                                                    <td>${o.quantity}</td>
                                                    <td>${o.dateOrder}</td>
                                                    <td><fmt:formatNumber type = "number" 
                                                                      maxFractionDigits = "3" value = "${o.total}"/> VND</td>
                                                    <td>
                                                        <div class="badge badge-success p-2">${o.statusOrderDetail}</div>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- content-wrapper ends -->
            <!-- partial:partials/_footer.html -->
            <footer class="footer">
                <div class="d-sm-flex justify-content-center justify-content-sm-between">
                    <span class="text-muted d-block text-center text-sm-left d-sm-inline-block">Copyright © 2021
                        K2ShopCam</span>
            </footer>
            <!-- partial -->
        </div>
        <!-- main-panel ends -->
        <script src="<c:url value="/resources/vendors/js/vendor.bundle.base.js"/>"></script>
        <script src="<c:url value="/resources/vendors/chart.js/Chart.min.js"/>"></script>
        <script src="<c:url value="/resources/vendors/moment/moment.min.js"/>"></script>
        <script src="<c:url value="/resources/vendors/daterangepicker/daterangepicker.js"/>"></script>
        <script src="<c:url value="/resources/vendors/chartist/chartist.min.js"/>"></script>
        <script src="<c:url value="/resources/js/off-canvas.js"/>"></script>
        <script src="<c:url value="/resources/js/dashboard.js"/>"></script>
        <script src="<c:url value="/resources/js/misc.js"/>"></script>
    </body>
</html>
