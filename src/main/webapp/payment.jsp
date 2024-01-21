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
<link
	href="https://fonts.googleapis.com/css2?family=Carter+One&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Alkatra&family=Roboto+Slab&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="./assets/css/payment.css" />
<link rel="stylesheet" href="./assets/css/header.css" />
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>

	<%
	User user = (User) session.getAttribute("LoggedUser");
	System.out.println(user);
	
    
	String userName = "";
	String email = "";
	String address = "";
	String phoneNumber = "";
	double totalPrice = Double.parseDouble(request.getParameter("totalPrice"));
	System.out.println(totalPrice);
	if (user != null) {
		userName = user.getFirstName() + " " + user.getLastName();
		email = user.getEmail();
		address = user.getAddress()!=null?user.getAddress():"";
		phoneNumber = user.getMobileNumber();
		
				}
	%>



	<h3 id="address_head">Address Details</h3>
	<form id="payment_form" action="./PlaceOrder" method="post">

		<label for="fname">Name <input id="fname" type="text" pattern="[A-Za-z ]+"  title="Name should contain only alphabets (A-Z, a-z)" name="name"
			value="<%=userName%>" required />
		</label><br /> <br /> <br /> <label for="Email">Email Address <input
			id="email" type="text" value="<%=email%>" required disabled />
		</label><br /> <br /> <br />
		
		<label for="number"> Mobile.No <input
							type="tel" pattern="^[1-9][0-9]*$" id="number" title="Mobile Phone Should Only Contain Valid Numbers" value="<%=phoneNumber%>"
							 name=number  required>
			</label><br>
			
			
			 <label for="amount">Total price<input
			 autocomplete="off" type="number"
			value="<%=totalPrice %>" 
			inputmode="numerical" placeholder=""
			type="number" data-pattern-validatetype="number" name="phoneNumber"
			required disabled /> <br /> <br /></label><br /> <label for="address">Delivery
			Address</label>
			
			
		<textarea id="address" name="address" required><%=address%></textarea>
		<br /> <br />


		<div class="container">
			<div class="payment">
				<h3>Select a payment method</h3>

		<div class="other_apps">
			<div class="paylater pay">
				<img src="./assets/images/cod.jpg" alt="cod" />
				<div class="upi para">
					<h2>Cash on Delivery</h2>
					<h4>Pay at your Doorstep.</h4>
				</div>
			</div>
			
			
			
			<div class="cash_delivery">
				<p>By choosing cash on delivery, You can pay at your Door Step
					after receiving the product</p>
				<button type="submit">Confirm Order</button>
			</div>

		</div>
		</div>

		</div>
	</form>
	<script src="./assets/js/paymentform.js"></script>

	<jsp:include page="./successErrorMsg.jsp"></jsp:include>
</body>
</html>



