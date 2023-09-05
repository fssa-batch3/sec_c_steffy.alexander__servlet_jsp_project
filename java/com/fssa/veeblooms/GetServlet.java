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
import com.fssa.veeblooms.exception.DAOException;
import com.fssa.veeblooms.model.Plant;
import com.fssa.veeblooms.service.PlantService;
import com.fssa.veeblooms.util.Logger;
import com.fssa.veeblooms.validator.PlantValidator;

/**
 * Servlet implementation class getServlet
 */
@WebServlet("/GetServlet")
public class GetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PlantService plantservice = new PlantService(new PlantValidator(), new PlantDAO());
		List<Plant> plant;
		try {
			//getting all plant obj from database
			plant = plantservice.getAllPlants();
			//setting the plant arraylist in the request obj
			request.setAttribute("plant", plant);
			//sending the request to another pagfe using request dispatcher
			RequestDispatcher rd= request.getRequestDispatcher("/showallplants.jsp");
			rd.forward(request, response);
			Logger.info(plant);

		} catch (DAOException | SQLException e) {
			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
       
		
	}

}