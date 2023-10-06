<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Document</title>
<link rel="stylesheet" href="./assets/css/signup.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
	integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
	<div class="main">
		<div class="signup">
			<h2>Sign up</h2>

			<div class="icons">
				<i id="iconlog" class="fa-brands fa-facebook"></i> <i id="iconlog"
					class="fa-brands fa-twitter"></i> <i id="iconlog"
					class="fa-brands fa-google-plus-g"></i>
			</div>
		</div>
		<form action="./Signup" method="post">
			<label> <i id="loglog" class="fa-solid fa-child-dress"></i> <input
				type="text" name="fname" placeholder="First Name..." pattern="[a-zA-Z]+" title="Name should only contain alphabets/ max len of 45"
				id="fname" required /></label> <br />
				 <label> <i id="loglog"
				class="fa-solid fa-child-dress"></i> <input type="text"
				placeholder="Last Name..." name="lname" pattern="[a-zA-Z]+" id="lname" title="Name should only contain alphabets/ max len of 45"/>
			</label> <br /> 
			<label> <i id="loglog" class="fa-solid fa-envelope"></i>
				<input type="email" placeholder="Email..." name="email" id="email" title="email must only consists of gmail.com"
				pattern="/^(?=.{1,44}$)[A-Za-z0-9._%+-]+@[A-Za-z.-]+\.[A-Za-z]{2,}$/"  maxlength=44 title="Email must have Length Limitation (Up to 44 Characters)" required />
			</label> <br />
			 <label> <i id="loglog" class="fa-solid fa-lock"></i>
				<input type="password" placeholder="Password..." name="password" id="password"
				title="Enter a uppercase, a lowercase, a number/special character"
				pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*_=+-]).{8,24}$"
				
				required /></label> <br /> 
				<label> <i id="loglog"
				class="fa-solid fa-lock"></i> <input type="password"
				placeholder="Confirm Password..." id="confirmpass" name="confirmpass" required />
			</label> <br /> <br /> <br /> <a href="./login.jsp">Already have an
				account?</a> <br /> <br />
			<button type="submit">GET STARTED</button>
		</form>
	</div>

<jsp:include page="./successErrorMsg.jsp"></jsp:include>
</body>

</html>
