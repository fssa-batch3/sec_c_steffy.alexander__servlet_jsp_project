package com.fssa.veeblooms;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.veeblooms.dao.CartDao;
import com.fssa.veeblooms.exception.DAOException;
import com.fssa.veeblooms.service.CartService;

/**
 * Servlet implementation class Quantity
 */
@WebServlet("/Quantity")
public class Quantity extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(
			HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int cartId = Integer.parseInt(request.getParameter("cartId"));
		String process = request.getParameter("process");
		
        
		try { 
			if(process.equals("increase")) {
				CartService.increaseQuantity(cartId);
				System.out.println("Quantity increased");
			}
			else {
			
			CartService.decreaseQuantity(cartId);
			System.out.println("Quantity decreased");
			}
		

		} catch (DAOException | SQLException e) {
			e.getMessage();
			e.printStackTrace();
			

		}
		finally {
			response.sendRedirect("./CartDetails");
		}

	}

}
