<%-- 
    Document   : commentmanage
    Created on : March 31, 2022
    Author     : Tuan Khang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="header.jsp" %>
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
                    <h4 class="card-title">QUẢN LÝ BÌNH LUẬN</h4>
                    <p class="card-description"><code>DANH SÁCH BÌNH LUẬN</code> 
                    </p>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>Khách hàng bình luận</th>
                                <th>Sản phẩm</th>
                                <th>Ảnh sản phẩm</th>
                                <th>Nội dung bình luận</th>
                                <th>Đánh giá</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            
                            <c:forEach items="${list}" var="cmt">
                                <tr>
                                    <td>${cmt.userID.username}</td>
                                    <td>${cmt.productID.productName}</td>
                                    <td><img src="${pageContext.request.contextPath}/image/${cmt.productID.img}" style="border-radius: 0px;width: 150px;height: 80px"></td>
                                    <td>${cmt.commentContent}</td>
                                    <td>${cmt.vote}</td>
                                    <td><a href="#" class="delete" data-toggle="modal" data-target="#myModal"><i class="fas fa-trash" style="color: red" data-toggle
                                                                                                                 ="tooltip" title="Delete"></i></a>
                                        <input type="hidden" name="id" id="id" value="${cmt.commentID}">
                                        &nbsp;
                                        <a href="#" class="update" data-toggle="modal" data-target="#myModalUpdate"><i class="icon-bubble" style="color: blue" data-toggle
                                                                                                                       ="tooltip" title="Reply"></i></a>
                                        <input type="hidden" name="uname" id="uname" value="${cmt.userID.username}">
                                        <input type="hidden" name="pname" id="pname" value="${cmt.productID.productName}">
                                        <input type="hidden" name="uId" id="uId" value="${cmt.userID.userID}">
                                        <input type="hidden" name="pId" id="pId" value="${cmt.productID.productID}">
                                        <input type="hidden" name="cmtC" id="cmtC" value="${cmt.commentContent}">
                                        <input type="hidden" name="vote" id="vote" value="${cmt.vote}">
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
                        <form action="<c:url value="/comment/remove"/>" >
                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h4 class="modal-title">Cảnh báo bình luận này sẽ bị xóa !!!</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-danger" >Xóa</button>
                                <input type="text" name="id" id="id">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="myModalUpdate">
                <div class="modal-dialog modal-lg" style="width: 60%">
                    <div class="modal-content">
                        <form action="<c:url value="/comment/repadmin"/>" method="post" >
                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h4 class="modal-title">Chi tiết bình luận</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-6" style="padding-top: 8px">
                                        <div class="row">
                                            <div class="col-3" style="padding-top: 8px">
                                                Khách hàng
                                            </div>
                                            <div class="col-9">
                                                <input type="text" readonly="" style="font-size: 16px" class="form-control" name="uname" id="uname">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-6"  style="padding-top: 8px">
                                        <div class="row">
                                            <div class="col-3" style="padding-top: 8px">
                                                Sản phẩm
                                            </div>
                                            <div class="col-9">
                                                <input type="text" readonly="" style="font-size: 16px" class="form-control" name="pname" id="pname">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-6" style="padding-top: 8px">
                                        <div class="row">
                                            <div class="col-3" style="padding-top: 8px">
                                                Lượt đánh giá
                                            </div>
                                            <div class="col-9">
                                                <input type="text" readonly="" style="font-size: 16px" class="form-control" name="vote" id="vote">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-6" style="padding-top: 8px">
                                        <div class="row">
                                            <div class="col-3" style="padding-top: 8px">
                                                Nội dung bình luận
                                            </div>
                                            <div class="col-9">
                                                <textarea name="cmtC" id="cmtC" readonly="" class="form-control" rows="5"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12" style="margin-top: 10px;padding-bottom: 10px; border-top: 1px solid #DFE5E2">
                                        <div class="form-group">
                                            <br>
                                            <label for="email">Nhập câu trả lời</label>
                                            <textarea class="form-control" rows="5" name="rep"></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-success" >Trả lời bình luận</button>
                                <input type="hidden" name="id" id="id">
                                <input type="hidden" name="uId" id="uId">
                                <input type="hidden" name="pId" id="pId">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
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
        <script type="text/javascript">
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip();
                $('table .delete').on('click', function () {
                    var id = $(this).parent().find("#id").val();
                    $('#myModal #id').val(id);
                });
            });
        </script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip();
                $('table .update').on('click', function () {
                    var id = $(this).parent().find("#id").val();
                    $('#myModalUpdate #id').val(id);
                    var uname = $(this).parent().find("#uname").val();
                    $('#myModalUpdate #uname').val(uname);
                    var pname = $(this).parent().find("#pname").val();
                    $('#myModalUpdate #pname').val(pname);
                    var uId = $(this).parent().find("#uId").val();
                    $('#myModalUpdate #uId').val(uId);
                    var pId = $(this).parent().find("#pId").val();
                    $('#myModalUpdate #pId').val(pId);
                    var cmtC = $(this).parent().find("#cmtC").val();
                    $('#myModalUpdate #cmtC').val(cmtC);
                    var vote = $(this).parent().find("#vote").val();
                    $('#myModalUpdate #vote').val(vote);
                });
            });
        </script>
    </body>
</html>
