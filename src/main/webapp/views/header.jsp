<%!int pageCount = 0;

	void addCount() {
		pageCount++;
	}%>
<%
addCount();
%>
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
		<li class="header-menu"><a href="#">Home</a></li>
		<li class="header-menu"><a href="#">Shop</a></li>
		<li class="header-menu"><a href="#">Blog</a></li>
		<li class="header-menu"><a href="#">Contact</a></li>
		<li class="header-menu"><a href="#">Admin</a></li>
	</ul>

	<div class="header-cart header-btn">
		<i class="fa-sharp fa-solid fa-cart-shopping"></i>
	</div>

	<div class="header-user header-btn">
		<i class="fa-regular fa-user"></i>
	</div>


</div>