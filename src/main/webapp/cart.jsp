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
</head>
<body>
	<%
	ArrayList<Cart> cartDetails = (ArrayList<Cart>) request.getAttribute("cartDetails");

	%>
	<jsp:include page="header.jsp"></jsp:include>


	<div class="center_content">
		<div class="left_content" id="content">
			<h1>Shopping Cart</h1>

			<%
			Plant plant = null;
			for (Cart cart : cartDetails) {

				plant = PlantDAO.getPlantById(cart.getPlantId());

				
			%>
			 <div class="product" id="product_details">
      <div class="product_img">
        <img src="<%=plant.getPlantImagesUrl().get(0)%>" alt="img">
      </div>
      <div class="details">
        <h4 id="title"><%=plant.getPlantName()%></h4>
        <div class="adding">
          <img name="minus" src="./assets/images/minus.png" class="minus">
          <p name="quantity" class="quantity"><%=cart.getQuantity()%></p>
          <img name="add" src="./assets/images/add.png" class="add" >
        </div>
        <h5 class="price"><%=plant.getPrice()%></h5>
        <img class="remove_cart" src="./assets/images/multiply-mathematical-sign.png">
      </div>
    </div> 
			<%
			}
			%>
			<!-- <hr>
    <div class="product">
      <div class="product_img">
      <img src="/assests/images/beanseed_2.jpg" alt="img">
    </div>
      <div class="details">
      <h4 id="title">Bean Seeds</h4>
      <div class="adding">
      <img src="/assests/images/minus.png">
      <p>2</p>
      <img src="/assests/images/add.png">
    </div>
      <h5 id="ruppees">₹450</h5>
      <img id="remove_cart" src="/assests/images/multiply-mathematical-sign.png">
    </div>
    </div> -->
		</div>

		<div class="right_content">
			<div class="right_content_1">
				<h2 id="summary">Summary</h2>
			
				<h4>Your order</h4>

				<div class="product_order_details"></div>
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

				<div class="right_content_2">
					<div class="product_order_detail">
						<h3 class="sub_total">SubTotal</h3>
						<h3 class="subtotal_value">0</h3>
					</div>
					<div class="product_order_detail">
						<h3 class="shipping">Shipping</h3>
						<h3 class="shipping_value">0</h3>
					</div>
					<hr id="total_hr">
					<div class="product_order_detail">
						<h3 class="total">Total</h3>
						<h3 class="total_value">0</h3>
					</div>
					<a id="proceed_button"><button>Proceed to Checkout</button></a>


					<!-- <div class="total_calculation">
      <p>
        <span>Total</span>
        <span id="total_in_num">340+450=790</span>
      </p>

    </div> -->

				</div>
			</div>
		</div>
		<script src="./assets/js/cart.js"></script>
</body>
</html>






