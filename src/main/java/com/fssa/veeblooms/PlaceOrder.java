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

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String address = request.getParameter("address");
		String phoneNumber = request.getParameter("number");
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("LoggedUser");
		Order order = new Order();

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
				
				productsList.add(orderProduct);//arrraylist of ordered products
				
				 
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

		RequestDispatcher rd = request.getRequestDispatcher("./payment.jsp");
		rd.forward(request, response);

	}

}
