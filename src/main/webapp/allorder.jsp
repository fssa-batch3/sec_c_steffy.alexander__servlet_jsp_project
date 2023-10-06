<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All order</title>
    <link
      href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
      rel="stylesheet"
    />
  </head>
  <style>
    * {
      font-family: "Poppins", sans-serif;
    }
    .main{
      display: flex;
      width: 70%;
      margin: 100px;
      margin: 50px auto;
    }
    .center {
      width: 65%;
    }
    .outcontent {
      width: 95%;
      margin: 20px auto;
      height: 160px;
      display: flex;
      align-items: center;
      position: relative;
      justify-content: center;
    }
    .status {
      background-color: #3b71ca;
      padding: 4px 8px;
      color: white;
      font-weight: 600;
      font-size: 14px;
      border-radius: 3px;
      position: absolute;
      transform: rotate(-30deg);
      top: 0px;
      z-index: 5;
      left: 0px;
    }
    .content {
      box-shadow: rgba(0, 0, 0, 0.02) 0px 1px 3px 0px,
        rgba(27, 31, 35, 0.15) 0px 0px 0px 1px;
      border-radius: 5px;
      display: flex;
      height: 95%;
      width: 95%;
    }
    .leftContent {
      width: 30%;
      display: flex;
      align-items: center;
      justify-content: center;
    }
    .leftContent img {
      width: 65%;
      margin: 20px auto;
    }
    .rightContent {
      box-sizing: border-box;
      width: 70%;
      padding: 20px;
    }
    .rightContent_header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      height: 20px;
    }
    .rightContent_footer {
      display: flex;
      justify-content: space-between;
      align-items: center;
    }
    .rightContent_footer div p {
      font-size: 12px;
      color: grey;
    }
    .rightContent_footer div p span {
      font-weight: 600;
      color: black;
    }
    .viewOrderDetails {
      background-color: rgb(19, 19, 19);
      padding: 5px 10px;
      color: white;
      font-weight: 600;
      font-size: 12px;
      border-radius: 3px;
      cursor: pointer;
    }
    .rightoutcontent {
      width: 35%;
      height: 100vh;
      box-sizing: border-box;
    }
    .orderDetails{
      padding: 20px;
      border: 1px solid black;
      font-size: 14px;
    }
    .orderDetailsContent p{
      display: flex;
      justify-content: space-between;

    }
    .orderDetailsContent p span{
      color: rgb(79, 79, 79);
    }
  </style>

<body>



<h3>Ordered Products :</h3>
    <div class="main">
      <div class="center">
        <div class="outcontent">
          <p class="status">Ordered</p>
          <div class="content">
            <div class="leftContent">
              <img src="./assets/images/background.jpg" alt="" />
            </div>
            <div class="rightContent">
              <div class="rightContent_header">
                <h2>Plant name</h2>
                <p>₹ 200.0</p>
              </div>
              <div class="rightContent_footer">
                <div>
                  <p>Quantity : <span>1</span></p>
                  <p>User Id <span>10</span></p>
                  <p>Order on <span>10/08/2023</span></p>
                </div>
                <p class="viewOrderDetails">View Order Details</p>
              </div>
            </div>
          </div>
        </div>

        <div class="outcontent">
          <p class="status">Ordered</p>
          <div class="content">
            <div class="leftContent">
              <img src="./assets/images/background.jpg" alt="" />
            </div>
            <div class="rightContent">
              <div class="rightContent_header">
                <h2>Plant name</h2>
                <p>₹ 200.0</p>
              </div>
              <div class="rightContent_footer">
                <div>
                  <p>Quantity : <span>1</span></p>
                  <p>User Id <span>10</span></p>
                  <p>Order on <span>10/08/2023</span></p>
                </div>
                <p class="viewOrderDetails">View Order Details</p>
              </div>
            </div>
          </div>
        </div>

        <div class="outcontent">
          <p class="status">Ordered</p>
          <div class="content">
            <div class="leftContent">
              <img src="./assets/images/background.jpg" alt="" />
            </div>
            <div class="rightContent">
              <div class="rightContent_header">
                <h2>Plant name</h2>
                <p>₹ 200.0</p>
              </div>
              <div class="rightContent_footer">
                <div>
                  <p>Quantity : <span>1</span></p>
                  <p>User Id <span>10</span></p>
                  <p>Order on <span>10/08/2023</span></p>
                </div>
                <p class="viewOrderDetails">View Order Details</p>
              </div>
            </div>
          </div>
        </div>

        <div class="outcontent">
          <p class="status">Ordered</p>
          <div class="content">
            <div class="leftContent">
              <img src="./assets/images/background.jpg" alt="" />
            </div>
            <div class="rightContent">
              <div class="rightContent_header">
                <h2>Plant name</h2>
                <p>₹ 200.0</p>
              </div>
              <div class="rightContent_footer">
                <div>
                  <p>Quantity : <span>1</span></p>
                  <p>User Id <span>10</span></p>
                  <p>Order on <span>10/08/2023</span></p>
                </div>
                <p class="viewOrderDetails">View Order Details</p>
              </div>
            </div>
          </div>
        </div>

        <div class="outcontent">
          <p class="status">Ordered</p>
          <div class="content">
            <div class="leftContent">
              <img src="./assets/images/background.jpg" alt="" />
            </div>
            <div class="rightContent">
              <div class="rightContent_header">
                <h2>Plant name</h2>
                <p>₹ 200.0</p>
              </div>
              <div class="rightContent_footer">
                <div>
                  <p>Quantity : <span>1</span></p>
                  <p>User Id <span>10</span></p>
                  <p>Order on <span>10/08/2023</span></p>
                </div>
                <p class="viewOrderDetails">View Order Details</p>
              </div>
            </div>
          </div>
        </div>
      </div>

</body>
</html>

