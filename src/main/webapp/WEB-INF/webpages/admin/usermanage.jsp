<%-- 
    Document   : usermanage
    Created on : May 31, 2021, 3:11:33 PM
    Author     : Hung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

            <div class="card">
                <div class="card-body">
                    <c:catch var="user">
                        <p>${user.username}</p>
                    </c:catch>
                    <h4 class="card-title">QUẢN LÝ KHÁCH HÀNG</h4>
                    <p class="card-description"><code>DANH SÁCH KHÁCH HÀNG </code> 
                    </p>
                    <div class="row">
                        
                        <div class="col-12" align="right">
                            <form method="get" action="<c:url value="/user/search"/>">
                               
                                    <div class="col-sm-5">
                                        <div class="form-group">
                                            <div class="input-group">
                                                <c:catch var="s">
                                                    <input type="text" value="${s}" name="name" class="form-control" placeholder="Nhập tên khách hàng cần tim " aria-label="Recipient's username" aria-describedby="basic-addon2">
                                                </c:catch>
                                                <div class="input-group-append">
                                                    <button class="btn btn-sm btn-primary" type="submit">Tìm</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </form>
                        </div>
                    </div>


                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>Mã KH</th>
                                <th>Email</th>
                                <th>Têm tài khoản</th>
                               
                                <th>Role</th>
                                
                                <th>Tên Đầy Đủ </th>
                                <th>Số Điện Thoại</th>
                               
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${list}" var="u">
                                <tr>
                                    <td>${u.userID}</td>
                                    <td>${u.email}</td>
                                    <td>${u.username}</td>
                                   
                                   
                                    <td>${u.role}</td>
                                    <td>${u.fullName}</td>
                                    <td>${u.phoneNumber}</td>
                                    
                                    <td><a href="#" class="delete" data-toggle="modal" data-target="#myModal"><i class="fas fa-trash" style="color: red" data-toggle
                                                                                                                 ="tooltip" title="Delete"></i></a>
                                       <input type="hidden" name="id" id="id" value="${u.userID}">
                                        
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    
                </div>
            </div>
            <div class="modal fade" id="myModal">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content">
                        <form action="<c:url value="/user/remove"/>">
                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h4 class="modal-title">Cảnh báo khách hàng này sẽ bị xóa !!!</h4>
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
        
        
        
        
        
        <script src="<c:url value="/resources/vendors/js/vendor.bundle.base.js"/>"></script>
        <script src="<c:url value="/resources/vendors/chart.js/Chart.min.js"/>"></script>
        <script src="<c:url value="/resources/vendors/moment/moment.min.js"/>"></script>
        <script src="<c:url value="/resources/vendors/daterangepicker/daterangepicker.js"/>"></script>
        <script src="<c:url value="/resources/vendors/chartist/chartist.min.js"/>"></script>
        <script src="<c:url value="/resources/js/off-canvas.js"/>"></script>
        <script src="<c:url value="/resources/js/dashboard.js"/>"></script>
        <script src="<c:url value="/resources/js/misc.js"/>"></script>
         <script type="text/javascript">
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip();
                $('table .delete').on('click', function () {
                    var id = $(this).parent().find("#id").val();
                    $('#myModal #id').val(id);
                });
            });
        </script>
    </body>
</html>
