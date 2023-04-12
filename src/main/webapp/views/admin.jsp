
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
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">

<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
	integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU"
	crossorigin="anonymous">

<style>
html, body {
	min-height: 100%;
}

body, div, form, input, select {
	padding: 0;
	margin: 0;
	outline: none;
	font-family: Roboto, Arial, sans-serif;
	font-size: 14px;
	color: #666;
	line-height: 22px;
}

h1, h4 {
	margin: 15px 0 4px;
	font-weight: 400;
}

h4 {
	margin: 20px 0 4px;
	font-weight: 400;
}

span {
	color: red;
}

.small {
	font-size: 10px;
	line-height: 18px;
}

.testbox {
	display: flex;
	justify-content: center;
	align-items: center;
	height: inherit;
	padding: 3px;
}

form {
	width: 100%;
	padding: 20px;
	background: #fff;
	box-shadow: 0 2px 5px #ccc;
}

input {
	width: calc(100% - 10px);
	padding: 5px;
	border: 1px solid #ccc;
	border-radius: 3px;
	vertical-align: middle;
}

input:hover, textarea:hover, select:hover {
	outline: none;
	border: 1px solid #095484;
	background: #e6eef7;
}

.title-block select, .title-block input {
	margin-bottom: 10px;
}

select {
	padding: 7px 0;
	border-radius: 3px;
	border: 1px solid #ccc;
	background: transparent;
}

select, table {
	width: 100%;
}

option {
	background: #fff;
}

.day-visited, .time-visited {
	position: relative;
}

input[type="date"]::-webkit-inner-spin-button {
	display: none;
}

input[type="time"]::-webkit-inner-spin-button {
	margin: 2px 22px 0 0;
}

.day-visited i, .time-visited i, input[type="date"]::-webkit-calendar-picker-indicator
	{
	position: absolute;
	top: 8px;
	font-size: 20px;
}

.day-visited i, .time-visited i {
	right: 5px;
	z-index: 1;
	color: #a9a9a9;
}

[type="date"]::-webkit-calendar-picker-indicator {
	right: 0;
	z-index: 2;
	opacity: 0;
}

.question-answer label {
	display: block;
	padding: 0 20px 10px 0;
}

.question-answer input {
	width: auto;
	margin-top: -2px;
}

th, td {
	width: 18%;
	padding: 15px 0;
	border-bottom: 1px solid #ccc;
	text-align: center;
	vertical-align: unset;
	line-height: 18px;
	font-weight: 400;
	word-break: break-all;
}

.first-col {
	width: 25%;
	text-align: left;
}

textarea {
	width: calc(100% - 6px);
}

.btn-block {
	margin-top: 20px;
	text-align: center;
}

button {
	width: 150px;
	padding: 10px;
	border: none;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	background-color: #095484;
	font-size: 16px;
	color: #fff;
	cursor: pointer;
}

button:hover {
	background-color: #0666a3;
}

@media ( min-width : 568px) {
	.title-block {
		display: flex;
		justify-content: space-between;
	}
	.title-block select {
		width: 30%;
		margin-bottom: 0;
	}
	.title-block input {
		width: 31%;
		margin-bottom: 0;
	}
	th, td {
		word-break: keep-all;
	}
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>



	<div class="shop text-center">
		<div class="row">
			<div class="col col-lg-3">

				<h3>Admin</h3>
				<ul class="category">
					<li go="dataCustomer" class="activeCate">Data Customer</li>
					<li go="wareHouse">WareHouse</li>
					<li go="addProduct">Add Product</li>
				</ul>

			</div>

			<div class="col col-lg-9">
				<div class="container text-center">
					<div class="row include">

						<div target="dataCustomer" class="blockItem activeItem">data
							Customer</div>
						<div target="wareHouse" class="blockItem">wareHouse</div>
						
						
						<div target="addProduct" class="blockItem">
							<form action="/">
								<h3>Add new product</h3>
								<h4>
									Product name<span>*</span>
								</h4>
								<input type="text" name="name" />
								<div class="inputBlock">
									<div class="inputItem">
										<h4>
											Category<span>*</span>
										</h4>
										<select>
											<option value="Men">Men</option>
											<option value="Women">Women</option>
											<option value="Kids">Kids</option>
										</select>

									</div>

									<div class="inputItem">

										<h4>
											Brand<span>*</span>
										</h4>
										<div class="title-block">
											<select name="brand">
												<option value="Nike">Nike</option>
												<option value="Puma">Puma</option>
												<option value="Van">Van</option>
											</select>
										</div>
									</div>

									<div class="inputItem">

										<h4>
											Size<span>*</span>
										</h4>
										<div class="title-block">
											<select name="size">
												<option value="S">S</option>
												<option value="M">M</option>
												<option value="L">L</option>
											</select>
										</div>
									</div>

									<div class="inputItem">
										<h4>
											Color<span>*</span>
										</h4>
										<div class="title-block">
											<select name="color">
												<option value="White">White</option>
												<option value="Black">Black</option>
												<option value="Red">Red</option>
											</select>
										</div>
									</div>

								</div>

								<div class="inputItem">
									<h4>
										Quantity<span>*</span>
									</h4>
									<input type="number" name="quantity" />
								</div>
								
								<div class="inputItem">
									<h4>
										Price<span>*</span>
									</h4>
									<input type="text" name="price" />
								</div>
								
						
						<h4>Desciption</h4>
						<p class="small">
							Please do not indicate your account or credit card number and
							banking instruction in your comments. Thank you for your time and
							valuable feedback.</small>
							<textarea name="desciption" rows="5"></textarea>
						<div class="btn-block">
							<button type="submit">Submit</button>
						</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>



	<jsp:include page="footer.jsp"></jsp:include>



	<script>
	    let listCate = document.querySelectorAll(".category li");
	    let listInclude = document.querySelectorAll(".include div");
	    listCate.forEach(e => {
	        e.onclick = function(e) {
	            for (var i = 0; i < listCate.length; i++) {
	                listCate[i].classList.remove("activeCate");
	            }
	            this.classList.add(`activeCate`);
	            let goValue = this.getAttribute("go");
	            //console.log("Giá trị của thuộc tính 'go': ", goValue);
	            
	            listInclude.forEach((e,i) => {
	            	e.getAttribute("target")
	            	e.classList.remove("activeItem");
	            	//e.getAttribute("target") == goValue?e.classList.add(`activeItem`): ""
	            	if(e.getAttribute("target") == goValue) {
	            		e.classList.add(`activeItem`)
	            				//Call api tương ứng goValue
	            	}
	            })
	        }
	    })
	</script>






	<script type="text/javascript" src="../javaScript/script.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"
		integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js"
		integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N"
		crossorigin="anonymous"></script>
</body>
</html>