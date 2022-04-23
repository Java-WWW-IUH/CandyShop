<%-- 
    Document   : userform
    Created on : May 31, 2021, 3:36:50 PM
    Author     : Hung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
            <div class="col-12 grid-margin">
                <c:catch var="userShop" >
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Lưu thông tin khách hàng</h4>
                            <form class="form-sample" autocomplete="off" action="<c:url value="/user/save"/>" enctype="multipart/form-data" method="post">
                                <p class="card-description"> Thông tin khách hàng </p>
                                <div class="row">
                                    <input type="hidden" class="form-control" value="${userShop.userID}" name="id" placeholder="Nhập tên khách hàng" />
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Tên khách hàng</label>
                                            <div class="col-sm-9">
                                                <input type="text" required="" class="form-control" value="${userShop.fullName}" name="fullname" placeholder="Nhập tên khách hàng" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Tên đăng nhập</label>
                                            <div class="col-sm-9">
                                                <input type="text" required="" class="form-control" value="${userShop.username}" name="userName" placeholder="Nhập tài khoản" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Địa chỉ</label>
                                            <div class="col-sm-9">
                                                <input type="text" required class="form-control"  value="${userShop.address}" name="address" placeholder="Nhập địa chỉ"/>
                                            </div>
                                        </div>
                                    </div>
                                            
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Số điện thoại</label>
                                            <div class="col-sm-9">
                                                <input type="text" required="" class="form-control" value="${userShop.phoneNumber}" name="phone" placeholder="Nhập số điện thoại"/>
                                            </div>
                                        </div>
                                    </div>        
                                </div>
                                <div class="row">
                                   
                                    
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Email</label>
                                            <div class="col-sm-9">
                                                <input type="email" required="" class="form-control" value="${userShop.email}" name="email" placeholder="Nhập email"/>
                                            </div>
                                        </div>
                                    </div>        
                                </div>
                             
                
                                    <div class="col-md-6">
                                      <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Hình Ảnh</label>
                                            <div class="col-sm-9">
                                                <c:catch var="r">
                                                    <input type="file" class="form-control" ${r} value="${pageContext.request.contextPath}/imguser/${userShop.img}" name="image" />
                                                </c:catch>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                               
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label"></label>
                                            <div class="col-sm-9">
                                                <button type="submit" class="btn btn-success mr-2">Lưu</button>
                                                <button class="btn btn-danger" type="reset">Hủy</button>
                                            </div>
                                        </div>
                                    </div>
                                </div> 
                        </div>
                        </form>
                    </div>
                </div>
            </c:catch>
        </div>
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
<script>
    $(document).ready(function () {
        $('.toast').toast('show');
    });
</script>
</body>
</html>
