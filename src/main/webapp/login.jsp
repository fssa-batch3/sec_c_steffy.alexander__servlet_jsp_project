<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Document</title>
<link rel="stylesheet" href="./assets/css/login.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
	integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
	crossorigin="anonymous" referrerpolicy="no-referrer">
</head>
<body>
	<form action="./LoginServlet" method="get">
		<div class="main">
			<div class="login">
				<h2>Login</h2>
				<div class="icons">
					<i id="iconlog" class="fa-brands fa-facebook"></i> <i id="iconlog"
						class="fa-brands fa-twitter"></i> <i id="iconlog"
						class="fa-brands fa-google-plus-g"></i>
				</div>
			</div>

			<label> <i id="loglog" class="fa-solid fa-envelope"></i> <input
				type="email" placeholder="Email..." id="email" name="email" required>
			</label> <br> 
			<label> <i id="loglog" class="fa-solid fa-lock"></i>
				<input type="password" placeholder="Password..." id="password"
				title="Enter a uppercase, a lowercase, a number/special character"
				pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$" name="password"
				required>
			</label><br> 
<a id="account" href="./signup.jsp">don't have an account?</a> <br> <br> <br>


			<button type="submit">Submit</button>
			
			
		</div>

	</form>
</body>
</html>








