package com.fssa.veeblooms;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.veeblooms.exception.DAOException;
import com.fssa.veeblooms.service.CartService;

/**
 * Servlet implementation class RemoveCart
 */
@WebServlet("/RemoveCart")
public class RemoveCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cartId = Integer.parseInt(request.getParameter("cartId"));
		try {
			CartService.removeCartByCartId(cartId);
		} catch (DAOException | SQLException e) {
			
			e.printStackTrace();
		}
		finally {
			response.sendRedirect("./CartDetails");
		}
	}

}
