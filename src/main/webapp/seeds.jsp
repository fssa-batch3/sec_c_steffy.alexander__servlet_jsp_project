<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Document</title>
    <link href="https://fonts.googleapis.com/css2?family=Carter+One&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
        integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
        crossorigin="anonymous" referrerpolicy="no-referrer">
    <link rel="stylesheet" href="./assets/css/plant_seeds.css">
</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>
    <div class="search_box">
        <input type="search" id="search" placeholder="Search">


    </div>
       <div class="right">
       </div>
    <div class="right2"></div>
    <footer>
        <div class="foot1">
            <h1>Suggestions</h1>
            <textarea placeholder="leave a comment..."></textarea>
            <br>
            <button>Submit</button>
        </div>
        <div class="foot2">
            <img id="footlogo" src="./assets/images/Picsart_22-12-05_14-49-34-612.png" alt="footerlogo">
            <div class="footernav">
                <a href="#">Home</a>
                <a href="#">plants</a>
                <a href="#">Seeds</a>
                <a href="#">Orders</a>
            </div>
            <div class="contact">
                <h2>Contacts</h2>
                <p>+91-9876543210</p>
                <p>veeblooms@gmail.com</p>
            </div>
            <div class="address">
                <h2>Address</h2>
                <p>No12, gandhi street</p>
                <p>urapakkam,</p>
                <p>Chennai</p>
            </div>
        </div>
       </footer>
</body>
</html>



