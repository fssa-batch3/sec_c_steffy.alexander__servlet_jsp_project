package com.fssa.veeblooms;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.veeblooms.dao.PlantDAO;
import com.fssa.veeblooms.exception.DAOException;
import com.fssa.veeblooms.model.Plant;
import com.fssa.veeblooms.service.PlantService;
import com.fssa.veeblooms.validator.PlantValidator;

/**
 * Servlet implementation class SearchItem
 */
@WebServlet("/SearchItem")
public class SearchItem extends HttpServlet {
	private static final long serialVersionUID = 1L;

	PlantService plantService = new PlantService(new PlantValidator(), new PlantDAO());

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	// This method is responsible for handling HTTP GET requests.
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    // Retrieve the user's search input from the request parameter named "search" and remove leading/trailing whitespace.
	    String searchedName = request.getParameter("search").trim();//pi
	    
	    // Create a list to store the resulting plants matching the search criteria.
	    List<Plant> resultPlants = new ArrayList<Plant>();
	    
	    try { 
	        // Retrieve a list of all available plants from a service (presumably a database).
	        List<Plant> allPlants = plantService.getAllPlants();
	        
	        // Iterate through each plant in the list of all plants.
	        for (Plant plant : allPlants) {
	            // Check if the lowercase version of the plant's name starts with or exactly matches the searched name.
	            if (plant.getPlantName().toLowerCase().startsWith(searchedName) || plant.getPlantName().startsWith(searchedName)) {
	                // If the plant matches the search criteria, add it to the resultPlants list.
	                resultPlants.add(plant);
	            }
	        }
	    } catch (DAOException | SQLException e) {
	        // Handle exceptions (e.g., database errors) by printing an error message and stack trace.
	        System.out.print(e.getMessage());                           
	        e.printStackTrace();
	    }
	    
	    if(resultPlants==null|| resultPlants.isEmpty()) {
	    	
	    	request.setAttribute("errorMsg", "No results found");
	    	request.setAttribute("path", "./ShowAllPlant");
	    }
	    else {
		    // Set the resultPlants list as an attribute in the request to pass it to the next JSP page.
		    request.setAttribute("searchedPlants", resultPlants);
		    
		    // Obtain a RequestDispatcher to forward the request and response to the "showallplants.jsp" page.
		  
	    }
	    RequestDispatcher rd = request.getRequestDispatcher("./showallplants.jsp");
	    
	    // Forward the request and response to the "showallplants.jsp" page for rendering.
	    rd.forward(request, response);

	}


}