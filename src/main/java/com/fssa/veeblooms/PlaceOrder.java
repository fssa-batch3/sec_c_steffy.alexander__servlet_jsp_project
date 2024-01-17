package com.fssa.veeblooms;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.veeblooms.dao.CartDao;
import com.fssa.veeblooms.dao.PlantDAO;
import com.fssa.veeblooms.dao.UserDAO;
import com.fssa.veeblooms.enumclass.OrderStatus;
import com.fssa.veeblooms.exception.CustomException;
import com.fssa.veeblooms.exception.DAOException;
import com.fssa.veeblooms.model.Cart;
import com.fssa.veeblooms.model.Order;
import com.fssa.veeblooms.model.OrderedProduct;
import com.fssa.veeblooms.model.Plant;
import com.fssa.veeblooms.model.User;
import com.fssa.veeblooms.service.OrderService;
import com.fssa.veeblooms.service.PlantService;
import com.fssa.veeblooms.util.Logger;
import com.fssa.veeblooms.validator.PlantValidator;

/**
 * Servlet implementation class PlaceOrder
 */
@WebServlet("/PlaceOrder")
public class PlaceOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;

	PlantService plantService = new PlantService(new PlantValidator(), new PlantDAO());
	OrderService orderService = new OrderService();

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
			String address = request.getParameter("address");
			String phoneNumber = request.getParameter("number");

			Order order = new Order();
			System.out.println(user + "jkhvgcf ");

			try {

				List<OrderedProduct> productsList = new ArrayList<>();

				int userId = UserDAO.getUserIdByEmail(user.getEmail());

				ArrayList<Cart> cartDetailsByUserId = CartDao.getCartDetailsByUserId(userId);

				Double totalAmount = 0d;

				for (Cart cart : cartDetailsByUserId) {

					OrderedProduct orderProduct = new OrderedProduct();
					orderProduct.setProductId(cart.getPlantId());
					orderProduct.setProductPrice(cart.getTotalAmount() / cart.getQuantity());
					orderProduct.setQuantity(cart.getQuantity());
					orderProduct.setTotalAmount(cart.getTotalAmount());
					productsList.add(orderProduct);
					totalAmount += cart.getTotalAmount();

				}

				order.setTotalAmount(totalAmount);
				order.setProductsList(productsList);
				order.setOrderedDate(LocalDate.now());
				order.setUserID(userId);
				order.setAddress(address);
				order.setPhoneNumber(phoneNumber);
				order.setStatus(OrderStatus.ORDERED);
				Logger.info(order);
				orderService.addOrder(order);
				request.setAttribute("successMsg", "Order placed successfully");
				request.setAttribute("path", "./OrderHistory");

				Logger.info("Order Placed Sucessfully ");
			} catch (DAOException | SQLException | CustomException e) {
				Logger.info("Order Failed" + e.getMessage());
				e.printStackTrace();
				request.setAttribute("errorMsg", e.getMessage());
				request.setAttribute("path", "./payment.jsp");
			}

			RequestDispatcher rd = request.getRequestDispatcher("./OrderHistory");
			rd.forward(request, response);

		}

	}
}
