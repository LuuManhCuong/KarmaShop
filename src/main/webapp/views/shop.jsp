<%@page import="models.user"%>
<%@page import="java.util.ArrayList"%>
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

<%
String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
		+ request.getContextPath();

user currentUser = (user) session.getAttribute("usernew");
String idCurrentUser = currentUser != null ? currentUser.getIdUser() : "";
%>
<script src="<%=url%>/javaScript/script.js"></script>


</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>



	<div class="shop text-center">
		<div class="row">
			<div class="col col-lg-3 side-bar">

				<form>
					<label>Chọn danh mục:</label>
					<div>
						<input type="radio" id="category0" name="category" checked
							value="All"> <label for="category0">All</label>
					</div>
					<div>
						<input type="radio" id="category1" name="category" value="Men">
						<label for="category1">Men</label>
					</div>
					<div>
						<input type="radio" id="category2" name="category" value="Women">
						<label for="category2">Women</label>
					</div>
					<div>
						<input type="radio" id="category3" name="category" value="Kids">
						<label for="category3">Kids</label>
					</div>

					<label>Chọn brand:</label>
					<div>
						<input type="checkbox" id="brand1" name="brand" value="Nike">
						<label for="brand1">Nike</label>
					</div>
					<div>
						<input type="checkbox" id="brand2" name="brand" value="Puma">
						<label for="brand2">Puma</label>
					</div>
					<div>
						<input type="checkbox" id="brand3" name="brand" value="Van">
						<label for="brand3">Van</label>
					</div>


					<label>Chọn size:</label>
					<div>
						<input type="checkbox" id="size1" name="size" value="M"> <label
							for="size1">M</label>
					</div>
					<div>
						<input type="checkbox" id="size2" name="size" value="S"> <label
							for="size2">S</label>
					</div>
					<div>
						<input type="checkbox" id="size3" name="size" value="L"> <label
							for="size3">L</label>
					</div>
				</form>



			</div>


			<div class="col col-lg-9 block-product">
				<div class="container text-center">
					<div class="row" id="shop-container">


						<c:forEach var="product" items="${dataProduct}">

							<div class="col">
								<div class="card" style="width: 18rem;">
									<div class="label">
										<p>${product.category}</p>
										<p>${product.brand}</p>
										<p>${product.size}</p>
									</div>
									<button class="like">
										<i class="fa-regular fa-heart"></i> <i
											class="fa-solid fa-heart"></i>
									</button>
									<img src="${product.thumbnail}" class="card-img-top" alt="img">
									<div class="card-body">
										<h5 class="card-title">${product.name}</h5>
										<p class="card-text">${product.description}</p>


										<div class="buy-btn">
											<button class="buynow-btn btn btn-primary">Buy Now</button> 
											<button
												onclick="addCart(<%=idCurrentUser%>, ${product.idProduct})"
												class="addcart-btn btn btn-primary">Add To Cart</button>
										</div>
									</div>
								</div>
							</div>

						</c:forEach>
						-

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


	<script type="text/javascript">
	

	function addCart(idUser, idProduct){
		console.log("add : ", idUser, idProduct)
		fetch("/KarmaShop/mainController?action=addCart", {
			  method: 'POST',
			  headers: {
			    'Content-Type': 'application/json'
			  },
			  body: JSON.stringify({
			    idUser: idUser,
			    idProduct: idProduct,
			  })
			})
			.then(response => response.json())
			.then(data => console.log(data))
			.catch(err => console.log("addCart err"))
	}
	
	function callApi(url, category, brands, sizes){
		<%--console.log( "fetch: ", "\"" + url + "\"")--%>
		fetch("/KarmaShop/filterController", {
			  method: 'POST',
			  headers: {
			    'Content-Type': 'application/json'
			  },
			  body: JSON.stringify({
			    category: category,
			    brands: brands,
			    sizes: sizes,
			  })
			})
			.then(response => response.json())
			.then(data => {
			  // Xử lý kết quả trả về ở đây
			  let container = document.getElementById('shop-container');
			  console.log(container)
			  var htmls =""
			  if(data.length > 0 ){
				  console.log("render")
				  var htmls = data.map(product => {
				        return `
				        <div  class="col">
						<div class="card" style="width: 18rem;">
							<div class="label">
							<p>\${product.category}</p>
								<p>\${product.brand}</p>
								<p>\${product.size}</p>
							</div>
							<button class="like">
								<i class="fa-regular fa-heart"></i>
								<i class="fa-solid fa-heart"></i> 
							</button>
							<img src=\${product.thumbnail} class="card-img-top" alt="img">
							<div class="card-body">
								<h5 class="card-title">\${product.name}</h5>
								<p class="card-text">\${product.description}</p>


								<div class="buy-btn">
									<a href="#" class="btn btn-primary">Buy Now</a> 
									<button
									onclick="addCart(<%=idCurrentUser%>, \${product.idProduct})"
									class="addcart-btn btn btn-primary">Add To Cart</button>
								</div>
							</div>
						</div>
					</div>

				        `
				    });
				container.innerHTML = htmls.join('')
							  
				  
			  } else {
				  
					container.innerHTML = "<h1>Không tìm thấy dữ liệu</h1>"
							  
			  }
			  
   
			  
			})
			.catch(error => {
			  console.error('Lỗi:', error);
			});
	}
	
	
	
	const radioButtons = document.querySelectorAll('input[type="radio"]');
	radioButtons.forEach(radioButton => {
	  radioButton.addEventListener('click', () => {
		// Lấy giá trị của các checkbox được chọn
		    const checkedCategories = document.querySelectorAll('input[name="category"]:checked');
		
		    const checkedBrands = document.querySelectorAll('input[name="brand"]:checked');
		    const checkedSizes = document.querySelectorAll('input[name="size"]:checked');
		    
		    const category = Array.from(checkedCategories).map(category => category.value);
		    
		    if(category[0] === "All") {
		    	console.log("uncheck")
		    	checkedBrands.forEach((brand) => {
		    		  brand.checked = false;
		    		});
		    	checkedSizes.forEach((brand) => {
		    		  brand.checked = false;
		    		});
		    	// Gửi giá trị lên server để filter
			   callApi("",category, [], [])
		    } else {
		    	
			    const brands = Array.from(checkedBrands).map(brand => brand.value);
			    const sizes = Array.from(checkedSizes).map(size => size.value);
		    
			    let url = "/filter?category=" + category + "&brands=" + brands.join(',') + "&sizes=" + sizes.join(',')
		
			 // Gửi giá trị lên server để filter
			  	callApi(url, category, brands, sizes)
		   }
		    
	    
	    
	  });
	});

	const checkboxes = document.querySelectorAll('input[type="checkbox"]');
	checkboxes.forEach(checkbox => {
	  checkbox.addEventListener('click', () => {
	    // Lấy giá trị của các checkbox được chọn
	    const checkedCategories = document.querySelectorAll('input[name="category"]:checked');
	    const checkedBrands = document.querySelectorAll('input[name="brand"]:checked');
	    const checkedSizes = document.querySelectorAll('input[name="size"]:checked');
	    
	    const category = Array.from(checkedCategories).map(category => category.value);
	    const brands = Array.from(checkedBrands).map(brand => brand.value);
	    const sizes = Array.from(checkedSizes).map(size => size.value);
	    
	 
	    
	    let url = "/filter?category=" + category + "&brands=" + brands.join(',') + "&sizes=" + sizes.join(',')

	 // Gửi giá trị lên server để filter
	  	callApi(url, category, brands, sizes)
	    
	  });
	});
	</script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N"
		crossorigin="anonymous"></script>
</body>
</html>