<%@page import="com.fssa.veeblooms.model.Plant"%>
<%@page import="com.fssa.veeblooms.dao.PlantDAO"%>
<%@page import="com.fssa.veeblooms.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Document</title>
<link
	href="https://fonts.googleapis.com/css2?family=Carter+One&display=swap"
	rel="stylesheet" />
<link rel="stylesheet" href="assets/css/payment.css" />
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>

	<%
	User user = (User) session.getAttribute("LoggedUser");
	System.out.print(user);
	int plantId =Integer.parseInt(request.getParameter("productId"));
	Plant plant = PlantDAO.getPlantById(plantId);
	
	String userName = "";
	String email = "";
	String address = "";
	String phoneNumber = "";
	if (user != null) {
		userName = user.getFirstName() + user.getLastName();
		email = user.getEmail();
		address = user.getAddress();
		phoneNumber = user.getMobileNumber();
	}
	%>
	<h1>Payment Page</h1>
	<h3 id="address_head">Address Details</h3>
	<form id="payment_form" action="./BuyProduct?plantId=<%=plantId%>" method="post">
		<label for="fname">Name <input id="fname"
			type="text" value="<%=userName%>" required  />
		</label><br /> <br />
		<br /> <label for="Email">Email Address <input
			id="email" type="text" value="<%=email%>" required readonly />
		</label><br /> <br />
		<br /> 
		
		
		<label for="number">Phone Number <input
			id="phone_num" autocomplete="off"
			oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
			type="number" value="<%=phoneNumber%>" maxlength="10" minlength="10"
			inputmode="numerical" placeholder="" type="number"
			data-pattern-validatetype="number" name="phoneNumber" required /> <br />
		<br /></label><br />
		
<label for="address">Delivery Address</label>
<textarea id="address" name="address" required><%= address %></textarea>
<br />
<br />


		<button id="buy_now" type="submit">Buy now</button>




		<!-- <div class="last">
            <a href="payment2.html" id="submit">Next</a>
          </div> -->
	</form>

	

		
	</div>
</body>
</html>



