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

import com.fssa.veeblooms.dao.PlantDAO;
import com.fssa.veeblooms.dao.UserDAO;
import com.fssa.veeblooms.enumclass.OrderStatus;
import com.fssa.veeblooms.exception.CustomException;
import com.fssa.veeblooms.exception.DAOException;
import com.fssa.veeblooms.model.Order;
import com.fssa.veeblooms.model.OrderedProduct;
import com.fssa.veeblooms.model.Plant;
import com.fssa.veeblooms.model.User;
import com.fssa.veeblooms.service.OrderService;
import com.fssa.veeblooms.service.PlantService;
import com.fssa.veeblooms.util.Logger;
import com.fssa.veeblooms.validator.PlantValidator;

@WebServlet("/BuyProduct")
public class BuyProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	PlantService plantService = new PlantService(new PlantValidator(), new PlantDAO());
	OrderService orderService = new OrderService();



	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int plantId = Integer.parseInt(request.getParameter("plantId"));
		String address= request.getParameter("address");
		String phoneNumber= request.getParameter("phoneNumber");
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("LoggedUser");
		Order order = new Order();
		OrderedProduct orderProduct = new OrderedProduct();
		try {
			Plant plant = plantService.getPlantById(plantId);
			List<OrderedProduct> productsList = new ArrayList<>();
			int userId = UserDAO.getUserIdByEmail(user.getEmail());
			orderProduct.setProductId(plantId);
			orderProduct.setProductPrice(plant.getPrice());
			orderProduct.setQuantity(1);
			orderProduct.setTotalAmount(plant.getPrice());
			productsList.add(orderProduct);
			order.setTotalAmount(plant.getPrice());
			order.setProductsList(productsList);
			order.setOrderedDate(LocalDate.now());
			order.setUserID(userId);
			order.setAddress(address);
			order.setPhoneNumber(phoneNumber);
			order.setStatus(OrderStatus.ORDERED);
			Logger.info(order);
			orderService.addOrder(order);
			Logger.info("Order Placed Sucessfully ");
		} catch (DAOException | SQLException | CustomException e) {
			Logger.info("Order Failed"+e.getMessage());
			e.printStackTrace();
		}
		RequestDispatcher rd = request.getRequestDispatcher("./home.jsp");
		rd.forward(request, response);

	}

}
