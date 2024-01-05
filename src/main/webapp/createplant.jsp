<%@page import="com.fssa.veeblooms.service.PlantService"%>
<%@page import="com.fssa.veeblooms.util.Logger"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.fssa.veeblooms.model.Plant"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>veeblooms_createplant</title>
<link rel="stylesheet" href="./assets/css/plant_seeds.css">
<link rel="stylesheet" href="./assets/css/notify.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<link rel="stylesheet" href="./assets/css/createPlant.css" />
</head>
<body>

	<div class="header">
		<a href="./CreatePlant" id="create_plant">Create a plant</a> <a
			href="./UpdatePlantDetails" id="update_plant">Update a plant</a> <a
			href="./DeletePlantDetails">Delete a plant</a>
			<a href="./home.jsp">Home</a>
	</div>

	<div class="container">

	
		<form id="form" class="view" action="./CreatePlant" method="post" >
			<div class="full_form">
				<div class="card_details">
					<label for="name" class="form-label"> Name:</label> <input
						class="form-control" type="text" id="name" name="plantName"
						title="Plantname should only contain alphabets"
						placeholder="Enter plant name" class="btn btn-secondary" data-toggle="tooltip" data-placement="top" pattern="^[a-zA-Z ]+$" required>

						
					<label for="image" class="form-label">Image url:</label> <input
						type="text" id="image" name="mainimage"
						 class="form-control"
						 title="Enter a valid image URL (e.g., https://example.com/image.png)" required /> 
						
						<label for="price"
						class="form-label"> Price:</label> <input type="text" id="price"
						name="price" class="form-control" placeholder="Enter price"
						pattern="^\d+(\.\d{2})?$" title="price must contains numbers only"
						required/>
				</div>
				<br>
				<div class="details_page">
					<label for="image_1" class="form-label"> image_1:</label> <input
						type="text" id="image_1" name="image1" 
						title="Enter a valid image URL (e.g., https://example.com/image.png)"  class="form-control"
						placeholder="Enter image_1 URL" required />
						
						
						 <label for="image_2"
						class="form-label"> image_2:</label> <input type="text"
						class="form-control" id="image_2" name="image2"
						
						title="Enter a valid image URL (e.g., https://example.com/image.png)"
						placeholder="Enter image_2 URL" required /> <label for="image_3"
						class="form-label"> image_3:</label> <input type="text"
						id="image_3" name="image3" class="form-control"
						
						title="Enter a valid image URL (e.g., https://example.com/image.png)"
						placeholder="Enter image_3 URL" required /> <br /> <label
						for="plantType" class="form-label">Select Plant Type:</label> <select
						id="plantType" name="plantType" class="form-control" required>
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
					</select> <label for="Height" class="form-label"> Height:</label> <input
						type="text" id="Height" class="form-control" name="plantHeight"
						pattern="^[0-9]+$"
						title="plant height must contains numbers only"
						placeholder="Enter plant height" required /> 
						
						<label
						for="Planting_Season" class="form-label"> Planting Season:</label>
						
					<input type="text" id="Planting_Season" class="form-control"
						name="plantingSeason" placeholder="Enter planting season"
						 pattern="[A-Za-z ]+" 
						title="Plant season should only contain alphabets" required />
						
						
						 <label
						for="hybridType" class="form-label">Hybrid:</label> <select
						id="hybridType" class="form-control" name="hybridType" required>
						<option value="YES">Yes</option>
						<option value="NO">No</option>
					</select>
				</div>
			</div>
			<button id="create" type="submit" value="submit">Create</button>
		</form>
	</div>


	<div class="right">
		<%
		//getting the plant arraylist from request object that has been set by the getservlet method
		List<Plant> plants = new ArrayList<Plant>();
		
		if (request.getAttribute("allplants") != null) {
			plants = (List<Plant>) request.getAttribute("allplants");
		}

		Logger.info(plants + "plant");

		///listing all the plant objects using foreach method
		PlantService plantService = new PlantService();
		for (Plant plant : plants) {

			//finding the plant id by using getplantidbyname method in plantservice
		%>
		<a
			href="./plantdetails.jsp?id=<%=plantService.getPlantIdByName(plant.getPlantName())%>">

			<div class="box1">
				<div class="imgtrend" alt="trend">
					<img src="<%=plant.getPlantImagesUrl().get(0)%>" alt="rose">
					<i id="rs" class="fa-solid fa-indian-rupee-sign"><%=plant.getPrice()%></i>
					<br>
					<h3 class="pinkrose"><%=plant.getPlantName()%></h3>
					<a href="./cart.html">
				</div>
				<br> <br> <a id="add" href="plantcart.html">View Details</a>
			</div>
		</a>
		<%
		}
		%>
		
							
<%
        String successmessage=(String)request.getAttribute("Successmessage");
        String errormessage=(String)request.getAttribute("ErrorMessage");
        
        %>
        
        <%
        
        if(successmessage!=null){
        
        %>
            
        <p><%=successmessage %></p>
           <%
        
        }%>
         <%
        
        
           if(errormessage!=null){
        
        %>
            
        <p><%=errormessage %></p>
           <%
        
        }
         
        %>	
	</div>
	<script src="./assets/js/createPlant.js"></script>
	<script src="./assets/js/notify.js"></script>
	
	<jsp:include page="./successErrorMsg.jsp"></jsp:include>


</body>
</html>
