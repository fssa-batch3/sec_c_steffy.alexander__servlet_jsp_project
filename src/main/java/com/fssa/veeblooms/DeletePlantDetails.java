package com.fssa.veeblooms;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.veeblooms.dao.PlantDAO;
import com.fssa.veeblooms.exception.DAOException;
import com.fssa.veeblooms.model.Plant;
import com.fssa.veeblooms.service.PlantService;
import com.fssa.veeblooms.util.Logger;
import com.fssa.veeblooms.validator.PlantValidator;


@WebServlet("/DeletePlantDetails")
public class DeletePlantDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);

		PlantService plantservice = new PlantService(new PlantValidator(), new PlantDAO());
		List<Plant> plants = null;
		try {
			plants = plantservice.getAllPlants();
			request.setAttribute("allplants", plants);
			RequestDispatcher rd = request.getRequestDispatcher("./deleteplant.jsp");
			Logger.info(plants);
			rd.forward(request, response);

		} catch (DAOException | SQLException e) {
			System.out.println(e.getMessage());

			e.printStackTrace();
			response.sendRedirect("./home.jsp");
		}
    	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
