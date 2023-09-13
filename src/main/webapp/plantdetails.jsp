<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.fssa.veeblooms.model.Plant" %>
<%@ page import="com.fssa.veeblooms.service.*" %>
<%@ page import="com.fssa.veeblooms.util.*" %>
<%@ page import="com.fssa.veeblooms.util.*" %>
<%@ page import="com.fssa.veeblooms.enumclass.*" %>


<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>	
<head>
<meta charset="ISO-8859-1">
<title>veeblooms_plantdetails</title>
<link rel="stylesheet" href="./assets/css/details.css">

</head>
<body>
  <%
  //getting id paramater from request obj lyk url params,the request.getParameter will always return object
 // converting it to string and into int
    int id = Integer.parseInt(request.getParameter("id")+"");
  Logger.info(id+"  id");
    
    PlantService plantService = new PlantService();
    //getting the plant obj by using id
   Plant plant= plantService.getPlantById(id); 
   Logger.info(plant+"  plant");
   
    %>

<jsp:include page="header.jsp"></jsp:include>
 <div class="container">
     <div class="left">
      <div class="box1">
        <div class="imgtrend" alt="hibiscusimg">
          <img src=<%=plant.getPlantImagesUrl().get(0) %> alt="hibiscus" />

          <div class="plantimages">
           <img id="hibiscus_1" src=<%=plant.getPlantImagesUrl().get(1) %>  alt="hibiscus" />
            <img src=<%=plant.getPlantImagesUrl().get(2) %>   alt="flower">
            <img src=<%=plant.getPlantImagesUrl().get(3) %>  alt="flower"> 

          </div>
        </div>
      </div>
      </div>
      <div class="right">
        <h2><%=plant.getPlantName() %> </h2>

        <i class="fa-sharp fa-solid fa-star"></i>
        <i class="fa-sharp fa-solid fa-star"></i>
        <i class="fa-sharp fa-solid fa-star"></i>
        <i class="fa-sharp fa-solid fa-star"></i>
        <i class="fa-sharp fa-solid fa-star"></i><br /><br />

        <span id="numinrs"> &#x20B9; <%=plant.getPrice()%> </span>

        <form action="/action_page.php" class="quantity_form">
          <label for="1" id="Quantity">Quantity</label>
          <select name="1" id="item">
            <option value="one">1</option>
            <option value="two">2</option>
            <option value="three">3</option>
            <option value="one">4</option>
            <option value="two">5</option>
            <option value="three">6</option>
          </select>
        </form>
        <div class="buttons">
          <button id="cart1">Add to Cart</button>
        </div>
        <hr />
        <br />
        <h3>Product description</h3>
        <h6>About this item</h6>
        <ul>
          <li>One Healthy Live Plant In Pot</li>
          <li>Low maintenance home plant</li>
        </ul>

        <h5>Highlights</h5>
        <ul>
          <li>Plant Name: <%=plant.getPlantName() %> </li>
          <li>Type: <%=plant.getPlantType() %> </li>
          <li>Height: <%=plant.getPlantHeight() %> feet </li>
        </ul>
        <table>
          <thead>
            <tr>
              <th></th>
              <th></th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td id="general">General</td>

              <td>Name</td>

            </tr>

          

            <tr>
              <td>Type</td>

              <td>Flower</td>

            </tr>

            <tr>
              <td>Plant name</td>

              <td><%=plant.getPlantName() %> </td>

            </tr>




            <tr>
              <td>Recommended Planting Season</td>

              <td><%=plant.getPlantingSeason() %> </td>

            </tr>


            <tr>
              <td>Hybrid</td>

              <td><%=plant.getHybrid() %> </td>

            </tr>
          </tbody>
        </table>
      </div> 
  </div>

</body>
</html>