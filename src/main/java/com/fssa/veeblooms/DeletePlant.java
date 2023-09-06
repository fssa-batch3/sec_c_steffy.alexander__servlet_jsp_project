package com.fssa.veeblooms;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.veeblooms.exception.DAOException;
import com.fssa.veeblooms.service.PlantService;

/**
 * Servlet implementation class DeletePlant
 */
@WebServlet("/DeletePlant")
public class DeletePlant extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("plantname");
		PlantService plantService= new PlantService();
		try {
			plantService.deletePlant(plantService.getPlantIdByName(name));
			System.out.println("Deleted plant Successfully");
			
			response.sendRedirect("./GetServlet");
			
		} catch (DAOException | SQLException e) {
			System.out.println("Delete plant failed");
			response.sendRedirect("./deleteplant.jsp");
			e.printStackTrace();
		}
	}
}
