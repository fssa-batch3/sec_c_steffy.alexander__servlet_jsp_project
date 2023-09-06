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
 * Servlet implementation class UpdatePlant
 */
@WebServlet("/UpdatePlant")
public class UpdatePlant extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	PlantService plantService= new PlantService();
	

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
		String plantname= request.getParameter("plantname");
		System.out.println(plantname);
		plantService.setPlantDAO(new PlantDAO());
		plantService.setPlantValidator(new PlantValidator());
		try {
			int id=plantService.getPlantIdByName(plantname) ;
			
			Plant plant = plantService.getPlantById(id);
			request.setAttribute("plant", plant);
			System.out.println(plant+"gyvhj");
			RequestDispatcher rd= request.getRequestDispatcher("./updateplant.jsp");
			rd.forward(request, response);
		      response.sendRedirect(request.getContextPath()+ "/showallplants.jsp");
		} catch (DAOException | SQLException e) {
			e.printStackTrace();
		}
		
	}
	 
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<String> images = new ArrayList<String>();
		String plantName = request.getParameter("plantName");
		String imageURL = request.getParameter("imageURL");
		images.add(request.getParameter("mainimage"));
		images.add(request.getParameter("image1"));
		images.add(request.getParameter("image2"));
		images.add(request.getParameter("image3"));
		
		Plant plant = new Plant();
		
		plant.setPlantName(request.getParameter("plantname"));
		plant.setPlantImagesUrl(images);
		plant.setPlantType(PlantTypeEnum.valueOf(request.getParameter("planttype")));
		plant.setPlantHeight(Float.parseFloat(request.getParameter("plantheight")));
		plant.setPlantingSeason(request.getParameter("plantingseason"));
		plant.setHybrid(HybridEnum.valueOf(request.getParameter("planthybrid")) );
		plant.setPrice(Double.parseDouble(request.getParameter("price")));
		plantService.setPlantDAO(new PlantDAO());
		plantService.setPlantValidator(new PlantValidator());
		System.out.println(plant);
		try {
			plantService.updatePlant(plant); 
			response.sendRedirect("showallplants.jsp");
			Logger.info("success");
		} catch (CustomException | DAOException | SQLException e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		
	}

}
