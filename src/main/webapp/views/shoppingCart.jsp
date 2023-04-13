<%@page import="models.user"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shopping cart</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta name="robots" content="noindex, nofollow">

<style type="text/css">
<%@
include file="/styles/style.css"
%>
</style>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css"
	integrity="sha512-NhSC1YmyruXifcj/KFRWoC561YpHpc5Jtzgvbuzx5VozKpWvQ+4nXhPdFgmx8xqexRcpAglTj9sIBWINXa8x5w=="
	crossorigin="anonymous" referrerpolicy="no-referrer">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp"
	crossorigin="anonymous">
<%
String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
		+ request.getContextPath();

String baoLoi = request.getAttribute("baoLoi")+"";
baoLoi = (baoLoi.equals(null))?"":baoLoi;

user currentUser = (user) session.getAttribute("usernew");
String idCurrentUser = currentUser != null ? currentUser.getIdUser() : "";

String idCart = request.getParameter("idCart")+"";
%>
<script src="<%=url%>/javaScript/script.js"></script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<div style="height: 400px" class="banner">
		<img
			src="https://preview.colorlib.com/theme/karma/img/banner/banner-bg.jpg"
			class="banner-bg" alt="img">

	</div>
	
	<div style="text-align: center; font-size: 14px; font-weight: 500">
		<p><%=baoLoi%></p>
	</div>
	
	

	<div class="col-md-10 mx-auto">
		<table class="table">
			<thead>
				<tr>
					<th scope="col">Products</th>
					<th scope="col">Name</th>
					<th scope="col">Price</th>
					<th scope="col">Quantity</th>
					<th scope="col">Total</th>
					<th>
						
					</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${listCart}" var="cart">
					<tr>
						<td><img style="margin-left: 0px; height: 100px" alt=""
							src="${cart.thumbnail}"></td>
						<td style="padding-top: 45px">${cart.productName}</td>
						<td style="padding-top: 45px">${cart.price}</td>
						<td style="padding-top: 45px">
							<div class="buttons_added">
								<input class="minus is-form" type="button" value="-"> <input
									aria-label="quantity" class="input-qty" max="10" min="1"
									name="" type="number" value="1"> <input
									class="plus is-form" type="button" value="+">
							</div>
						</td>

						<td style="padding-top: 45px">$100</td>
						
						<td style="padding-top: 45px">
							<a href="/KarmaShop/Delete?idCart=${cart.idCart}">
								<button style="border: hidden; background: red; color: white; border-radius: 5px" type="button">Delete</button>
							</a>
						</td>

					</tr>
				</c:forEach>
			</tbody>
		</table>

		<!-- end table -->

		<div class="row g-0 text-center">
			<div class="col-sm-6 col-md-4">
				<div class="d-flex justify-content-start">
					<button type="button"
						style="background: #E8F0F2; border: hidden; height: 40px; font-size: 14px; font-weight: 500; width: 200px">UPDATE
						CART</button>
				</div>
			</div>
			<div class="col-6 col-md-8">
				<div class="d-flex justify-content-end">
					<input
						style="border: solid 1px #E8F0F2; padding-left: 10px; height: 40px; font-size: 14px"
						type="text" placeholder="Coupon Code" />

					<button type="button"
						style="background: linear-gradient(90deg, #F9C129, #FA8E1C); color: white; border-style: hidden; width: 100px; font-weight: 500; font-size: 14px">APPLY</button>



					<button type="button"
						style="background: #E8F0F2; border: hidden; width: 200px; font-weight: 500; font-size: 14px">CLOSE
						COUPON</button>
				</div>
			</div>
		</div>

		<hr>

		<div class="row g-0 text-center">
			<div class="col-sm-6 col-md-8"></div>
			<div class="col-6 col-md-4">
				<div style="display: flex; justify-content: space-between;">
					<p style="font-size: 14px; font-weight: 500">Subtotal</p>
					<p>$100</p>
				</div>
			</div>
		</div>

		<hr>

		<div class="row g-0 text-center">
			<div class="col-sm-6 col-md-8"></div>
			<div class="col-6 col-md-4">
				<div style="display: flex; justify-content: flex-end;">
					<button type="button" style="border: hidden; background: #E8F0F2; height: 40px; font-size: 14px; font-weight: 500; color: #222222; width: 200px">COUNTINUE SHOPPING</button>
					<button type="button" style="border: hidden; background: linear-gradient(90deg, #F9C129, #FA8E1C); height: 40px; font-size: 14px; font-weight: 500; width: 200px; color: white">PROCEED TO CHECKOUT</button>
				</div>
			</div>
		</div>




	</div>







	<jsp:include page="footer.jsp"></jsp:include>




	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N"
		crossorigin="anonymous"></script>
</body>

<script>
	//<![CDATA[
	$('input.input-qty')
			.each(
					function() {
						var $this = $(this), qty = $this.parent().find(
								'.is-form'), min = Number($this.attr('min')), max = Number($this
								.attr('max'))
						if (min == 0) {
							var d = 0
						} else
							d = min
						$(qty).on('click', function() {
							if ($(this).hasClass('minus')) {
								if (d > min)
									d += -1
							} else if ($(this).hasClass('plus')) {
								var x = Number($this.val()) + 1
								if (x <= max)
									d += 1
							}
							$this.attr('value', d).val(d)
						})
					})
	//]]>
</script>

</html>