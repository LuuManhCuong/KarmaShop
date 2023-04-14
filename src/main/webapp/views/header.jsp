<%@page import="models.cartModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.user"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%
String active = request.getRequestURI();
//ArrayList<cartModel> dataCart = (ArrayList<cartModel>) session.getAttribute("dataCart");
user currentUser = (user) session.getAttribute("usernew");
int isAdmin = currentUser != null ? currentUser.getIsAdmin() : 0;
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<style type="text/css">
  <%@include file="/styles/style.css" %>
  
</style>
<style>
@charset "UTF-8";

/* Dropdown Button */
.dropbtn {
  color: black;
  font-size: 14px;
  padding-top: 15px;
  padding-left: 10px;
  padding-right: 10px
}

/* The container <div> - needed to position the dropdown content */
.dropdown {
  position: relative;
  display: inline-block;
}

/* Dropdown Content (Hidden by Default) */
.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f1f1f1;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

/* Links inside the dropdown */
.dropdown-content a {
  color: #e7ab3c;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  font-size: 14px
}

/* Change color of dropdown links on hover */
.dropdown-content a:hover {background-color: #ddd;}

/* Show the dropdown menu on hover */
.dropdown:hover .dropdown-content {display: block;}

/* Change the background color of the dropdown button when the dropdown content is shown */
.dropdown:hover .dropbtn {color: #e7ab3c}
</style>

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
		
		<li>
			<div class="dropdown">
			<div class="dropbtn">
				<p class="header-menu <%=request.getRequestURI().endsWith("shop.jsp") ? "active" : ""%>">Shop</p>
			</div>
			  <div class="dropdown-content ">
			    <a class="header-menu <%=request.getRequestURI().endsWith("shop.jsp") ? "active" : ""%>" href="/KarmaShop/shopController">SHOP CATEGORY</a>
			    <a href="">PRODUCT DETAILS</a>
			    <a class="header-menu <%=request.getRequestURI().endsWith("shoppingCart.jsp") ? "active" : ""%>" href="/KarmaShop/ShoppingCart">SHOPPING CART</a>
			  </div>
			</div>
		</li>
		
		<li
			class="header-menu <%=request.getRequestURI().endsWith("blog.jsp") ? "active" : ""%>"><a
			href="#">Blog</a></li>
		<li
			class="header-menu <%=request.getRequestURI().endsWith("contact.jsp") ? "active" : ""%>"><a
			href="#">Contact</a></li>

		<%
		if (isAdmin == 1) {
		%>
		<li
			class="header-menu <%=request.getRequestURI().endsWith("admin.jsp") ? "active" : ""%>">
			<a href="/KarmaShop/views/admin.jsp">Admin</a>
		</li>

		<%
		}
		%>

	</ul>

	<div class="header-cart header-btn">
		<i class="fa-sharp fa-solid fa-cart-shopping"></i>
		<div class="header-cart-sub" id="header-cart-sub"></div>
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<script>

function render(data){
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
					<div class="cart-close-item" onclick="removeCart(\${product.idCart}, <%%>)">
						<i class="fa-solid fa-xmark"></i>
					</div>
				</div>
			        `
			    });
			container.innerHTML = htmls.join('')
						  
			  
		  } else {
			  
				container.innerHTML = "<h1>Không tìm thấy dữ liệu</h1>"
						  
		  }
		  
}



function removeCart(idCart) {
	console.log("remove: " , idCart)
	// Sử dụng jQuery Ajax
	$.ajax({
	  url: "/KarmaShop/mainController", // URL đến Servlet hoặc Controller xử lý yêu cầu xóa sản phẩm trong giỏ hàng
	  method: "GET", // Phương thức HTTP (GET, POST, PUT, DELETE, etc.)
	  data: { // Dữ liệu gửi đi, tùy thuộc vào yêu cầu của server
	    action: "removeCart",
	    idCart: idCart
	  }, 
	  dataType: "json", // Kiểu dữ liệu phản hồi từ server (json, xml, text, etc.)
	  success: function(data) { // Hàm được gọi khi yêu cầu thành công
	   // console.log(data); // Xử lý dữ liệu phản hồi từ server
	    render(data)
	  },
	  error: function(xhr, status, error) { // Hàm được gọi khi yêu cầu gặp lỗi
	    console.log("Lỗi: " + status + " - " + error); // Xử lý lỗi
	  }
	});	
}



		fetch("/KarmaShop/mainController?action=getCart")
			.then(response => response.json())
			.then(data => render(data))
			
			
</script>