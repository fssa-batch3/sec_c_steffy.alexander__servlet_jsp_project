
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
		<a id="home_title" href="./home.jsp">Home</a> <a href="./ShowAllPlant">Plants</a>


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