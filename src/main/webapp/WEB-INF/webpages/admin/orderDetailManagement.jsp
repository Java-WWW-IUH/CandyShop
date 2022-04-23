<%-- 
    Document   : orderDetailManagement
    Created on : May 30, 2021, 5:28:53 PM
    Author     : Thanh Hoai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Order Detail Management</title>

        <link rel="stylesheet" href="<c:url value="/resources/admin/css/style.css"/>" rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="<c:url value="/resources/vendors/simple-line-icons/css/simple-line-icons.css"/>" rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="<c:url value="/resources/vendors/css/vendor.bundle.base.css"/>" rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="<c:url value="/resources/vendors/flag-icon-css/css/flag-icon.min.css"/>" rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="<c:url value="/resources/vendors/daterangepicker/daterangepicker.css"/>" rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="<c:url value="/resources/vendors/chartist/chartist.min.css"/>" rel='stylesheet' type='text/css'>
        <link rel="icon" href="<c:url value="/resources/images/LoadLogo.png"/>">
        <link rel="stylesheet" href="<c:url value="/resources/Css/orderManagement.css"/>" rel='stylesheet' type='text/css'>

    </head>
    <body>
        <div class="main-panel">
            <div class="card">
                <div class="card-body">
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

                        <h1 style="margin:0; display: inline-block; color: #007bff">Chi tiết đơn hàng</h1>
                        <br /><br/>
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th style="font-weight: bold;">Mã đơn hàng</th>
                                    <th style="font-weight: bold;">Ngày mua</th>
                                    <th style="font-weight: bold;">Sản phẩm</th>
                                    <th style="font-weight: bold;">Số lượng</th>
                                    <th style="font-weight: bold;">Giá</th>
                                    <th style="font-weight: bold;">Tổng tiền</th>
                                    <th style="font-weight: bold;">Trạng thái</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${listDetail}" var="od">
                                    <tr class="onRow">
                                        <td>${od.orderDetailId}</td>
                                        <td>${od.dateOrder}</td>
                                        <td><a href="<c:url value="/product/detail?id=${od.productID.productID}" />" style="text-decoration: none">${od.productID.productName}</a></td>
                                        <td>${od.quantity}</td>
                                        <td>${od.productID.price}</td>
                                        <td><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${od.total}" /></td>
                                        <td>${od.statusOrderDetail}</td>
                                        <td>
                                            <a href="#" class="delete" data-toggle="modal" data-target="#myModalDelete">
                                                <i class="fas fa-trash" style="color: red" data-toggle="tooltip" title="Delete"></i>
                                            </a>       

                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>

                        <div class="modal fade" id="myModalDelete">
                            <div class="modal-dialog modal-sm">
                                <div class="modal-content">
                                    <form action="<c:url value="/orderDetailManagement/remove"/>" >
                                        <!-- Modal Header -->
                                        <div class="modal-header">
                                            <h4 class="modal-title">Đơn hàng này sẽ bị xóa!!!</h4>
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="submit" class="btn btn-danger" >Xóa</button>
                                            <input type="hidden" name="id" id="id">
                                            <input type="hidden" name="orderID" value="${sessionScope.OrderID}" >
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
            <script type="text/javascript">
                $(function () {
                    $('.table tr').mouseover(function (e) {
                        var id = $(this).closest('.onRow').find('td:nth-child(1)').text();
                        $('.fas').click(function (e) {
                            $('#id').val(id);
                        });

                    });
                });
            </script>
            
            <script>
                $(document).ready(function () {
                    $('.toast').toast('show');
                });
            </script>

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
