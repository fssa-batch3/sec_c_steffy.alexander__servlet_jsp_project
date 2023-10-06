<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.fssa.veeblooms.util.Logger"%>
<%@page import="com.fssa.veeblooms.model.Plant"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>veeblooms_deleteplant</title>
<link rel="stylesheet" href="./assets/css/createPlant.css" />
<link rel="stylesheet" href="./assets/css/plant_seeds.css">
<link rel="stylesheet" href="./assets/css/crud.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
</head>
<body>


	<div class="header">
		<a href="./CreatePlant" id="create_plant">Create a plant</a> <a
			href="./UpdatePlantDetails" id="update_plant">Update a plant</a> <a
			href="./DeletePlantDetails">Delete a plant</a>
			<a href="./home.jsp">Home</a>
	</div>

	<div class="container">
		<form id="delete_form" action="./DeletePlant" method="get">
			<h3>Delete a product</h3>
			<!-- <label for="delete_input"> Enter the name of the Plant : <input type="text" id="delete_input" name="plantname" /></label>
			<button id="delete_product"  type="submit" value="submit">Delete</button> -->
		</form>
	</div>
		<div class="right">
		<%
		//getting the plant arraylist from request object that has been set by the getservlet method
		List<Plant> plants = new ArrayList<Plant>();
		
		if (request.getAttribute("allplants") != null) {
			plants = (List) request.getAttribute("allplants");
		}

		Logger.info(plants + "plant");

		
		for (Plant plantDetails : plants) {

			//finding the plant id by using getplantidbyname method in plantservice
		%>
		<a href="./DeletePlant?plantname=<%=plantDetails.getPlantName()%>" >

			<div class="box1">
				<div class="imgtrend" alt="trend">
					<img src="<%=plantDetails.getPlantImagesUrl().get(0)%>" alt="rose">
					<i id="rs" class="fa-solid fa-indian-rupee-sign"> &#8377; <%=plantDetails.getPrice()%></i>
					<br>
					<h3 class="pinkrose"><%=plantDetails.getPlantName()%></h3>
					<a href="./cart.html">
				</div>
				<br> <br> <!-- <a id="add" href="#">View
					Details</a> -->
			</div>
		</a>
		<%
		}
		%>
	</div>
</body>
</html>