<%-- 
    Document   : orderList
    Created on : March 30, 2022
    Author     : Thanh Hoai
--%>

<%@include file="header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
        <script src="https://kit.fontawesome.com/041bd10679.js" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    </head>
    <body>
        
        <br /><br />
        <div class="container">
            <h2>Đơn hàng của tôi</h2>
            <br />     
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
                    <c:forEach items="${list}" var="od">
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
                        <form action="<c:url value="/orderList/remove"/>" >
                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h4 class="modal-title">Đơn hàng này sẽ bị xóa!!!</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-danger" >Xóa</button>
                                <input type="hidden" name="id" id="id">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
    
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

        <!-- main-panel ends -->

        <script src="<c:url value="/resources/vendors/js/vendor.bundle.base.js"/>"></script>
        <script src="<c:url value="/resources/vendors/chart.js/Chart.min.js"/>"></script>
        <script src="<c:url value="/resources/vendors/moment/moment.min.js"/>"></script>
        <script src="<c:url value="/resources/vendors/daterangepicker/daterangepicker.js"/>"></script>
        <script src="<c:url value="/resources/vendors/chartist/chartist.min.js"/>"></script>
        <script src="<c:url value="/resources/js/off-canvas.js"/>"></script>
        <script src="<c:url value="/resources/js/dashboard.js"/>"></script>
        <script src="<c:url value="/resources/js/misc.js"/>"></script>
</html>
