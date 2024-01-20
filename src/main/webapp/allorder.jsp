<%@page import="com.fssa.veeblooms.model.User"%>
<%@page import="com.fssa.veeblooms.dao.UserDAO"%>
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

<link rel="stylesheet" href="./assets/css/allorder.css" />
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="./header.jsp"></jsp:include>
	<h3 id="heading">Ordered Products :</h3>
	<%
	ArrayList<Order> getallorder = (ArrayList<Order>) request.getAttribute("getallorder");
	%>

	<div class="main">

		<div class="center">
			<%
			if (getallorder != null) {
				for (Order order : getallorder) {

					for (OrderedProduct product : order.getProductsList()) {
				Plant plant = PlantDAO.getPlantById(product.getProductId());
			%>


			<div class="outcontent">
				<p class="status"><%=order.getStatus()%></p>
				<div class="content">
					<div class="leftContent">
						<img src=<%=plant.getPlantImagesUrl().get(0)%> alt="" />
					</div>
					<div class="rightContent">
						<div class="rightContent_header">

							<h2 name="OrderId"><%=plant.getPlantName()%></h2>
							<p>
								&#x20b9;
								<%=plant.getPrice()%></p>
						</div>


						<div class="rightContent_footer">
							<div>
								<p>
									Quantity :<span><%=product.getQuantity()%></span>
								</p>
								<p>
									User Id <span name="orderId"><%=order.getUserID()%></span>
								</p>
								<p>
									Order on <span><%=order.getOrderedDate()%></span>
								</p>

							</div>
							<p class="viewOrderDetails ">View Order Details</p>
						</div>
					</div>
				</div>
			</div>

			<%
			}
			}
			}
			%>

		</div>


		<div class="rightoutcontent">
			<%
			if (getallorder != null) {
				User user;
				for (Order order : getallorder) {
					for (OrderedProduct product : order.getProductsList()) {

					user = UserDAO.getUserById(order.getUserID());
			%>
			<div class="orderDetails">
				<h3>Order Details</h3>
				<div class="orderDetailsContent">
					<p name="orderId">
						Name : <span><%=user.getFirstName()%> <%=user.getLastName()%></span>
					</p>
					<p>
						email id : <span><%=user.getEmail()%></span>
					</p>
					<p>
						Mobile number : <span><%=order.getPhoneNumber()%></span>
					</p>
					<p>
						Address : <span> <%=order.getAddress()%>
						</span>
					</p>
					<span> <%
 if (order.getStatus().toString().equals("ORDERED")) {
 %>
						<p id="statusorder">
							Ordered on
							<%=order.getModifiedDate()%>
							<a href="ProductShipped?orderId=<%=order.getOrderId()%>"
								style="background-color: #3b71ca; color: white;">Mark as
								Shipped</a>
						</p> <%
 } else if (order.getStatus().toString().equals("SHIPPED")) {
 %>
						<p id="statusorder">
							Shipped on
							<%=order.getModifiedDate()%>

							<a href="DeliveredOrder?orderId=<%=order.getOrderId()%>"
								style="background-color: #3fa32f; color: white;">Mark as
								Delivered </a>

						</p> <%
 } else if (order.getStatus().toString().equals("DELIVERED")) {
 %>
						<p id="statusdeliver">
							Delivered on :
							<%=order.getModifiedDate()%>
						</p> <%
 } else {
 %>
						<p id="statuscancel">
							Cancelled on :
							<%=order.getModifiedDate()%>
						</p> <%
 }
 %>
					</span>
				</div>
			</div>

			<%
					}
			}
			}
			%>
		</div>
	</div>



	<script src="./assets/js/allorder.js"></script>
	<jsp:include page="./successErrorMsg.jsp"></jsp:include>


</body>
</html>