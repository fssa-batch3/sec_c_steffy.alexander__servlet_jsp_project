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

import com.fssa.veeblooms.Enum.HybridEnum;
import com.fssa.veeblooms.Enum.PlantTypeEnum;
import com.fssa.veeblooms.dao.PlantDAO;
import com.fssa.veeblooms.exception.CustomException;
import com.fssa.veeblooms.exception.DAOException;
import com.fssa.veeblooms.model.Plant;
import com.fssa.veeblooms.service.PlantService;
import com.fssa.veeblooms.util.Logger;
import com.fssa.veeblooms.validator.PlantValidator;

/**
 * Servlet implementation class CreatePlant
 */

@WebServlet("/CreatePlant")
public class CreatePlant extends HttpServlet {
	


	private static final long serialVersionUID = 1L;
       


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<String> images = new ArrayList<String>();
		String plantName = request.getParameter("plantName");
		String imageURL = request.getParameter("imageURL");
		String mainimage;
		String image1 ;
		String image2 ; 
		String image3 ;
		images.add(request.getParameter("mainimage"));
		images.add(request.getParameter("image1"));
		images.add(request.getParameter("image2"));
		images.add(request.getParameter("image3"));  
		
		Plant plant = new Plant();
		
		plant.setPlantName(request.getParameter("plantName")); 
		plant.setPlantImagesUrl(images);
		plant.setPlantType(PlantTypeEnum.valueOf(request.getParameter("plantType")));
		plant.setPlantHeight(Float.parseFloat(request.getParameter("plantHeight")));
		plant.setPlantingSeason(request.getParameter("plantingSeason"));
		plant.setHybrid(HybridEnum.valueOf(request.getParameter("hybridType")) );
		plant.setPrice(Double.parseDouble(request.getParameter("price")));
		
		PlantService plantService= new PlantService();
		plantService.setPlantDAO(new PlantDAO());
		plantService.setPlantValidator(new PlantValidator());

		Logger.info(plant);
		try {
			plantService.addPlant(plant);
			response.sendRedirect("./showallplants.jsp");
			System.out.println("success");

		} catch (CustomException | DAOException | SQLException e) {
			Logger.info(e.getMessage());
			e.printStackTrace();
		}
		
		
	}


}

