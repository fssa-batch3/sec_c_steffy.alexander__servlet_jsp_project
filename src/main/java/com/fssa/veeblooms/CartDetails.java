package com.fssa.veeblooms;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.veeblooms.dao.CartDao;
import com.fssa.veeblooms.dao.UserDAO;
import com.fssa.veeblooms.exception.DAOException;
import com.fssa.veeblooms.model.Cart;
import com.fssa.veeblooms.model.User;


@WebServlet("/CartDetails")
public class CartDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);
		User user =(User) session.getAttribute("LoggedUser");
		if (user==null) { 
			request.setAttribute("errorMsg", "Login / Session Expired");
			request.setAttribute("path", "./login.jsp");
			RequestDispatcher rd = request.getRequestDispatcher("./login.jsp");
			rd.forward(request, response); 
		} else {
		 
		ArrayList<Cart> cartDetails = null;
		try {

			int userId = UserDAO.getUserIdByEmail(user.getEmail());
			cartDetails = CartDao.getCartDetailsByUserId(userId);
			System.out.println(cartDetails);
			request.setAttribute("cartDetails", cartDetails);

		} catch (DAOException | SQLException e) {
			e.getMessage();
			e.printStackTrace();
		}

		RequestDispatcher rd = request.getRequestDispatcher("./cart.jsp");
		rd.forward(request, response);
	}
	}
}
