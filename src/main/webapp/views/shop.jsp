<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>KarmaShop</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta name="robots" content="noindex, nofollow">

<style type="text/css">
  <%@include file="/styles/style.css" %>
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

</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>



	<div class="shop text-center">
		<div class="row">
			<div class="col col-lg-3 side-bar">

				<h3>Category</h3>
				<div class="category">
					<label> <input type="radio" onchange="myFunction()" name="gender" value="male">
						Male
					</label>

					<label> <input type="radio" onchange="myFunction()" name="gender" value="female">
						Female
					</label>

					<label> <input type="radio" onchange="myFunction()" name="gender" value="other">
						Other
					</label>
				</div>

				<h3>Brand</h3>
				<ul class="category">

					<li>Nike</li>
					<li>Adidas</li>
					<li>Puma</li>
				</ul>

				<h3>Size</h3>
				<ul class="category">

					<li>S</li>
					<li>M</li>
					<li>L</li>
				</ul>
			</div>


			<div class="col col-lg-9 block-product">
				<div class="container text-center">
					<div class="row">


						<c:forEach var="product" items="${dataProduct}">

							<div class="col">
								<div class="card" style="width: 18rem;">
									<div class="label">
										<p>${product.category}</p>
										<p>${product.brand}</p>
										<p>${product.size}</p>
									</div>
									<button class="like">
										<i class="fa-regular fa-heart"></i>
										<%--<i class="fa-solid fa-heart"></i> --%>
									</button>
									<img src="${product.thumbnail}" class="card-img-top" alt="img">
									<div class="card-body">
										<h5 class="card-title">${product.name}</h5>
										<p class="card-text">${product.description}</p>


										<div class="buy-btn">
											<a href="#" class="btn btn-primary">Buy Now</a> <a href="#"
												class="btn btn-primary">Add To Cart</a>
										</div>
									</div>
								</div>
							</div>

						</c:forEach>


						<nav class="paginate" aria-label="Page navigation example">
							<ul class="pagination">
								<li class="page-item"><a class="page-link" href="#"
									aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								</a></li>
								<li class="page-item"><a class="page-link" href="#">1</a></li>
								<li class="page-item"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#"
									aria-label="Next"> <span aria-hidden="true">&raquo;</span>
								</a></li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</div>



	<jsp:include page="footer.jsp"></jsp:include>



	<script type="text/javascript" src="../javaScript/script.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N"
		crossorigin="anonymous"></script>
</body>
</html>