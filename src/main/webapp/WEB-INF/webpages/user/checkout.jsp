<%-- 
    Document   : checkout
    Created on : March 25, 2022
    Author     : Thanh Hoai
--%>

<%@include file="header.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@page import="sv.iuh.project.model.UserShop"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Thanh toán</title>
<link href="<c:url value="/resources/Css/Header.css"/>" rel='stylesheet'
	type='text/css' />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="path/to/font-awesome/css/font-awesome.min.css">
<link href="<c:url value="/resources/Css/Header.css"/>" rel='stylesheet'
	type='text/css' />
<link href="<c:url value="/resources/Css/body.css"/>" rel='stylesheet'
	type='text/css' />
<link rel="icon" href="<c:url value="/resources/Image/LoadLogo.png"/>">
<script src="https://kit.fontawesome.com/041bd10679.js"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
li {
	color: red;
}

.cart_product_inner button {
	width: 20%;
	margin-left: auto;
	margin-right: auto;
	display: block;
}

.cart_product_inner img {
	width: 80px;
	height: 80px;
}

#empty img, #empty button {
	width: 20%;
	margin-left: auto;
	margin-right: auto;
	display: block;
}
</style>
</head>
<body>
	</br>
	</br>
	<div class="container">
		<form method="Post" action="<c:url value="/cart/orderItems.html"/>">
			<div class="row" id="cart">
				<div class="col-lg-7" id="cartlist"
					style="border: 1px solid lightgray; padding: 10px 20px 10px 20px;">
					<h5>Danh sách sản phẩm</h5>
					<div class="cart_product_inner">
						<c:forEach var="map" items="${sessionScope.myCartItems}">
							<div class="container"
								style="border: 1px solid LightGray; padding: 10px 5px 10px 15px;">
								<div class="row">

									<div class="col-lg-3">
										<img
											src="${pageContext.request.contextPath}/image/${map.value.product.img}" />
									</div>
									<div class="col-lg-8">
										<a
											href="<c:url value="/product/detail?id=${map.value.product.productID}"/>"
											style="color: black;"><c:out
												value="${map.value.product.productName}" /></a> <br /> <br />
										<div class="row" style="margin-right: -60px;">
											<p style="color: red; font-weight: bold; margin-left: 20px">
												<c:out value="${map.value.quantity}" />
												x
												<c:out value="${map.value.product.price}" />
												=
												<c:out value="${map.value.product.price}" />
												VND
											</p>
										</div>
									</div>
								</div>
							</div>
							</br>
						</c:forEach>
						<hr />
						<p>
							<span style="color: #6d6767">Tạm tính</span> <span
								style="float: right; color: black; font-weight: bold"><fmt:formatNumber
									type="number" maxFractionDigits="3"
									value="${sessionScope.myCartTotal}" /> VNĐ</span>
						</p>
						<hr />
						<p>
							<span style="color: #6d6767">Thành Tiền</span> <span
								style="float: right; color: red; font-weight: bold; font-size: 22px"><fmt:formatNumber
									type="number" maxFractionDigits="3"
									value="${sessionScope.myCartTotal + (sessionScope.myCartTotal * 0.1)}" />
								VNĐ </span> <br /> <i
								style="float: right; color: #2c2929; font-size: 13px; margin-right: -150px;">(Đã
								bao gồm thuế VAT nếu có)</i>
						</p>
					</div>
				</div>
				<div class="col-lg-4" style="margin-left: 30px;" id="cartlist">
					<div class="row"
						style="border: 1px solid LightGray; padding: 10px 10px 10px 10px">
						<div class="col-lg-12">
							<h5 style="float: left">Thông tin khách hàng</h5>
							<button type="button" data-toggle="modal" data-target="#myModal"
								style="float: right; border: 1px solid LightGray;">Sửa</button>
							<br />
							<hr />
							<c:catch var="user">
								<b>${user.fullName}</b>
								<br />
								<p>${user.address}</p>
								<p>Điện thoại: ${user.phoneNumber}</p>
							</c:catch>
						</div>
					</div>
					<br />
					<div class="row">
						<button type="submit" class="btn btn-danger btn-block"
							style="font-size: 25px">ĐẶT MUA</button>
						<p>(Xin vui lòng kiểm tra đơn hàng trước khi đặt mua)</p>
					</div>
				</div>
			</div>
		</form>
	</div>

	<!-- The Modal -->
	<div class="modal fade" id="myModal">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Thông tin khách hàng</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<form action=<c:url value="/cart/SaveUser"/> method="POST"
						class="needs-validation" novalidate>
						<c:catch var="user">
							<div class="form-group">
								<label for="uname">Họ tên:</label> <input type="text"
									value="${user.fullName}" class="form-control" id="uname"
									placeholder="Nhập họ tên" name="uname" required>
								<div class="valid-feedback">Valid.</div>
								<div class="invalid-feedback">Please fill out this field.</div>
							</div>
							<div class="form-group">
								<label for="utel">Số điện thoại:</label> <input type="tel"
									class="form-control" value="${user.phoneNumber}" id="utel"
									placeholder="Nhập số điện thoại" name="utel" required>
								<div class="valid-feedback">Valid.</div>
								<div class="invalid-feedback">Please fill out this field.</div>
							</div>
							<div class="form-group">
								<label for="calc_shipping_provinces">Tỉnh/Thành phố:</label> <select
									class="form-control" name="calc_shipping_provinces" required=""
									id="calc_shipping_provinces">
									<option value="tinh">Tỉnh / Thành phố</option>
								</select>
							</div>
							<div class="form-group">
								<label for="calc_shipping_district">Quận/Huyện:</label> <select
									class="form-control" id="calc_shipping_district"
									name="calc_shipping_district">
								</select>
							</div>
							<div class="form-group">
								<label for="ward">Phường:</label> <select class="form-control"
									id="ward" name="ward">
									<option>Phường 1</option>
									<option>Phường 2</option>
									<option>Phường 3</option>
									<option>Phường 4</option>
									<option>Phường 5</option>
									<option>Phường 6</option>
									<option>Phường 7</option>
									<option>Phường 8</option>
								</select>
							</div>
							<div class="form-group">
								<label for="uaddress">Địa chỉ:</label> <input type="text"
									class="form-control" id="uaddress" placeholder="Nhập địa chỉ"
									name="uaddress" required>
								<div class="valid-feedback">Valid.</div>
								<div class="invalid-feedback">Please fill out this field.</div>
							</div>
							<button type="submit" class="btn btn-primary">Cập nhật</button>
						</c:catch>
					</form>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Hủy</button>
				</div>

			</div>
		</div>
	</div>
	<br />
	<br />
	<br />
	<footer
		style="background-color: black; color: white; height: 200px; padding-left: 50px;">
		<div class="row">
			<div class="col-9">
				<h4 style="padding-top: 20px;padding-bottom: 20px;">CỬA HÀNG BÁNH KẸO CANDYSHOP</h4>
                <p class="pFooter">Địa chỉ: số 12 Nguyễn Văn Bảo, Phường 4, Quận Gò Vấp, TP Hồ Chí Minh</p>
                <p class="pFooter">Điện thoại: 0819490540 - Email: CandyShop@gmail.vn </p>
                <p class="pFooter">&copy Copyright 2022</p>
			</div>
			<div class="col-3" style="padding-top: 20px;">
				<a href=""><img src="<c:url value="/resources/Image/Logo/fb.png"/>" style="width: 10%;"></a>
                    <a href=""><img src="<c:url value="/resources/Image/Logo/yt.png"/>" style="width: 10%;"></a>
                    <a href=""><img src="<c:url value="/resources/Image/Logo/ins.png"/>" style="width: 10%;"></a>
			</div>
		</div>
	</footer>
