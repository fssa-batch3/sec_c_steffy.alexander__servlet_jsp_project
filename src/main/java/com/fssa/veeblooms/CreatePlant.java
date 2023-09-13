package com.fssa.veeblooms;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.veeblooms.dao.PlantDAO;
import com.fssa.veeblooms.enumclass.HybridEnum;
import com.fssa.veeblooms.enumclass.PlantTypeEnum;
import com.fssa.veeblooms.exception.CustomException;
import com.fssa.veeblooms.exception.DAOException;
import com.fssa.veeblooms.model.Plant;
import com.fssa.veeblooms.service.PlantService;
import com.fssa.veeblooms.util.Logger;
import com.fssa.veeblooms.validator.PlantValidator;

@WebServlet("/CreatePlant")
public class CreatePlant extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Initialize a list to store image URLs
        List<String> images = new ArrayList<String>();

        // Retrieve data from request parameters
        String plantName = request.getParameter("plantName");
        String imageURL = request.getParameter("imageURL");

        // Declare variables for image URLs
        String mainimage;
        String image1;
        String image2;
        String image3;

        // Populate the images list with URLs from request parameters
        images.add(request.getParameter("mainimage"));
        images.add(request.getParameter("image1"));
        images.add(request.getParameter("image2"));
        images.add(request.getParameter("image3"));

        // Create a new Plant object and set its properties
        Plant plant = new Plant();
        plant.setPlantName(request.getParameter("plantName"));
        plant.setPlantImagesUrl(images);
        plant.setPlantType(PlantTypeEnum.valueOf(request.getParameter("plantType")));
        plant.setPlantHeight(Float.parseFloat(request.getParameter("plantHeight")));
        plant.setPlantingSeason(request.getParameter("plantingSeason"));
        plant.setHybrid(HybridEnum.valueOf(request.getParameter("hybridType")));
        plant.setPrice(Double.parseDouble(request.getParameter("price")));

        // Create and configure PlantService, DAO, and Validator
        PlantService plantService = new PlantService();
        plantService.setPlantDAO(new PlantDAO());
        plantService.setPlantValidator(new PlantValidator());

        // Log information about the Plant object
        Logger.info(plant);

        try {
            // Attempt to add the Plant to the database
            plantService.addPlant(plant);

            // Redirect to a JSP page on success
            response.sendRedirect("./ShowAllPlant");
            System.out.println("success");

        } catch (CustomException | DAOException | SQLException e) {
            // Handle exceptions by logging and printing the stack trace
        	response.sendRedirect("./createplant.jsp");
            Logger.info(e.getMessage());
            e.printStackTrace();
        }
    }
}
