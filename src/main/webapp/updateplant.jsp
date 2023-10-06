<%@page import="com.fssa.veeblooms.service.PlantService"%>
<%@page import="com.fssa.veeblooms.util.Logger"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.fssa.veeblooms.model.Plant"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>veeblooms_updateplant</title>

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

		<form action="./UpdatePlant" method="get">
			<p id="update">Update a product</p>
			<!--  <label for="update_input"> Enter the name of the Plant : <input
				type="text" id="update_input" name="plantname">
			</label>
			<button id="search" type="submit" value="submit">Search</button>-->
		</form>
		
		<%
		Plant plant = (Plant) request.getAttribute("plant");
		if (plant != null) {
		%>
		<form id="update_form" action="./UpdatePlant" method="post">
			<div class="update_details">
			
				<label for="image">Image url:<input type="url"
					value=<%=plant.getPlantImagesUrl().get(0)%> id="update_image"
					name="mainimage" /></label> <label for="price"> Price:<input
					type="text" value=<%=plant.getPrice()%> id="update_price"
					name="price" /></label> 
					
					<label for="update_name"> Name:<input
					type="text" id="update_name" name="plantname" value="<%=plant.getPlantName()%>"  readonly />
				</label><br /> 
				
				<label for="image_1"> image_1:<input type="text"
					value=<%=plant.getPlantImagesUrl().get(1)%> id="update_image_1"
					name="image1" />
				</label> <label for="image_2"> image_2:<input type="text"
					value=<%=plant.getPlantImagesUrl().get(2)%> id="update_image_2"
					name="image2" /></label> <label for="image_3"> image_3:<input
					type="text" value=<%=plant.getPlantImagesUrl().get(3)%>
					id="update_image_3" name="image3" />
				</label> <br > 
				
				<label for="plantType">Select
						Plant Type:</label> <select id="plantType" name="planttype">
						<option value="FLOWER">Flower</option>
						<option value="PLANT">Plant</option>
						<option value="FRUIT">Fruit</option>
						<option value="TREE">Tree</option>
						<option value="SUCCULENT">Succulent</option>
						<option value="CREEPERS">Creeper</option>
						<option value="CLIMBERS">Climber</option>
						<option value="HERBS">Herb</option>
						<option value="SHRUBS">Shrub</option>
						<option value="FOLIAGE">Foliage</option>
					</select>
				 <br /> <label
					for="Height"> Height: <input type="number"
					value=<%=plant.getPlantHeight()%> id="update_Height"
					name="plantheight" />
				</label> <br /> <label for=" Planting_Season"> Planting Season: <input
					type="text" value=<%=plant.getPlantingSeason()%>
					id="update_Planting_Season" pattern="[A-Za-z]+" name="plantingseason" />
				</label> <br>
				
				 <label for="hybridType">Hybrid:</label> <select id="hybridType" value=<%=plant.getHybrid()%> 
						name="planthybrid">
						<option value="YES">Yes</option>
						<option value="NO">No</option>
					</select>
				<button id="update_product" type="submit" value="submit">Update</button>
			</div>
		</form>
		<%
		}
		%>

	</div>
	
		<div class="right">
		<%
		//getting the plant arraylist from request object that has been set by the getservlet method
		List<Plant> plants = new ArrayList<Plant>();
		
		if (request.getAttribute("allplants") != null) {
			plants = (List<Plant>) request.getAttribute("allplants");
		}

		Logger.info(plants + "plant");

		
		for (Plant plantDetails : plants) {

			//finding the plant id by using getplantidbyname method in plantservice
		%>
		<a href="./UpdatePlant?plantname=<%=plantDetails.getPlantName()%>">

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
	<jsp:include page="./successErrorMsg.jsp"></jsp:include>
</body>
</html>