<%@page import="models.user"%>
<%!int pageCount = 0;

	void addCount() {
		pageCount++;
	}%>
<%
addCount();
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
		<li class="header-menu"><a href="/KarmaShop/userController">Home</a></li>
		<li class="header-menu"><a href="/KarmaShop/productController">Shop</a></li>
		<li class="header-menu"><a href="#">Blog</a></li>
		<li class="header-menu"><a href="#">Contact</a></li>
		<li class="header-menu"><a href="#">Admin</a></li>
	</ul>

	<div class="header-cart header-btn">
		<i class="fa-sharp fa-solid fa-cart-shopping"></i>
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
					  <button type="button" style="white-space: nowrap;" class="btn bg-warning text-black btn-danger dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
					    <%=us.getUsername()%>
					  </button>
					  <ul class="dropdown-menu">
					    <li><a class="dropdown-item" href="#">Update profile</a></li>
					    <li><a class="dropdown-item" href="#">Order</a></li>
					    <li><hr class="dropdown-divider"></li>
					    <li><a class="dropdown-item" href="/KarmaShop/LogOut">Log out</a></li>
					  </ul>
					</div>
					<%
					}
					%>
	


</div>