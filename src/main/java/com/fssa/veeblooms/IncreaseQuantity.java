package com.fssa.veeblooms;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.veeblooms.dao.CartDao;
import com.fssa.veeblooms.exception.DAOException;

/**
 * Servlet implementation class IncreaseQunatity
 */
@WebServlet("/IncreaseQunatity")
public class IncreaseQuantity extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int plantId = Integer.parseInt(request.getParameter("plantId"));
		int currquantity = Integer.parseInt(request.getParameter("quantity"));
		try {
			int cartQuantity = CartDao.getExistingtQuantityByCartId(plantId);
		} catch (DAOException | SQLException e) {
			e.printStackTrace();
		}

		
	}
}
