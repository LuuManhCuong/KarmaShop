<%@page import="models.user"%>


<%
String active = request.getRequestURI();
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>




<div class="header">
	<img alt="logo"
		src="https://preview.colorlib.com/theme/karma/img/logo.png">
	<div class="header-search">
		<input class="header-search-input" type="text" name="keySearch"
			placeholder="Search anything...">
		<button class="header-search-icon" type="submit">
			<i class="fa-solid fa-magnifying-glass"></i>
		</button>
	</div>
	<ul class="header-menu-list">
		<li
			class="header-menu <%=request.getRequestURI().endsWith("index.jsp") ? "active" : ""%>"><a
			href="/KarmaShop/userController">Home</a></li>
		<li
			class="header-menu <%=request.getRequestURI().endsWith("shop.jsp") ? "active" : ""%>"><a
			href="/KarmaShop/shopController">Shop</a></li>
		<li
			class="header-menu <%=request.getRequestURI().endsWith("blog.jsp") ? "active" : ""%>"><a
			href="#">Blog</a></li>
		<li
			class="header-menu <%=request.getRequestURI().endsWith("contact.jsp") ? "active" : ""%>"><a
			href="#">Contact</a></li>
		<li
			class="header-menu <%=request.getRequestURI().endsWith("admin.jsp") ? "active" : ""%>"><a
			href="#">Admin</a></li>
	</ul>

	<div class="header-cart header-btn">
		<i class="fa-sharp fa-solid fa-cart-shopping"></i>
		<div class="header-cart-sub">
		
		
		
		<c:forEach var="product" items="${dataProduct}">

							<div  class="col">
								<div class="card" style="width: 18rem;">
									<div class="label">
										<p>${product.category}</p>
										<p>${product.brand}</p>
										<p>${product.size}</p>
									</div>
									<button class="like">
										<i class="fa-regular fa-heart"></i>
										<i class="fa-solid fa-heart"></i> 
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
		
		
			<div class="header-cart-item">
				<img alt="img"
					src="https://preview.colorlib.com/theme/fashi/img/products/product-2.jpg">
				<div class="header-cart-item-context">
					<h3>
						sản phẩm áo 
					</h3>
					<p>mô tả sản phẩm áo</p>
					<p>100đ <span style="color: red;"> x 10</span></p>
				</div>
				<div class="cart-close-item">
					<i class="fa-solid fa-xmark"></i>
				</div>
			</div>

			<div class="header-cart-item">
				<img alt="img"
					src="https://preview.colorlib.com/theme/fashi/img/products/product-2.jpg">
				<div class="header-cart-item-context">
					<h3>
						sản phẩm mũ 
					</h3>
					<p>mô tả sản phẩm mũ</p>
					<p>100đ <span style="color: red;"> x 10</span></p>
				</div>
				<div class="cart-close-item">
					<i class="fa-solid fa-xmark"></i>
				</div>
			</div>
		</div>
	</div>

	<%
	Object obj = session.getAttribute("usernew");
	user us = null;
	if (obj != null)
		us = (user) obj;

	if (us == null) {
	%>
	<a class="btn btn-warning me-4" style="white-space: nowrap;"
		href="/KarmaShop/views/login.jsp"> Login </a>
	<%
	} else {
	%>
	<!-- Example single danger button -->
	<div class="btn-group me-4">
		<button type="button" style="white-space: nowrap;"
			class="btn bg-warning text-black btn-danger dropdown-toggle"
			data-bs-toggle="dropdown" aria-expanded="false">
			<%=us.getUsername()%>
		</button>
		<ul class="dropdown-menu">
			<li><a class="dropdown-item" href="#">Update profile</a></li>
			<li><a class="dropdown-item" href="#">Order</a></li>
			<li><hr class="dropdown-divider"></li>
			<li><a class="dropdown-item" href="/KarmaShop/LogOut">Log
					out</a></li>
		</ul>
	</div>
	<%
	}
	%>



</div>