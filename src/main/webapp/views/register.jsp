<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta name="robots" content="noindex, nofollow">

<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">

<style type="text/css">
body {
	padding-top: 30px;
	display: flex;
	justify-content: center;
}

.form-control {
	margin-bottom: 10px;
}
</style>

</head>
<body>

	<%
	String baoLoi = request.getAttribute("baoLoi") + "";
	baoLoi = (baoLoi.equals("null")) ? "" : baoLoi;

	String username = request.getAttribute("username") + "";
	username = (username.equals("null")) ? "" : username;

	String password = request.getAttribute("password") + "";
	password = (password.equals("null")) ? "" : password;

	String email = request.getAttribute("email") + "";
	email = (email.equals("null")) ? "" : email;

	String phone = request.getAttribute("phone") + "";
	phone = (phone.equals("null")) ? "" : phone;

	String address = request.getAttribute("address") + "";
	address = (address.equals("null")) ? "" : address;

	String gender = request.getAttribute("gender") + "";
	gender = (gender.equals("null")) ? "" : gender;
	%>


	<div class="container">

		<div class="col-xs-12 col-sm-12 well well-sm">
			<legend>
				<a href="http://www.jquery2dotnet.com"><i
					class="glyphicon glyphicon-globe"></i></a> Sign up!
			</legend>

			<form action="/KarmaShop/Register" method="post" class="form"
				role="form">
				<input class="form-control" name="username" id="username"
					placeholder="User name" type="text" required="required"
					value="<%=username%>" />
				<div class="row">
					<div class="col-xs-6 col-md-6">
						<input class="form-control" name="password" id="password"
							placeholder="Password" type="password" required="required"
							onkeyup="kiemTraMatKhau()" />
					</div>
					<div class="col-xs-6 col-md-6">
						<input class="form-control" name="confirmPassword"
							id="confirmPassword" placeholder="Confirm password"
							type="password" required="required" onkeyup="kiemTraMatKhau()" />
						<p id="msg" style="color: red" />


					</div>
				</div>

				<input class="form-control" name="email" id="email"
					placeholder="Your Email" type="email" required="required"
					value="<%=email%>" /> <input class="form-control" name="phone"
					id="phone" placeholder="Phone number" type="text"
					required="required" value="<%=phone%>" /> <input
					class="form-control" name="address" id="address"
					placeholder="Your address" type="text" required="required"
					value="<%=address%>" />


				<div>
					<label for="gender"></label> <select
						style="color: grey; height: 30px; border: 1px solid grey; border-radius: 5px"
						class="form-select" id="gender" name="gender">
						<option selected>Gender</option>
						<option value="male"
							<%=(gender == "male") ? "selected='selected'" : ""%>>male</option>
						<option value="female"
							<%=(gender == "female") ? "selected='selected'" : ""%>>female</option>
						<option value="other"
							<%=(gender == "other") ? "selected='selected'" : ""%>>other</option>
					</select>
				</div>

				<br />
				<div class="form-check mb-3">
					<input class="form-check-input" type="checkbox" id="dieuKhoan"
						name="dieuKhoan" required="required" onchange="xuLyDongY()">
					<label class="form-check-label" for="dieuKhoan"> Đồng ý với
						<a href="#">điều khoản của WebShop</a> <span style="color: red">*</span>
					</label>
				</div>
				<br />

				<button class="btn btn-lg btn-primary btn-block" type="submit"
					id="submit" style="visibility: hidden">Sign up</button>
			</form>

		</div>

	</div>



	<script
		src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</body>

<script type="text/javascript">
	function kiemTraMatKhau() {
		password = document.getElementById('password').value;
		confirmPassword = document.getElementById('confirmPassword').value;
		if (password != confirmPassword) {
			document.getElementById("msg").innerHTML = "Mật khẩu không khớp";
			return false;
		} else {
			document.getElementById("msg").innerHTML = "";
			return true;
		}

	}

	function xuLyDongY() {
		dieuKhoan = document.getElementById("dieuKhoan");
		if (dieuKhoan.checked == true) {
			document.getElementById("submit").style.visibility = "visible";
		} else {
			document.getElementById("submit").style.visibility = "hidden";
		}

	}
</script>

</html>