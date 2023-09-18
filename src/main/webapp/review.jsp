<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <title>Document</title>
    <link rel="stylesheet" href="./assets/css/review.css">
  <link href="https://fonts.googleapis.com/css2?family=Carter+One&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
        integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
        crossorigin="anonymous" referrerpolicy="no-referrer">
</head>
<jsp:include page="header.jsp"></jsp:include>

<body>
<div class="write_box">
 <form id="form">
<div class="left_content">


<div id="Write_a_review">
  
  <h3>Rate Your Experience</h3>
 
    <div class="stars">
      <i class="fa-solid fa-star"></i>
      <i class="fa-solid fa-star"></i>
      <i class="fa-solid fa-star"></i>
      <i class="fa-solid fa-star"></i>
      <i class="fa-solid fa-star"></i>
    </div>

<textarea placeholder="Write a review" id="review"></textarea>
<br >
<button id="submit" type="submit">Submit</button>
</form>
</div>

</div>

<div class="review_img">
  <img id="review_bc" src="./assets/images/review_background.png">
  </div>

</div>
<h2 id="Customer_Feedback">Customer's Feedback</h2>

<div class="div" id="content">
</div>
</body>
</html>






   

