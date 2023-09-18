<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="./assets/css/order.css" />
    <link
      href="https://fonts.googleapis.com/css2?family=Carter+One&display=swap"
      rel="stylesheet"
    />
    <link
      href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700;800;900&display=swap"
      rel="stylesheet"
    />
    <title>Document</title>
  </head>
<body>
<jsp:include page="header.jsp"></jsp:include>
    <h1 class="heading">Order History</h1>
    <h3 class="all_orders">All Orders</h3>
    <div class="order">
      <div class="titles">
        <p class="id">ID</p>
        <!-- <p class="name">Name</p> -->
        <p class="product">Product</p>
        <p class="quantity">Quantity</p>
        <p class="price">Total Price</p>
        <p class="delivery_address">Delivery address</p>
        <p class="ordered_date">Ordered date</p>
        <p class="expected_date">Expected Delivery Date</p>
        <p class="delivered_date">Delivered Date</p>
        <p class="status">Status</p>
      </div>


    </div>
</body>
</html>



  