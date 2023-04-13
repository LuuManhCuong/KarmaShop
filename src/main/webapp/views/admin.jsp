
<%@page import="models.user"%>
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

.sub-nav {
	display: none;
	cursor: pointer;
	z-index: 100;
	background-color: white;
}

.sub {
	cursor: pointer;
}

.sub:hover {
	color: red;
}

.sub:hover .sub-nav {
	display: block !important;
}

.sub-nav::before {
	content: " ";
	height: 100%;
	width: 100%;
	position: absolute;
	top: -20px;
	left: -30px;
}


element.style {
}
.table>:not(caption)>*>* {
    padding: 0.5rem 0.5rem;
    background-color: var(--bs-table-bg);
    border-bottom-width: var(--bs-border-width);
    box-shadow: inset 0 0 0 9999px var(--bs-table-accent-bg);
}
@media (min-width: 568px)
th, td {
    word-break: keep-all;
}
th, td {
    width: 12%;
    }

</style>
</head>

<%
String active = request.getRequestURI();
//ArrayList<cartModel> dataCart = (ArrayList<cartModel>) session.getAttribute("dataCart");
user currentUser = (user) session.getAttribute("usernew");
int isAdmin = currentUser != null ? currentUser.getIsAdmin() : 0;
%>

<%
		if (isAdmin == 1) {
		%>
		

<body>
	<jsp:include page="header.jsp"></jsp:include>



	<div class="shop text-center">
		<div class="row">
			<div class="col col-lg-3">

				<h3>Admin</h3>
				<ul class="category">
					<li go="addProduct" class="activeCate">Add Product</li>
					<li go="dataCustomer" >Data Customer</li>
					<li go="wareHouse">WareHouse</li>
				</ul>

			</div>

			<div class="col col-lg-9">
				<div class="container text-center">
					<div class="row include">

						<div target="dataCustomer" class="blockItem">data
							Customer
							<table class="table">
								<thead>
									<tr>
										<th scope="col">STT</th>
										<th scope="col">Username</th>
										<th scope="col">Email</th>
										<th scope="col">Phone</th>
											<th scope="col">Address</th>
											<th scope="col">Gender</th>
											<th scope="col">Admin</th>
										<th scope="col">SỬA - XÓA</th>
									</tr>
								</thead>
								<tbody id="tb-dataCustomer">
								

								</tbody>
							</table>
							
							</div>

						<div target="wareHouse" class="blockItem">
							warehouse
							<table class="table">
								<thead>
									<tr>
										<th scope="col">STT</th>
										<th scope="col">Product</th>
										<th scope="col">Price</th>
										<th scope="col">Category</th>
											<th scope="col">Brand</th>
											<th scope="col">Size</th>
											<th scope="col">Color</th>
										<th scope="col">SỬA - XÓA</th>
									</tr>
								</thead>
								<tbody id="tb-wareHouse">
								

								</tbody>
							</table>

						</div>

						<div target="addProduct" class="blockItem  activeItem">
							<form id="uploadForm" action="/KarmaShop/adminController"
								method="POST">
								<h3>Add new product</h3>
								<h4>
									Product name<span>*</span>
								</h4>
								<input type="text" id="name" name="name" />
								<div class="inputBlock">
									<div class="inputItem">
										<h4>
											Category<span>*</span>
										</h4>
										<select name="category" id="category">
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
											<select id="brand" name="brand">
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
											<select name="size" id="size">
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
											<select name="color" id="color">
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
									<input type="number" id="quantity" name="quantity" />
								</div>

								<div class="inputItem">
									<h4>
										Price (đ)<span>*</span>
									</h4>
									<input type="text" id="price" name="price" />
								</div>

								<div class="inputItem">
									<h4>
										Thumbnail<span>*</span>
									</h4>
									<input type="file" id="thumbnail" name="thumbnail" />
								</div>




								<h4>Desciption</h4>
								<p class="small">
									Please do not indicate your account or credit card number and
									banking instruction in your comments. Thank you for your time
									and valuable feedback.</small>
									<textarea name="description" id="description" rows="5"></textarea>
								<div class="btn-block">
									<button type="submit">Submit</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>

<!-- Modal -->
					        <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
					          <div class="modal-dialog modal-dialog-centered">
					            <div class="modal-content">
					              <div class="modal-header">
					                <h1 class="modal-title fs-5" id="staticBackdropLabel">Admin edit user!</h1>
					                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					              </div>
					              <div class="modal-body">
					              <!-- Form cập nhật thông tin người dùng -->
					              <form id="updateUserForm" style="padding: 0;">
					              	<div class="form-group" id="form-idUser">
					                  <input type="text" class="form-control" id="idUser" name="idUser" value="" hidden >
					                </div>
					                <div class="form-group">
					                  <label for="avatar">Avatar</label>
					                  <img src = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKJpvM_7RZEvZ5NQxVJ22Ra-RJSOkrNY1q5Q&usqp=CAU "style="
							          	    width: 50px;
							             height: 50px;
							             border-radius: 50%;
							          	">
					                  <input type="file" class="form-control" id="avatar" name="avatar">
					                </div>
					                <div class="form-group">
					                  <label for="username">Username</label>
					                  <input type="text" class="form-control" id="username" name="username" placeholder="Enter username" >
					                </div>
					                <div class="form-group">
					                  <label for="email">Email</label>
					                  <input type="email" class="form-control" id="email" name="email" placeholder="Enter email" >
					                </div>
					                <div class="form-group">
					                  <label for="phone">Phone</label>
					                  <input type="tel" class="form-control" id="phone" name="phone" placeholder="Enter phone number" >
					                </div>
					                <div class="form-group">
					                  <label for="address">Address</label>
					                  <input type="text" class="form-control" id="address" name="address" placeholder="Enter address" >
					                </div>
					                <div class="form-group">
					                  <label for="gender">Gender</label>
					                  <select class="form-control" id="gender" name="gender">
					                    <option value="men" >men</option>
					                    <option value="women" >women</option>
					                    <option value="kids" >kids</option>
					                  </select>
					                </div>
					                <div class="form-group">
					                  <label for="isAdmin">Is Admin</label>
					                  <input type="checkbox" class="form-check-input" id="isAdmin" name="isAdmin">
					                </div>
					                
					                
					                <div class="modal-footer">
					                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
					                <button type="submit" class="btn btn-primary">Save</button>
					              </div>
					              </form>
					              </div>
					              
					            </div>
					          </div>
					        </div>

		<jsp:include page="footer.jsp"></jsp:include>



		<script>
	
	// Xử lý sự kiện add product
	document.getElementById("uploadForm").addEventListener("submit", function (event) {
	  event.preventDefault(); // Ngăn chặn hành vi submit mặc định của form

	  // Lấy dữ liệu từ các input fields
	  var name = document.getElementById("name").value;
	  var category = document.getElementById("category").value;
	  var brand = document.getElementById("brand").value;
	  var size = document.getElementById("size").value;
	  var color = document.getElementById("color").value;
	  var quantity = document.getElementById("quantity").value;
	  var price = document.getElementById("price").value;
	  var description = document.getElementById("description").value;

	  // Upload ảnh lên Cloudinary
	  var fileInput = document.getElementById("thumbnail");
	  var file = fileInput.files[0];

	  // Tạo FormData để gửi dữ liệu và file lên server
	  var imgData = new FormData();
	  imgData.append("file", file);
	  imgData.append("upload_preset", "mpght0dj");
	  
	  // Gửi request POST để upload ảnh lên Cloudinary
	  fetch("https://api.cloudinary.com/v1_1/djcamu6kz/upload", {
	    method: "POST",
	    body: imgData
	  })
	    .then(function (response) {
	      return response.json();
	    })
	    .then(function (data) {
	      // Lấy URL của ảnh từ response của Cloudinary
	      var imageURL = data.secure_url;
	      console.log("url: ", imageURL)

		  
		  fetch("/KarmaShop/adminController&action=addProduct", {
			    method: "POST",
			    headers: {
				    'Content-Type': 'application/json'
				  },
			    body: JSON.stringify({
					  name,
					  category,
					  brand,
					  size,
					  color,
					  quantity,
					  price,
					  description,
					  thumbnail: imageURL
				  })
			  })
			  .then(response => response.json())
			  .then(data => console.log(data))
			  .catch(err => console.log("lỗi "))
	    })
	    .catch(function (error) {
	      console.error("Lỗi khi upload ảnh lên Cloudinary:", error);
	    });
	});
	
	
	
	
	// Xử lý sự kiện edit user
	document.getElementById("updateUserForm").addEventListener("submit", function (event) {
	  event.preventDefault(); // Ngăn chặn hành vi submit mặc định của form

	  console.log("edit user")
	// Lấy giá trị từ các trường input trong form
	  var idUser = document.getElementById("idUser").value;
	  var username = document.getElementById("username").value;
	  var email = document.getElementById("email").value;
	  var phone = document.getElementById("phone").value;
	  var address = document.getElementById("address").value;
	  var gender = document.getElementById("gender").value;
	  var admin = document.getElementById("isAdmin").checked;
		
	  let isAdmin = admin===true? 1 : 0;
	  
	   // Upload ảnh lên Cloudinary
	  var fileInput = document.getElementById("avatar");
	  var file = fileInput.files[0];

	  // Tạo FormData để gửi dữ liệu và file lên server
	  var imgData = new FormData();
	  imgData.append("file", file);
	  imgData.append("upload_preset", "mpght0dj");
	  
	  // Gửi request POST để upload ảnh lên Cloudinary
	  fetch("https://api.cloudinary.com/v1_1/djcamu6kz/upload", {
	    method: "POST",
	    body: imgData
	  })
	    .then(function (response) {
	      return response.json();
	    })
	    .then(function (data) {
	      // Lấy URL của ảnh từ response của Cloudinary
	      var avatarUrl = data.secure_url;
	     // console.log("url: ", avatarUrl)

		 fetch("/KarmaShop/adminController?action=editUser", {
			    method: "POST",
			    headers: {
				    'Content-Type': 'application/json'
				  },
			    body: JSON.stringify({
			    	idUser,
			    	username,
			    	email,
			    	phone,
			    	address,
			    	gender,
			    	isAdmin,
			    	avatarUrl,
				  })
			  })
			  .then(response => response.json())
			  .then(data => {
				  console.log(data)
				  getDataCustomer()
			  })
			  .catch(err => console.log("lỗi "))
	      
	      
	    })
	    .catch(function (error) {
	      console.error("Lỗi khi upload ảnh lên Cloudinary:", error);
	    });
	});
	
	
	
	// getModa(user){}
	function getModa(idUser, username){
		//console.log(idUser)
		document.getElementById('idUser').value = idUser;
	}
	
	
	
	
	//call api dataCustomer
	function getDataCustomer(){
		fetch("/KarmaShop/adminController?action=getDataCustomer")
		.then(response => response.json())
		.then(data => {
			
			  let container = document.getElementById('tb-dataCustomer');
			  var htmls =""
				  if(data.length > 0 ){
					  var htmls = data.map(user => {
					        return `

					        <tr>
					          <th scope="row">1</th>
					          <td>
					          <a style="display: flex;align-content: center;flex-wrap: wrap;justify-content: center;">
					          	 <img src =\${user.avatarUrl} style="
					          	    width: 50px;
					             height: 50px;
					             border-radius: 50%;
					          	"; >
					              <p style="margin:0 0 0 5px;font-weight: 500;height:100%;line-height: 100%;/* display: block; */width: 100%;"; >
					              \${user.username}
					               </p>
					          </a>
					           </td>
					          <td>\${user.email} đ</td>
					          <td>\${user.phone}</td>
					          <td>\${user.address}</td>
					          <td>\${user.gender}</td>
					          <td>\${user.isAdmin}</td>
					           <td style="position: relative; ">
					           <div style="position: relative; display: inline-block;" class="sub" > 
					           <i style="padding: 10px;" class="fa-solid fa-ellipsis-vertical"></i>
					          		<div class="sub-nav" style="border: 1px solid black;  max-width: 70px ; text-align:
					          		 center; position: absolute; left: 100% ; top:30px;width:60px;">
					          		
					           		<p 
					           		onclick="getModa(\${user.idUser},<%%>)"
					           		class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop"
					           		style="display:inline-block;width: 100% ;padding: 5px 10px ; margin: 0; user-select: none; color: black;"
					           		> sửa </p>
					           		
					           		<p onclick="deleteUser(\${user.idUser}, <%%>)" style="display: block; margin: 0;user-select: none; padding: 5px 10px;  color: black;"> xóa </p>
					           	</div>
					           	
					           	
					            </div>
					           
					           </td>
					        </tr>   
					        
					        
					       
					        `
					    });
					container.innerHTML = htmls.join('')
								  
					  
				  } else {
					  
						container.innerHTML = "<h1>Không tìm thấy dữ liệu</h1>"
								  
				  }
		})
	}

	
	//delete User
	function deleteUser(idUser) {
		let url = `/KarmaShop/adminController?action=deleteUser&idUser=\${idUser}`
				//console.log("url: ", url)
		fetch(url)
		.then(() => {
			console.log("delete: ", idUser)
			
			getDataCustomer()
		})
		.catch(err => console.log("err: ", err))
		
	}
	
	
	// call api warehouse
	function getWareHouse(){

		fetch("/KarmaShop/adminController?action=getWarehouse")
		.then(response => response.json())
		.then(data => {
			
			  let container = document.getElementById('tb-wareHouse');
			  var htmls =""
				  if(data.length > 0 ){
					  var htmls = data.map(product => {
					        return `
					        

					        <tr>
					          <th scope="row">1</th>
					          <td>
					          <a style="display: flex;align-content: center;flex-wrap: wrap;justify-content: center;">
					          	 <img src =\${product.thumbnail}>
					              <p style="margin:0 0 0 5px; font-weight: 500 ; height:100% ; line-height: 100%"; >
					              \${product.name}
					               </p>
					          </a>
					           </td>
					          <td>\${product.price} đ</td>
					          <td>\${product.category}</td>
					          <td>\${product.brand}</td>
					          <td>\${product.size}</td>
					          <td>\${product.color}</td>
					           <td style="position: relative; ">
					           <div style="position: relative; display: inline-block;" class="sub" > 
					           <i class="fa-solid fa-ellipsis-vertical"></i>
					          		<div class="sub-nav" style="border: 1px solid black;  max-width: 70px ; text-align:
					          		 center; position: absolute; left: 100% ; top:30px;width:60px;">
					           		<p style="display:inline-block;width: 100% ;padding: 5px 0 ; color: black;"> sửa </>
					           		<p style="display: block;padding: 5px 0;  color: black;"> xóa </p>
					           	</div>
					            </div>
					           
					           </td>
					        </tr>   
					        `
					    });
					container.innerHTML = htmls.join('')
								  
					  
				  } else {
					  
						container.innerHTML = "<h1>Không tìm thấy dữ liệu</h1>"
								  
				  }
		})
			
	}
	
	
	//xử lý active theo danh mục
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
	            		if(goValue === 'wareHouse') {
	            			getWareHouse();
	            		} else if(goValue == "dataCustomer")
	            			getDataCustomer();
	            				
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
<%
	} else {
	%>
	<a class="" href="/KarmaShop/views/login.jsp">Chưa đăng nhập</a>
		<% 
		}
		%>

</html>