</body>
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js'></script>
<script src="https://kit.fontawesome.com/041bd10679.js"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script
	src='https://cdn.jsdelivr.net/gh/vietblogdao/js/districts.min.js'></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src='https://cdn.jsdelivr.net/gh/vietblogdao/js/districts.min.js'></script>
<script>
	//<![CDATA[
	if (address_2 = localStorage.getItem('address_2_saved')) {
		$('select[name="calc_shipping_district"] option').each(function() {
			if ($(this).text() == address_2) {
				$(this).attr('selected', '')
			}
		})
		$('input.billing_address_2').attr('value', address_2)
	}
	if (district = localStorage.getItem('district')) {
		$('select[name="calc_shipping_district"]').html(district)
		$('select[name="calc_shipping_district"]').on(
				'change',
				function() {
					var target = $(this).children('option:selected')
					target.attr('selected', '')
					$('select[name="calc_shipping_district"] option').not(
							target).removeAttr('selected')
					address_2 = target.text()
					$('input.billing_address_2').attr('value', address_2)
					district = $('select[name="calc_shipping_district"]')
							.html()
					localStorage.setItem('district', district)
					localStorage.setItem('address_2_saved', address_2)
				})
	}
	$('select[name="calc_shipping_provinces"]')
			.each(
					function() {
						var $this = $(this), stc = ''
						c
								.forEach(function(i, e) {
									e += +1
									stc += '<option value=' + e + '>' + i
											+ '</option>'
									$this
											.html('<option value="">Tỉnh / Thành phố</option>'
													+ stc)
									if (address_1 = localStorage
											.getItem('address_1_saved')) {
										$(
												'select[name="calc_shipping_provinces"] option')
												.each(
														function() {
															if ($(this).text() == address_1) {
																$(this)
																		.attr(
																				'selected',
																				'')
															}
														})
										$('input.billing_address_1').attr(
												'value', address_1)
									}
									$this
											.on(
													'change',
													function(i) {
														i = $this
																.children(
																		'option:selected')
																.index() - 1
														var str = '', r = $this
																.val()
														if (r != '') {
															arr[i]
																	.forEach(function(
																			el) {
																		str += '<option value="' + el + '">'
																				+ el
																				+ '</option>'
																		$(
																				'select[name="calc_shipping_district"]')
																				.html(
																						'<option value="">Quận / Huyện</option>'
																								+ str)
																	})
															var address_1 = $this
																	.children(
																			'option:selected')
																	.text()
															var district = $(
																	'select[name="calc_shipping_district"]')
																	.html()
															localStorage
																	.setItem(
																			'address_1_saved',
																			address_1)
															localStorage
																	.setItem(
																			'district',
																			district)
															$(
																	'select[name="calc_shipping_district"]')
																	.on(
																			'change',
																			function() {
																				var target = $(
																						this)
																						.children(
																								'option:selected')
																				target
																						.attr(
																								'selected',
																								'')
																				$(
																						'select[name="calc_shipping_district"] option')
																						.not(
																								target)
																						.removeAttr(
																								'selected')
																				var address_2 = target
																						.text()
																				$(
																						'input.billing_address_2')
																						.attr(
																								'value',
																								address_2)
																				district = $(
																						'select[name="calc_shipping_district"]')
																						.html()
																				localStorage
																						.setItem(
																								'district',
																								district)
																				localStorage
																						.setItem(
																								'address_2_saved',
																								address_2)
																			})
														} else {
															$(
																	'select[name="calc_shipping_district"]')
																	.html(
																			'<option value="">Quận / Huyện</option>')
															district = $(
																	'select[name="calc_shipping_district"]')
																	.html()
															localStorage
																	.setItem(
																			'district',
																			district)
															localStorage
																	.removeItem(
																			'address_1_saved',
																			address_1)
														}
													})
								})
					})
			//]]>
</script>
<script>
	// Disable form submissions if there are invalid fields
			(
					function() {
						'use strict';
						window
								.addEventListener(
										'load',
										function() {
											// Get the forms we want to add validation styles to
											var forms = document
													.getElementsByClassName('needs-validation');
											// Loop over them and prevent submission
											var validation = Array.prototype.filter
													.call(
															forms,
															function(form) {
																form
																		.addEventListener(
																				'submit',
																				function(
																						event) {
																					if (form
																							.checkValidity() === false) {
																						event
																								.preventDefault();
																						event
																								.stopPropagation();
																					}
																					form.classList
																							.add('was-validated');
																				},
																				false);
															});
										}, false);
					})();
</script>

</html>
