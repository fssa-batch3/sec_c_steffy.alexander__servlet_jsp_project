<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.fssa.veeblooms.model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Document</title>
<link rel="stylesheet" href="./assets/css/profile.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
	integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
	crossorigin="anonymous" referrerpolicy="no-referrer">
<link
	href="https://fonts.googleapis.com/css2?family=Carter+One&display=swap"
	rel="stylesheet">
</head>
<body>

	<%
	User user = (User) session.getAttribute("LoggedUser");
	System.out.print(user);

	String mobNum = user.getMobileNumber() != null ? user.getMobileNumber() : "";
	String address = user.getAddress() != null ? user.getAddress() : "";
	%>
	<jsp:include page="./header.jsp"></jsp:include>

	<div class="content">
		<div class="left">
			<div class="leftbox">

				<img class="profile" src="./assets/images/bc.jpeg" alt="profile img">
				<input type="file" id="file"> <label for="file"> <img
					id="editcam" src="./assets/images/photo-camera.png" alt="editimg">
				</label> <br> <br>
				<p class="username" id="displayProfile"></p>
				<!-- <label for="name"> name <input type="text" id="name"></label><br><br>
         <label for="email">Email <input type="text"  id="email"></label> -->
			</div>
			<div class="bottomleft">

				<div class="fstname">
					<i class="fa-solid fa-user"></i>Profile
				</div>
				<a id="create_product" href="/pages/create.html"><div class="secname">
						<i class="fa-solid fa-user"></i>create product
					</div> </a> 
					<a href="./home.jsp">
					<div class="thirdname">
						<i class="fa-solid fa-user"></i>Back to Home
					</div>
				</a>
			</div>
		</div>
		<form id="profile_form" action="./ProfileUpdate" method="post">
			<div class="right">


				<div class="bottomcontent">

					<div class="bottomquote">
						<p id="para">"Happiness blooms where seeds of love and joy are
							planted"</p>
					</div>

					<div class="inputfields">
						<label for="fname">First name<input type="text" required
							id="fname" value="<%=user.getFirstName()%>" name="fname" disabled>
						</label> <br> <label for="lname"> last name <input
							type="text" required id="lname" value="<%=user.getLastName()%>"
							name="lname" disabled>
						</label> <br> <label for="email"> Email <input type="email"
							name="email" id="email" value="<%=user.getEmail()%>" readonly>
						</label> <br> <label for="number"> Mobile.No <input
							type="tel" pattern="[0-9]{10}" id="number" value="<%=mobNum%>"
							disabled name="number" required>



						</label> <br> <label for="address"> Address <input
							type="text" name="address" id="address" required
							value="<%=address%>" disabled>
						</label> <br> <label for="gender">Gender <select
							name="gender" id="gender" required disabled>
								<option value="Male">Male</option>
								<option value="Female">Female</option>
								<option value="Others">Other</option>
						</select>
						</label>

					</div>

				</div>

				<div class="lastcontent">
					<div class="side_one">

						<span id="edit"><img src="./assets/images/edit_icon.avif">Edit</span>
						<button type="submit">
							<img src="./assets/images/update_icon.png">Update
						</button>
						
						
						
						<span id="delete"><img src="./assets/images/delete.png">Delete</span>
						<a href="./LogoutServlet"><span id="logout"> <img id="logout_icon" src="./assets/images/logout_icon.png"> Log Out
						</span></a>

					</div>
					<div>
						<img id="gif" src="./assets/images/img gif.gif" alt="plants">
					</div>
				</div>
		</form>
	</div>


<jsp:include page="./successErrorMsg.jsp"></jsp:include>
</body>
<script src="./assets/js/profile.js"></script>
</html>










