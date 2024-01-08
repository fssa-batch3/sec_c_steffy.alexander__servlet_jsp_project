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
	System.out.print(user);
	

	String userName = "";
	String email = "";
	String address = "";
	String phoneNumber = "";
	if (user != null) {
		userName = user.getFirstName() + " " + user.getLastName();
		email = user.getEmail();
		address = user.getAddress()!=null?user.getAddress():"";
		phoneNumber = user.getMobileNumber();
	}
	%>



	<h3 id="address_head">Address Details</h3>
	<form id="payment_form" action="./PlaceOrder"
		method="post">



		<label for="fname">Name <input id="fname" type="text" pattern="[A-Za-z ]+"  title="Name should contain only alphabets (A-Z, a-z)"
			value="<%=userName%>" required />
		</label><br /> <br /> <br /> <label for="Email">Email Address <input
			id="email" type="text" value="<%=email%>" required disabled />
		</label><br /> <br /> <br />
		
		<label for="number"> Mobile.No <input
							type="tel" pattern="^[1-9][0-9]*$" id="number" value="<%=phoneNumber%>"
							 name=number  required>
			</label><br>
			
			
			 <label for="amount">Total price<input
			 autocomplete="off" type="number"
			value="0000" 
			inputmode="numerical" placeholder=""
			type="number" data-pattern-validatetype="number" name="phoneNumber"
			required disabled /> <br /> <br /></label><br /> <label for="address">Delivery
			Address</label>
			
			
		<textarea id="address" name="address" required><%=address%></textarea>
		<br /> <br />







		<!-- <h3><img src="../assests/images/blacktomato.jpg" alt="images">
        Hibiscus</h3>
        <div class="multiply">
          <span class="quantity">3 x</span>
          <span class="actual_price">100</span>
        </div>
        <p class="total_price">300</p>
      </div> -->
		<!-- <div class="product_order_detail">
        <h3>Hibiscus</h3>
        <div class="multiply">
          <span class="quantity">3 x</span>
          <span class="actual_price">100</span>
        </div>
        <p class="total_price">300</p>
      </div> -->




		<!-- <div class="total_calculation">
      <p>
        <span>Total</span>
        <span id="total_in_num">340+450=790</span>
      </p>

    </div> -->



		<!-- <div class="last">
            <a href="payment2.html" id="submit">Next</a>
          </div> -->
          


		<div class="container">
			<div class="payment">
				<h3>Select a payment method</h3>
			<!-- 	<a class="card pay click"> <img
					src="./assets/images/card icon.png" alt="card" />
					<div class="card para">
						<h2>Card</h2>
						<h4>Visa, Mastecard, RuPay and Maestro</h4>
					</div>
				</a>
 -->
		

		

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
			
			
			
			
			
			
			
			
			<!-- <div class="upipay pay">
				<img src="./assets/images/UPI_icon.png" alt="upi" />
				<div class="upi para">
					<h2>UPI</h2>
					<h4>Pay with installed app, or use others</h4>
				</div>
			</div>
			<div class="upi_trans">
				<div class="icons">
					<img id="gpay" src="./assets/images/gpay_icon.png" alt="gpay" /> <img
						id="paytm" src="./assets/images/paytm_logo.png" alt="paytm" /> <img
						src="./assets/images/phonepe.png" alt="phonepe" />
				</div>
				<label for="upi_id">Enter your UPI Id <input type="email"
					id="upi_id" placeholder="robert@oksbibank" /></label>

				<button type="submit">Place Order</button>
			</div>-->
		</div>
		</div>

		<!--   <div class="pro_details">
        <h2>Price details</h2>
        <hr />
        <div class="price">
          <p>Price ( <span id="num_items"> 1 </span> item)</p>
          <p>₹<span class="rs">200</span></p>
        </div>
        <div class="delivery_charges">
          <p>Delivery Charges</p>
          <p>FREE</p>
        </div>
        <hr />
        <div class="amount_payable">
          <p>Total Amount Payable</p>
          <p>₹<span class="rs">200</span></p>
        </div>
      <a  id="order_history" href="/pages/order.html">Want to see Order history?</a>

      </div>-->
		</div>
	</form>
	<script src="./assets/js/paymentform.js"></script>

	<jsp:include page="./successErrorMsg.jsp"></jsp:include>
</body>
</html>



