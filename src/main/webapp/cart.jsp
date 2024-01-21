<%@page import="com.fssa.veeblooms.service.PlantService"%>
<%@page import="com.fssa.veeblooms.dao.PlantDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.fssa.veeblooms.model.*"%>
<%@ page import="com.fssa.veeblooms.dao.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Document</title>
<link
	href="https://fonts.googleapis.com/css2?family=Carter+One&display=swap"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
	integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="./assets/css/cart.css" />
<link rel="stylesheet" href="./assets/css/header.css" />
</head>

<body>


	<%
	ArrayList<Cart> cartDetails = (ArrayList<Cart>) request.getAttribute("cartDetails");
	%>
	<jsp:include page="header.jsp"></jsp:include>


<div class="container">
<p>
Shopping Cart
</p>
</div>
<%if(cartDetails.size()!=0){
	
%>

	<div class="cartContents">

		<div class="cartContent">
			<div class="plantDetails leftAlign">Plant</div>
			<div class="plantPriceDetails">
				<div class="plantPriceDiv heading">Price</div>
				<div class="plantQuantityDiv heading">Quantity</div>
				<div class="plantTotalPrice heading">Total</div>
				<div class="plantRemove heading">Remove</div>
			</div>
		</div>


		<%
		Plant plant = null;
		double totalPrice =0;
		for (Cart cart : cartDetails) {
			totalPrice+=cart.getTotalAmount();

			plant = PlantDAO.getPlantById(cart.getPlantId());
		%>
		<div class="cartContent">
			<div class="plantDetails">
				<img src="<%=plant.getPlantImagesUrl().get(0)%>" alt="" />
				<%=plant.getPlantName()%>
			</div>
			<div class="plantPriceDetails">
				<div class="plantPriceDiv">
					&#8377;
					<%=plant.getPrice()%></div>
				<div class="plantQuantityDiv">
					<img name="minus" src="./assets/images/minus.png" class="minus"
						key=<%=cart.getCartId()%> quantity=<%=cart.getQuantity()%>>
					<p><%=cart.getQuantity()%></p>

					<img name="add" src="./assets/images/add.png" class="add"
						key=<%=cart.getCartId()%> quantity=<%=cart.getQuantity()%>>
				</div>
				<div class="plantTotalPrice">
					&#8377;
					<%=plant.getPrice() * cart.getQuantity()%></div>
				<div class="plantRemove">
					<img class="remove_cart" key=<%=cart.getCartId()%>
						src="./assets/images/multiply-mathematical-sign.png">
				</div>
			</div>
		</div>


		<%
		}
		%>
		<br>
			

		<div class="cartContent">
			<div class="plantDetails">
				
			</div>
		
			<div class="plantPriceDetails">
				<div class="plantPriceDiv">
					</div>
				<div class="plantQuantityDiv">
				Total Summary 
				</div>
				<div class="plantTotalPrice">
					&#8377; 
					<%=totalPrice%></div>
				<div class="plantRemove">
					<a href="./payment.jsp?totalPrice=<%=totalPrice%>"
						id="proceed_button"><button>Proceed to Checkout</button></a>
				</div>
			</div>
		</div>
	</div>
	<% 
}
else{
	

	%>

	
	<div class="emptyCart">
	<img src="./assets/images/empty_cart.png" alt="empty cart">
	</div>
	
		<%
		}
		%>	

	<script src="./assets/js/cart.js"></script>
</body>
</html>






