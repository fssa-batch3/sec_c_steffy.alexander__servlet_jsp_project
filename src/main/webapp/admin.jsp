<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link
	href="https://fonts.googleapis.com/css2?family=Carter+One&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
	integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
	crossorigin="anonymous" referrerpolicy="no-referrer">
<link
	href="https://fonts.googleapis.com/css2?family=Alkatra&family=Roboto+Slab&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="assets/css/admin.css">
<title>Document</title>
</head>

<body>
	
 
<%
String path = "./login.jsp";
String title = "Login";
boolean isLogged = false;
String imgPath = "./assets/images/girl.png";
if (session.getAttribute("LoggedUser") != null) {
	path = "./Profile";
	isLogged = true;

}
%>
<header>
	<div class="logo">
		<img id="logo_img"
			src="./assets/images/Picsart_22-12-05_14-49-34-612.png" alt="LOGO">
	</div>

	<div class="nav">
		<a id="home_title" href="./admin.jsp">Home</a> <a href="./ShowAllPlant">View All Plants</a>
		

		<%
		if (isLogged == true) {
		%>

		<a id="profile_logo" href="<%=path%>"><img id="profile_logo"
			src="<%=imgPath%>" alt=""> </a>
		<%
		} else {
		%>
		<a href="./login.jsp" id='log'> <span id="login_title">Login</span>
		</a>

		<%
		}
		%>
	
		
		


	</div>
</header>



	<div class="main">
		<h3>Find yourself a green friend</h3>
		<p>Discover your ideal plant companion for a flourishing ambiance</p>
		<a href="./home.jsp" ><button>Go to home</button></a>
		<img src="./assets/images/peace.png">
		<div class="boxes">
			<div class="box">
				<p>Peace Lily</p>
				<img src="./assets/images/lily.png">
			</div>
			<div class="box">
				<p>Jasmine Flower</p>
				<img src="./assets/images/colour-flower.png">
			</div>
			<div class="box">
				<p>Violet Flower</p>
				<img id="box3" src="./assets/images/violet-flower.png">
			</div>
			<div class="box">
				<p>Red Anthurium</p>
				<img id="box4" src="./assets/images/red-anthurium.png">
			</div>
		</div>
	</div>


	<div class="add_product">
		<div class="left">
			<h2 id="add_manage">Add and Manage Your Products</h2>
			<div class="edit_btn">
				
				<a href="./createplant.jsp" ><button id="manage_btn">Manage Product</button></a>
			</div>
		</div>
		<div class="image_bc">
			<img id="update_img" src="./assets/images/Update-rafiki.png">
		</div>
	</div>
</body>
</html>



