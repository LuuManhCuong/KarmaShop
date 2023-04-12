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
<body style="margin: 200px 40px 0 ">
	<jsp:include page="header.jsp"></jsp:include>

	
          	

	<table class="table" >
  <thead>
    <tr>
      <th scope="col">STT</th>
      <th scope="col">TÊN HÀNG</th>
      <th scope="col">GIÁ</th>
      <th scope="col">TÊN NGƯỜI BÁN</th>
       <th scope="col">SỬA - XÓA</th>
    </tr>
  </thead>
  <tbody>
  
	<c:forEach var="product" items="${dataProduct}">
			
  
    <tr>
      <th scope="row">1</th>
      <td>
      <a style="display: flex;   align-content: center; flex-wrap: wrap; ">
      	 <img src ="http://bold.vn/wp-content/uploads/2019/05/bold-academy-5.jpg">
          <p style="margin:0 0 0 5px; font-weight: 500 ; height:100% ; line-height: 100%"; >
          ${product.name}
           </p>
      </a>
       </td>
      <td>${product.quantity}</td>
      <td>${product.category}</td>
       <td style="position: relative; ">
       <div style="position: relative; display: inline-block;" class="sub" > 
         icon
      		<div class="sub-nav" style="border: 1px solid black;  max-width: 70px ; text-align:
      		 center; position: absolute; left: 100% ; top:30px;width:60px;">
       		<a style="display:inline-block;width: 100% ;padding: 5px 0 ; color: black;"> sửa </a>
       		<a style="display: block;padding: 5px 0;  color: black;"> xóa </a>
       	</div>
        </div>
       
       </td>
    </tr>   
    
   	</c:forEach>
   
  </tbody>
</table>



	<jsp:include page="footer.jsp"></jsp:include>


	<style>
		.sub-nav{
		display:none;
		cursor: pointer;
		z-index: 100;
		background-color: white;
		}
		
		.sub{
			cursor: pointer;
			
		}
		
		.sub:hover{
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
	 </style>
	
	
</body>
</html>