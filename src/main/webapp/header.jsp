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
			</a> <a id="profile_logo"
				href="<%=session.getAttribute("LoggedUser") != null && (Boolean) session.getAttribute("LoggedUser") ? "./profile.jsp"
		: "./login.jsp"%>">
				<img id="profile_logo"
				src="<%=session.getAttribute("LoggedUser") != null && (Boolean) session.getAttribute("LoggedUser")
		? "./assets/images/girl.png"
		: "./assets/images/login_icon.png"%>"
				alt=""> <span id="login_title"> <%=session.getAttribute("LoggedUser") != null && (Boolean) session.getAttribute("LoggedUser") ? "Profile"
		: "Login"%>
			</span>
			</a>




		</div>
	</header>