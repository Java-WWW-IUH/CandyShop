<%-- 
   Document   : ContactManagement
   Created on : March 31, 2022
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
        <title>Liên hệ từ khách hàng</title>

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
            <div class="card">
                <div class="card-body">
                    <h1 style="margin:0; display: inline-block; color: #007bff"><i class="icon-list" style="color: #007bff"></i>  Danh sách liên hệ từ khách hàng</h1>
                    <br /><br/>
                    <table class="table table-hover">
                        <colgroup>
                            <col span="1" style="width: 150px">
                            <col span="1" style="width: 200px">
                            <col span="1" style="width: 100px">
                        </colgroup>
                        <thead>
                            <tr>
                                <th style="font-weight: bold;">Mã liên hệ</th>
                                <th style="font-weight: bold;">Tên khách hàng</th>
                                <th style="font-weight: bold;">Email khách hàng</th>
                                <th style="font-weight: bold;">Nội dung</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${list}" var="ct">
                                <tr class="onRow">
                                    <td>${ct.contactID}</td>
                                    <td>${ct.userContactName}</td>
                                    <td>${ct.contactEmail}</td>
                                    <td><div style="width: 50px; word-wrap: break-word">${ct.contactMessage}</div></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>  
                </div>
            </div>
        </div>
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
