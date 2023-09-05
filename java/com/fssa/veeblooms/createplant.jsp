<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="./assets/css/createPlant.css" />
</head>
<body>

	<div class="header">
		<a href="createplant.jsp" id="create_plant">Create a plant</a>
		<a href="updateplant.jsp" id="update_plant">Update a plant</a>
		<a href="deleteplant.jsp">Delete a plant</a>
	</div>

	<div class="container">

		<form id="form" class="view" action="./CreatePlant" method="post">
			<div class="full_form">
				<div class="card_details">
					<label for="name"> Name:<input type="text" id="name"
						name="plantName" /></label> <label for="img">Image url:<input
						type="url" id="image" name="mainimage" /></label> <label for="Title">
						Price:<input type="text" id="price" name="price" />
					</label>

				</div>
				<div class="details_page">
					<label for="image_1"> image_1:<input type="text"
						id="image_1" name="image1" /></label> <label for="image_2">
						image_2:<input type="text" id="image_2" name="image2" />
					</label> <label for="image_3"> image_3:<input type="text"
						id="image_3" name="image3" /></label> <br />
						
						 <label for="plantType">Select
						Plant Type:</label> <select id="plantType" name="plantType">
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
					<label for="Height"> Height: <input type="text"
						id="Height" name="plantHeight" /></label> <label for=" Planting_Season">
						Planting Season: <input type="text" id="Planting_Season"
						name="plantingSeason" />
					</label> <label for="hybridType">Hybrid:</label> <select id="hybridType"
						name="hybridType">
						<option value="YES">Yes</option>
						<option value="NO">No</option>
					</select>
				</div>
			</div>


			<button id="create" type="submit" value="submit">Create</button>
		
		</form>

	</div>


</body>
</html>