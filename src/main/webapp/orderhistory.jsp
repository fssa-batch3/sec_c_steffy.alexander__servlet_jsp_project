<%@page import="com.fssa.veeblooms.model.Plant"%>
<%@page import="com.fssa.veeblooms.dao.PlantDAO"%>
<%@page import="com.fssa.veeblooms.model.OrderedProduct"%>
<%@page import="com.fssa.veeblooms.model.Order"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="./assets/css/orderhistory.css" />
<link
	href="https://fonts.googleapis.com/css2?family=Carter+One&display=swap"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet" />
<link rel="stylesheet" href="./assets/css/header.css" />
<title>Document</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<%
	ArrayList<Order> orderDetails = (ArrayList<Order>) request.getAttribute("orderDetails");

	System.out.print(orderDetails + "got");
	%>

	
<div class="container">
<p>
My Orders
</p>
</div>

	

		<div class="orderContents">

			<%
		for (Order order : orderDetails) {
%>
			<div class="orderContent">
				<div class="orderHeading flex">
					<div class="orderedOn">
						<h4 id="heading">
						<%=order.getStatus().toString() %>
						 on :<span id="date"> <%=order.getModifiedDate() %></span>
						</h4>
						<p id="name">By <%%>Steffy</p>
					</div>
					<div class="totalNoProducts">
						<h3 id="Quantity">Qt: <span id="valnum"><%=order.getProductsList().size() %></span></h3>
					</div>
					<div class="totalPrice">
						<h3>&#x20b9; <%=order.getTotalAmount() %> /-</h3>
					</div>
					<img class="dropDown" src="./assets/images/dropdown.png" />
				</div>

				<div class="orderContentDetails">
					<% 
			
			
			for (OrderedProduct product : order.getProductsList()) {

				Plant plant = PlantDAO.getPlantById(product.getProductId());
		%>

					<div class="outcontent">
						<p class="status"><%=order.getStatus() %></p>
						<div class="content">
							<div class="leftContent">
								<img src="<%=plant.getPlantImagesUrl().get(0) %>" alt="" />
							</div>
							<div class="rightContent">
								<div class="rightContent_header">
									<h2 name="OrderId"><%=plant.getPlantName() %></h2>
									<p>&#x20b9; <%=product.getProductPrice()*product.getQuantity()%></p>
								</div>

								<div class="rightContent_footer">
									<div>
										<p>
											Quantity :<span><%=product.getQuantity() %></span>
										</p>

										<p>
											Order on <span><%=order.getOrderedDate() %></span>
										</p>
										<p>
											Product price <span><%=plant.getPrice() %></span>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<%
			}
			%>
				</div>
				</div>
				<%
			}
			%>
			
		</div>

	
	<jsp:include page="./successErrorMsg.jsp"></jsp:include>
	<script src="./assets/js/orderHistory.js"></script>
</body>
</html>




