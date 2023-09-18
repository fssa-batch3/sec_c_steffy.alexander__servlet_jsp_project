<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.fssa.veeblooms.model.Plant"%>
<%@ page import="com.fssa.veeblooms.service.*"%>
<%@ page import="com.fssa.veeblooms.util.*"%>
<%@ page import="com.fssa.veeblooms.validator.*"%>
<%@ page import="com.fssa.veeblooms.dao.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>veeblooms</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<link rel="stylesheet" href="./assets/css/plant_seeds.css">
<link
	href="https://fonts.googleapis.com/css2?family=Carter+One&display=swap"
	rel="stylesheet">
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>
	<h2 id="heading">PLANTS</h2>



	<form action="./SearchItem">
		<div class="search_box">
			<input type="search" id="search" placeholder="Search" name="search">
		

		</div>
	</form>


	<div class="right">
		<%
		//getting the plant arraylist from request object that has been set by the getservlet method

		List<Plant> allPlants = (List<Plant>) request.getAttribute("allplants");

		List<Plant> searchedPlants = (List<Plant>) request.getAttribute("searchedPlants");

		List<Plant> plants;
		if (searchedPlants == null || searchedPlants.size() == 0) {

			plants = allPlants;
		} else {
			plants = searchedPlants;
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

					<h3 class="pinkrose"><%=plant.getPlantName()%></h3>
					<a href="./cart.html"><i id="fa"
						class="fa-sharp fa-solid fa-star"></i></a> <i
						class="fa-sharp fa-solid fa-star"></i> <i
						class="fa-sharp fa-solid fa-star"></i> <i
						class="fa-sharp fa-solid fa-star"></i> <i
						class="fa-sharp fa-solid fa-star"></i>
				</div>
				<a id="add" href="plantcart.html">View Details</a>
			</div>
		</a>
		<%
		}
		%>
	</div>
	<div class="right2"></div>

</body>
</html>