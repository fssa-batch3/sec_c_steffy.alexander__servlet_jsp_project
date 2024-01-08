
<%
String path = "./login.jsp";
String title = "Login";
boolean isLogged = false;
String imgPath = "./assets/images/girl.png";
String isAdmin = (String) session.getAttribute("isAdmin");
String homePath = "./home.jsp";

if (session.getAttribute("LoggedUser") != null) {
	path = "./Profile";
	isLogged = true;
}

if (isAdmin == "true") {
%>
<header>
	<div class="logo">
		<a href="./home.jsp"><img id="logo_img"
			src="./assets/images/Picsart_22-12-05_14-49-34-612.png" alt="LOGO"></a>
	</div>

	<div class="nav">
		<a id="home_title" href="./admin.jsp">Home</a> <a
			href="./ShowAllPlant">View All Plants</a> <a href="./GetAllOrders">View
			All orders</a>

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
<%
} else {
%>

<header>
	<div class="logo">
		<img id="logo_img"
			src="./assets/images/Picsart_22-12-05_14-49-34-612.png" alt="LOGO">
	</div>

	<div class="nav">
		<a id="home_title" href="<%=homePath%>">Home</a> <a
			href="./ShowAllPlant">Plants</a>

		<%
		if (isLogged == true) {
		%>

		
			<a href="./CartDetails">Cart</a>
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

		<%
		if (isLogged == true) {
		%>
		<a href="./OrderHistory">Order History </a>
		<%
		} else {
		%>

		<%
		}
		%>


	</div>
</header>

<%
}
%>