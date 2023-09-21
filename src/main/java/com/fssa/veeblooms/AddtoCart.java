package com.fssa.veeblooms;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.veeblooms.model.Plant;
import com.fssa.veeblooms.service.PlantService;

@WebServlet("/AddtoCart")
public class AddtoCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Plant plant = new Plant();
		int productId =Integer.parseInt(request.getParameter("productId"));
		
		String productname = request.getParameter("productname");
		String quantity = request.getParameter("quantity");
		String price = request.getParameter("price");

		Plant plant = new Plant();

		PlantService plantservice = new PlantService();

		plant.setPlantName(plant.getPlantName());
		plant.setPlantImagesUrl(plant.getPlantImagesUrl().get(0));
		plant.setPrice(plant.getPrice());
		
	}

}
