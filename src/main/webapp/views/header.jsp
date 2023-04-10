<%@page import="models.cartModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.user"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
String active = request.getRequestURI();
//ArrayList<cartModel> dataCart = (ArrayList<cartModel>) session.getAttribute("dataCart");
user currentUser = (user) session.getAttribute("usernew");
String idCurrentUser = currentUser != null ? currentUser.getIdUser() : "";
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
			href="/KarmaShop/views/index.jsp">Home</a></li>
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
		<div class="header-cart-sub" id="header-cart-sub">

			<%--
<%= idCurrentUser %>
			<c:forEach var="product" items="${dataCart}">

				<div class="header-cart-item">
					<img alt="img" src="${product.thumbnail }">
					<div class="header-cart-item-context">
						<h3>${product.productName }</h3>
						<p>
							${product.price} <span style="color: red;"> x
								${product.inCart }</span>
						</p>
					</div>
					<div class="cart-close-item">
						<i class="fa-solid fa-xmark"></i>
					</div>
				</div>

			</c:forEach>


 --%>


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

<script>
console.log("curent user: <%=idCurrentUser%> ")

		fetch("/KarmaShop/mainController")
			.then(response => response.json())
			.then(data => {
				//console.log("dataCart: ", data)
				// Xử lý kết quả trả về ở đây
				  let container = document.getElementById('header-cart-sub');
				  var htmls =""
					  if(data.length > 0 ){
						  var htmls = data.map(product => {
						        return `
						        <div class="header-cart-item">
								<img alt="img" src=\${product.thumbnail }>
								<div class="header-cart-item-context">
									<h3>\${product.productName }</h3>
									<p>
										\${product.price} <span style="color: red;"> x
											\${product.inCart }</span>
									</p>
								</div>
								<div class="cart-close-item">
									<i class="fa-solid fa-xmark"></i>
								</div>
							</div>
						        `
						    });
						container.innerHTML = htmls.join('')
									  
						  
					  } else {
						  
							container.innerHTML = "<h1>Không tìm thấy dữ liệu</h1>"
									  
					  }
					  
			})
</script>