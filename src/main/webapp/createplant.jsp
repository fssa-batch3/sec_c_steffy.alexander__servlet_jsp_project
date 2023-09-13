<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>veeblooms_createplant</title>

<link rel="stylesheet" href="./assets/css/notify.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<link rel="stylesheet" href="./assets/css/createPlant.css" />
</head>
<body>

<div class="header">
    <a href="createplant.jsp" id="create_plant">Create a plant</a>
    <a href="updateplant.jsp" id="update_plant">Update a plant</a>
    <a href="deleteplant.jsp">Delete a plant</a>
    <a href="./home.jsp">Home</a>
</div> 

<div class="container">
    <form id="form" class="view" action="./CreatePlant" method="post" >
        <div class="full_form">
            <div class="card_details">
                <label for="name" class="form-label"> Name:</label>
                <input class="form-control" type="text" id="name" name="plantName" title="Plantname should only contain alphabets" placeholder="Enter plant name" pattern="^[A-Za-z\s\-']+$" required />
                
                <label for="image" class="form-label">Image url:</label>
                <input type="url" id="image" name="mainimage" class="form-control" placeholder="Enter image URL" required />
                
                <label for="price" class="form-label"> Price:</label>
                <input type="text" id="price" name="price" class="form-control" placeholder="Enter price" required />
            </div>
            <br>
            <div class="details_page">
                <label for="image_1" class="form-label"> image_1:</label>
                <input type="text" id="image_1" name="image1" class="form-control" placeholder="Enter image_1 URL" required />
                
                <label for="image_2" class="form-label"> image_2:</label>
                <input type="text" class="form-control" id="image_2" name="image2" placeholder="Enter image_2 URL" required />
                
                <label for="image_3" class="form-label"> image_3:</label>
                <input type="text" id="image_3" name="image3" class="form-control" placeholder="Enter image_3 URL" required />
                <br />
                <label for="plantType" class="form-label">Select Plant Type:</label>
                <select id="plantType" name="plantType" class="form-control" required>
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
                <label for="Height" class="form-label"> Height:</label>
                <input type="text" id="Height" class="form-control" name="plantHeight" placeholder="Enter plant height" required />
                
                <label for="Planting_Season" class="form-label"> Planting Season:</label>
                <input type="text" id="Planting_Season" class="form-control" name="plantingSeason" placeholder="Enter planting season" required />
                
                <label for="hybridType" class="form-label">Hybrid:</label>
                <select id="hybridType" class="form-control" name="hybridType" required>
                    <option value="YES">Yes</option>
                    <option value="NO">No</option>
                </select>
            </div>
        </div>
        <button id="create" type="submit" value="submit">Create</button>
    </form>
</div>

<script src="./assets/js/notify.js"></script>


<script>



</script>


</body>
</html>
