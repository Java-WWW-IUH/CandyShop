<%-- 
    Document   : index
    Created on : March 17, 2022
    Author     : Tuan Khang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <li><a href="${pageContext.request.contextPath}/shop.html">Shop</a>
        <ul class="drop">
            <c:forEach var="item" items="${listCategory}">
                <li>>${item.productBrandName}</a></li>
            </c:forEach>
        </ul>
    </li>
</body>
</html>
