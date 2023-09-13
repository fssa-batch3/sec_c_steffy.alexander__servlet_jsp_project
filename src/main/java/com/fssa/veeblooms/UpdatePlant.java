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
import com.fssa.veeblooms.enumclass.HybridEnum;
import com.fssa.veeblooms.enumclass.PlantTypeEnum;
import com.fssa.veeblooms.exception.CustomException;
import com.fssa.veeblooms.exception.DAOException;
import com.fssa.veeblooms.model.Plant;
import com.fssa.veeblooms.service.PlantService;
import com.fssa.veeblooms.util.Logger;
import com.fssa.veeblooms.validator.PlantValidator;

@WebServlet("/UpdatePlant")
public class UpdatePlant extends HttpServlet {
    private static final long serialVersionUID = 1L;

    PlantService plantService = new PlantService();

    // This method handles HTTP GET requests
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Retrieve the "plantname" parameter from the request
        String plantname = request.getParameter("plantname");
        System.out.println(plantname);

        // Initialize PlantService with DAO and Validator
        plantService.setPlantDAO(new PlantDAO());
        plantService.setPlantValidator(new PlantValidator());

        try {
            // Get the plant's ID by its name
            int id = plantService.getPlantIdByName(plantname);

            // Retrieve the plant object by its ID
            Plant plant = plantService.getPlantById(id);

            // Set the "plant" attribute in the request for use in JSP
            request.setAttribute("plant", plant);
            System.out.println(plant + "gyvhj");

            // Forward the request and response to "updateplant.jsp"
            RequestDispatcher rd = request.getRequestDispatcher("./updateplant.jsp");
            rd.forward(request, response);

            // Redirect to the "ShowAllPlant" servlet
            response.sendRedirect(request.getContextPath() + "/ShowAllPlant");
        } catch (DAOException | SQLException e) {
            e.printStackTrace();
        }

    }

    /**
     * This method handles HTTP POST requests
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<String> images = new ArrayList<String>();

        // Retrieve form input parameters
        String plantName = request.getParameter("plantName");
        String imageURL = request.getParameter("imageURL");
        images.add(request.getParameter("mainimage"));
        images.add(request.getParameter("image1"));
        images.add(request.getParameter("image2"));
        images.add(request.getParameter("image3"));

        // Create a Plant object and set its properties based on form input
        Plant plant = new Plant();
        plant.setPlantName(request.getParameter("plantname"));
        plant.setPlantImagesUrl(images);
        plant.setPlantType(PlantTypeEnum.valueOf(request.getParameter("planttype")));
        plant.setPlantHeight(Float.parseFloat(request.getParameter("plantheight")));
        plant.setPlantingSeason(request.getParameter("plantingseason"));
        plant.setHybrid(HybridEnum.valueOf(request.getParameter("planthybrid")));
        plant.setPrice(Double.parseDouble(request.getParameter("price")));

        // Initialize PlantService with DAO and Validator
        plantService.setPlantDAO(new PlantDAO());
        plantService.setPlantValidator(new PlantValidator());
        System.out.println(plant);

        try {
            // Update the plant information
            plantService.updatePlant(plant);

            // Redirect to the "ShowAllPlant" servlet upon success
            response.sendRedirect("./ShowAllPlant");
            Logger.info("success");
        } catch (CustomException | DAOException | SQLException e) {

            // Redirect to "createplant.jsp" upon failure
            response.sendRedirect("./createplant.jsp");
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
    }
}
