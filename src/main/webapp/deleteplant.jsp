<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>veeblooms_deleteplant</title>
<link rel="stylesheet" href="./assets/css/createPlant.css" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
</head>
<body>


	<div class="header">
		<a href="createplant.jsp" id="create_plant">Create a plant</a> <a
			href="updateplant.jsp" id="update_plant">Update a plant</a> <a
			href="deleteplant.jsp">Delete a plant</a>
			<a href="./home.jsp">Home</a>
	</div>

	<div class="container">
		<form id="delete_form" action="./DeletePlant" method="get">
			<h3>Delete a product</h3>
			<label for="delete_input"> Enter the name of the Plant : <input type="text" id="delete_input" name="plantname" /></label>
			<button id="delete_product"  type="submit" value="submit">Delete</button>
		</form>
	</div>
</body>
</html>