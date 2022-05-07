<%-- 
    Document   : productbrandform
    Created on : March 20, 2022
    Author     : Van Toan
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
        <link rel="icon" href="<c:url value="/resources/Image/LOGOSHOP.jpg"/>">
    </head>

    <body>
        <!-- partial -->
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
            <div class="card">
                <div class="card-body">

                    <h4 class="card-title">Nhập thông tin thương hiệu</h4>
                    <c:catch var="err">
                        <c:if test="${err!=null}">
                            <div class="alert alert-danger">
                                <strong>Cảnh báo!</strong> ${err}
                            </div>
                        </c:if>
                    </c:catch>

                    <form method="Post" class="forms-sample" action="<c:url value="/productbrand/save"/>" enctype="multipart/form-data">
                        <c:catch var="productBrand">
                            <input type="text" class="form-control" hidden="true" value="${productBrand.productBrandID}" id="exampleInputUsername1" name="id" placeholder="Nhập tên thương hiệu">
                            <div class="form-group">
                                <label for="exampleInputUsername1">Tên Thương hiệu</label>
                                <input type="text"  pattern="^[a-zA-Z_ÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ]+$"
        title="Tên thương hiệu không chứ kí tự đặc biệt" required="" class="form-control" id="exampleInputUsername1" value="${productBrand.productBrandName}" name="name" placeholder="Nhập tên thương hiệu">
                            </div>

                            <div class="form-group">
                                <label for="exampleInputConfirmPassword1">Quốc Gia</label>
                                <select class="form-control" required name="nation">
                                    <c:forEach items="${list}" var="n">
                                        <option value="${n.nicename}" >${n.nicename}</option>
                                        <c:if test="${productBrand!=null}">
                                            <option value="${productBrand.nationalProduction}" hidden="true" selected="true">${productBrand.nationalProduction}</option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputConfirmPassword1">Logo</label>
                                <input type="file" required="" class="form-control" value="${product.img}" accept=".png, .jpg, .jpeg" name="image">
                            </div>

                            <input type="hidden" value="${productBrand.img}" name="imgUp"/>

                            <button type="submit" class="btn btn-primary mr-2">Lưu</button>
                            <button class="btn btn-light" type="reset">Hủy</button>
                        </c:catch>
                    </form>
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
        <script>
            $(document).ready(function () {
                $('.toast').toast('show');
            });
        </script>
    </body>
</html>
