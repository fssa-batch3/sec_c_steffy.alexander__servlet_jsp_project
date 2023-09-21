<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
  <title>Document</title>
  <link href="https://fonts.googleapis.com/css2?family=Carter+One&display=swap" rel="stylesheet" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
    integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link rel="stylesheet" href="./assets/css/cart.css" />
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<div class="center_content">
    <div class="left_content" id="content">
      <h1>Shopping Cart</h1>
     
    <div class="product" id="product_details">
      <div class="product_img">
      <img src="./assets/images/beanseed_2.jpg" name="productimage" alt="img">
    </div>
      <div class="details">
      <h4 id="title" name="productname">Bean Seeds</h4>
      <div class="adding">
      <img src="./assets/images/minus.png">
      <p name="quantity">1</p>
      <img src="./assets/images/add.png">
    </div>
      <h5 id="ruppees" name="price">₹450</h5>
      <img id="remove_cart" name="removecart" src="./assets/images/multiply-mathematical-sign.png">
    </div>
    </div>  
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
        <!-- <div class="total_products">
      <h5 id="product">Product</h5>
      <h5 id="quantity">Quantity</h5>
      <h5 id="price">Price</h5>
    </div> -->
        <!--
 <div class="values">
      <p id="product">Dieffenbranchia</p>
      <p id="quantity">3x100</p>
      <p id="price">300</p> -->
        <!-- <p>300</p> -->
        <h4>Your order</h4>

        <div class="product_order_details">
        </div>
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
          <a  id="proceed_button"><button>Proceed to Checkout</button></a>


          <!-- <div class="total_calculation">
      <p>
        <span>Total</span>
        <span id="total_in_num">340+450=790</span>
      </p>

    </div> -->

        </div>
      </div>
    </div>
</body>
</html>



  


 