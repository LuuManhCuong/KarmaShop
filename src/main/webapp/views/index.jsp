<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>KarmaShop</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta name="robots" content="noindex, nofollow">

<style type="text/css">
<%@include file="/styles/style.css"%>
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
%>
<script src="<%=url%>/javaScript/script.js"></script>

</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<div class="banner">
		<img
			src="	https://preview.colorlib.com/theme/karma/img/banner/banner-bg.jpg"
			class="banner-bg" alt="img"> <img class="banner-shoe"
			alt="banner"
			src="https://preview.colorlib.com/theme/karma/img/banner/banner-img.png">
		<div class="banner-content">
			<h1>
				Nike New <br>Collection!
			</h1>
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed
				do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
				enim ad minim veniam, quis nostrud exercitation.</p>
			<div class="add-bag d-flex align-items-center">
				<a class="shop-now-btn" href="/KarmaShop/shopController">Shop
					Now</a>
			</div>
		</div>
	</div>

	<%-- --%>

	<div class="container text-center"
		style="clear: both; margin-top: 50px">

		<div class="row bg-white shadow">
			<div class="col-sm-5 col-md-3">
				<img style="margin-top: 20px; width: 30px" alt=""
					src="	https://preview.colorlib.com/theme/karma/img/features/f-icon1.png">
				<br />
				<p style="font-weight: 700; margin-top: 15px">Free Delivery</p>
				<p style="margin-top: -15px;">Free Shipping on all order</p>
			</div>

			<div class="col-sm-5 col-md-3">
				<img style="margin-top: 20px; width: 30px" alt=""
					src="https://preview.colorlib.com/theme/karma/img/features/f-icon2.png">
				<br />
				<p style="font-weight: 700; margin-top: 15px">Return Policy</p>
				<p style="margin-top: -15px;">Free Shipping on all order</p>
			</div>

			<div class="col-sm-5 col-md-3">
				<img style="margin-top: 20px; width: 30px" alt=""
					src="	https://preview.colorlib.com/theme/karma/img/features/f-icon3.png">
				<br />
				<p style="font-weight: 700; margin-top: 15px">24/7 Support</p>
				<p style="margin-top: -15px;">Free Shipping on all order</p>
			</div>

			<div class="col-sm-5 col-md-3">
				<img style="margin-top: 20px; width: 30px" alt=""
					src="https://preview.colorlib.com/theme/karma/img/features/f-icon4.png">
				<br />
				<p style="font-weight: 700; margin-top: 15px">Secure Payment</p>
				<p style="margin-top: -15px;">Free Shipping on all order</p>
			</div>

		</div>

	</div>

	<%--  --%>
	<div style="margin-top: 50px" class="container">
		<div class="row justify-content-center">
			<div class="col-lg-8 col-md-12">
				<div class="row">
					<div class="col-lg-8 col-md-8">
						<div class="single-deal">
							<div class="overlay"></div>
							<img class="img-fluid w-100" src="https://preview.colorlib.com/theme/karma/img/category/c1.jpg" alt="">
							<a href="img/category/c1.jpg" class="img-pop-up" target="_blank">
								
							</a>
						</div>
					</div>
					<div class="col-lg-4 col-md-4">
						<div class="single-deal">
							<div class="overlay"></div>
							<img class="img-fluid w-100" src="https://preview.colorlib.com/theme/karma/img/category/c2.jpg" alt="">
							<a href="https://preview.colorlib.com/theme/karma/img/category/c2.jpg" class="img-pop-up" target="_blank">
								
							</a>
						</div>
					</div>
					<div style="margin-top: 28px" class="col-lg-4 col-md-4">
						<div class="single-deal">
							<div class="overlay"></div>
							<img class="img-fluid w-100" src="https://preview.colorlib.com/theme/karma/img/category/c3.jpg" alt="">
							<a href="img/category/c3.jpg" class="img-pop-up" target="_blank">
								
							</a>
						</div>
					</div>
					<div style="margin-top: 28px" class="col-lg-8 col-md-8">
						<div class="single-deal">
							<div class="overlay"></div>
							<img class="img-fluid w-100" src="https://preview.colorlib.com/theme/karma/img/category/c4.jpg" alt="">
							<a href="img/category/c4.jpg" class="img-pop-up" target="_blank">
								
							</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6">
				<div class="single-deal">
					<div class="overlay"></div>
					<img class="img-fluid w-100" src="https://preview.colorlib.com/theme/karma/img/category/c5.jpg" alt="">
					<a href="img/category/c5.jpg" class="img-pop-up" target="_blank">
					
					</a>
				</div>
			</div>
		</div>
	</div>
	<%--  --%>
	
	<div style="text-align: center; padding-top: 50px">
		<p style=" color: black; font: 15px; font-weight: 700; ">Products</p>
		<p style="color: #e7ab3c">"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et
			dolore
			magna aliqua."</p>
	</div>
	
	<%--  --%>
	
	<div style="margin-top: 50px" class="container">
		<div class="row row-cols-4 row-cols-lg-4 g-2 g-lg-4">
				
				<c:forEach  items="${dataProduct}" var="product" varStatus="status">
				<c:if test="${status.count <= 8}">
			        <div style="width: 16rem" class="col">
					<div class="card" style="width: 16rem;">
						<img style="background: #828CB1; height: 250px" src="${product.thumbnail}"
							class="card-img-top" alt="...">
						<div class="card-body">
							<p style="font-weight: 700" class="card-text">${product.name}</p>
							<div style="display: flex;">
								<p style="font-weight: 700" class="card-text">$ ${product.price}</p>
								<span style="color: #e7ab3c; padding-left: 40px"><del>$ 30.0</del></span>
							</div>
							
						</div>
					</div>
				</div>
			    </c:if>
				
			</c:forEach>
			

		</div>
	</div>





	<jsp:include page="footer.jsp"></jsp:include>





	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N"
		crossorigin="anonymous"></script>
</body>
</html>