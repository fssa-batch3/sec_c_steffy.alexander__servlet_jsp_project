<%
String path = "./login.jsp";
String title = "Login";
String imgPath = "./assets/images/login_icon.png";
if (session.getAttribute("LoggedUser") != null) {
	path = "./profile.jsp";
	title = "Profile";
	imgPath = "./assets/images/girl.png";
}
%>

<header>
	<div class="logo">
		<img id="logo_img"
			src="./assets/images/Picsart_22-12-05_14-49-34-612.png" alt="LOGO">
	</div>

	<div class="nav">
		<a id="home_title" href="./home.jsp">Home</a> <a href="./ShowAllPlant">Plants</a>
		<a href="./seeds.jsp">Seeds</a> <a href="./blog.jsp">Blog</a> <a
			id="cart_a" href=""> <img id="cart"
			src="./assets/images/cart logo.png" alt="cart">
		</a> <a id="profile_logo" href="<%=path%>"> <img id="profile_logo"
			src="<%=imgPath%>" alt=""> <span id="login_title"> 
		</span>
		</a>
	</div>
</header>