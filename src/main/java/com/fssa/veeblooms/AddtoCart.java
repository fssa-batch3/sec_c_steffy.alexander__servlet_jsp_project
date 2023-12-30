package com.fssa.veeblooms;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.veeblooms.dao.UserDAO;
import com.fssa.veeblooms.exception.CustomException;
import com.fssa.veeblooms.exception.DAOException;
import com.fssa.veeblooms.model.Cart;
import com.fssa.veeblooms.model.User;
import com.fssa.veeblooms.service.CartService;
import com.fssa.veeblooms.service.OrderService;

@WebServlet("/AddToCart")
public class AddToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);
		User user = (User) session.getAttribute("LoggedUser");

		if (user == null) {
			request.setAttribute("errorMsg", "Login / Session Expired");
			request.setAttribute("path", "./login.jsp");
			RequestDispatcher rd = request.getRequestDispatcher("./login.jsp");
			rd.forward(request, response);
		} else {
			
			int plantId = Integer.parseInt(request.getParameter("plantId"));

			double plantPrice = Double.parseDouble(request.getParameter("plantPrice"));
			Cart cart = new Cart();
			cart.setTotalAmount(plantPrice);
			cart.setQuantity(1);

			cart.setPlantId(plantId);

			try {
				int userId = UserDAO.getUserIdByEmail(user.getEmail());
				cart.setUserId(userId);
				CartService.addToCart(cart);
				response.sendRedirect("./CartDetails");
				System.out.println("added to cart successfully");

			} catch (DAOException | SQLException e) {
				System.out.println(e.getMessage());
				e.printStackTrace();
			}
		}
	}
}
