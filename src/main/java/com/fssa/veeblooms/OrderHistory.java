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

import com.fssa.veeblooms.dao.UserDAO;
import com.fssa.veeblooms.exception.CustomException;
import com.fssa.veeblooms.exception.DAOException;
import com.fssa.veeblooms.model.Order;
import com.fssa.veeblooms.model.User;
import com.fssa.veeblooms.service.OrderService;
import com.fssa.veeblooms.service.UserService;

@WebServlet("/OrderHistory")
public class OrderHistory extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		OrderService orderService = new OrderService();
		HttpSession session = request.getSession(false);
		User user = (User) session.getAttribute("LoggedUser");

		if (user == null) {
			request.setAttribute("errorMsg", "Login / Session Expired");
			request.setAttribute("path", "./login.jsp");
			RequestDispatcher rd = request.getRequestDispatcher("./login.jsp");
			rd.forward(request, response);
		} else { 
			int userId;
			try {
				userId = UserDAO.getUserIdByEmail(user.getEmail());
				ArrayList<Order> orderDetails = orderService.getOrderById(userId);
				request.setAttribute("orderDetails", orderDetails);

				RequestDispatcher requestDispatcher = request.getRequestDispatcher("./orderhistory.jsp");

				requestDispatcher.forward(request, response);

			} catch (DAOException | CustomException | SQLException e) {
				System.out.println("Getting order details failed");

				e.printStackTrace();
			}
		}

	}

}
