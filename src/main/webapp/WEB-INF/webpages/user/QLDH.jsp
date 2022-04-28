<%@include file="header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
        <link rel="icon" href="<c:url value="/resources/Image/LoadLogo.png"/>">
        <script src="https://kit.fontawesome.com/041bd10679.js" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>

<body>
			<hr style="margin-top: -50px"/>
      
            <div class="container">
                <div style="padding-top: 30px;">
                <div class="row">
                    
                    <div class="col-md-11" style="background-color: whitesmoke;border-radius: 10px;"><h4>Thông Tin Đơn Hàng</h4>
                        <div class="row" style="padding: 10px;">
	                        <div class="col-md-5" style="font-weight: bold;">Mã Đơn Hàng:</div>
	                        <div class="col-md-6"  style="background-color: thistle;border-radius: 10px;">${orderDetail.orderDetailId}</div>
                        </div>
                        
                        <div class="row" style="padding: 10px;">
	                        <div class="col-md-5"  style="font-weight: bold;">Tên Khách Hàng:</div>
	                        <div class="col-md-6" style="background-color: thistle;border-radius: 10px;">${user.fullName}</div>
                        </div>
                        
                        <div class="row" style="padding: 10px;">
	                        <div class="col-md-5"  style="font-weight: bold;">Ngày Lập:</div>
	                        <div class="col-md-6"  style="background-color: thistle;border-radius: 10px;">${orderDetail.dateOrder}</div>
                        </div>
						
						<div class="row" style="padding: 10px;">
	                        <div class="col-md-5"  style="font-weight: bold;">Địa chỉ:</div>
	                        <div class="col-md-6"  style="background-color: thistle;border-radius: 10px;">${user.address}</div>
                        </div>
                  
                    </div>
                   
                </div>
                <div class="row" style="margin-top: 30px;">
                    <div class="col-md-8" style="background-color: whitesmoke;border-radius: 10px;"><h4>Danh Sách Sản Phẩm</h4>
                        <div class="row" style="padding: 10px;">
                       
                            <div class="col-md-3"  style="font-weight: bold;">Sản Phẩm</div>
                            <div class="col-md-3"  style="font-weight: bold;">Đơn giá</div>
                            <div class="col-md-3"  style="font-weight: bold;">Số Lượng</div>
                            <div class="col-md-3"  style="font-weight: bold;">Thành Tiền</div>
                        </div>
                        <div class="row" style="padding: 10px;">
                            <div class="col-md-3"><img  style="width: 80px;height: 50px;" src="${pageContext.request.contextPath}/image/${orderDetail.productID.img}"/></div>
                            
                            <div class="col-md-3">${orderDetail.productID.price}</div>
                            <div class="col-md-3">${orderDetail.quantity}</div>
                            <div class="col-md-3"><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${orderDetail.total}" /></div>
                        </div>
                       
                        
                    </div>
                    <div class="col-md-4">
                        
                            <div class="card" style="width: 18rem;border-radius: 10px;">
                               
                                <div class="card-body">
                                  <h4 class="card-title" style="color: red;">Tổng Tiền</h4>
                                
                                </div>
                                <ul class="list-group list-group-flush">
                                  <li class="list-group-item">
                                      <div class="row">
                                          <div class="col-md-8">
                                             <div>Tạm Tính</div>
                                          </div>
                                          <div class="col-md-4">
                                            <div><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${orderDetail.total}" /></div>
                                          </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-8">
                                               <div>Giảm Giá</div>
                                            </div>
                                            <div class="col-md-4">
                                              <div>0</div>
                                            </div>
                                          </div>
                                  
                                </li>
                                <li class="list-group-item">
                                    <div class="row">
                                        <div class="col-md-8"><h5>Thành Tiền</h5></div>
                                        <div class="col-md-4" style="font-weight: bold; color: red;"><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${orderDetail.total}" /></div>
                                    </div>
                                </li>
                            
                                </ul>                                                                	   
                                </div>
                                
                             		<a href="#" class="delete" data-toggle="modal" data-target="#myModalDelete">
                                    	<button type="button" class="btn btn-danger" style="margin-top: 20px; width: 290px;">Thanh Toán</button>
                              		</a>  
                        </div>
                    </div>
                  
                </div>
            </div>    
        </div>
      

		<div class="modal fade" id="myModalDelete">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content">
                        <form action="<c:url value="/payment/paid"/>" >
                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h4 class="modal-title">Bạn có chắc chắn muốn Thanh Toán!!!</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-danger" >Thanh Toán</button>
                                <input type="hidden" name="id" id="id" value="${orderDetail.orderDetailId}">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
   
</body>
<script src="<c:url value="/resources/vendors/js/vendor.bundle.base.js"/>"></script>
        <script src="<c:url value="/resources/vendors/chart.js/Chart.min.js"/>"></script>
        <script src="<c:url value="/resources/vendors/moment/moment.min.js"/>"></script>
        <script src="<c:url value="/resources/vendors/daterangepicker/daterangepicker.js"/>"></script>
        <script src="<c:url value="/resources/vendors/chartist/chartist.min.js"/>"></script>
        <script src="<c:url value="/resources/js/off-canvas.js"/>"></script>
        <script src="<c:url value="/resources/js/dashboard.js"/>"></script>
        <script src="<c:url value="/resources/js/misc.js"/>"></script>
</html>