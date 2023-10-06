package com.fssa.veeblooms;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.veeblooms.dao.OrderDAO;
import com.fssa.veeblooms.exception.CustomException;
import com.fssa.veeblooms.exception.DAOException;
import com.fssa.veeblooms.model.Order;
import com.fssa.veeblooms.service.OrderService;

@WebServlet("/GetAllOrders")
public class GetAllOrders extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		OrderService orderService = new OrderService();

		try {

			ArrayList<Order> getallorder = OrderService.getOrder();
			request.setAttribute("getallorder", getallorder);
			

		} catch (DAOException | SQLException | CustomException e) {

			e.printStackTrace();
		}

	}

}
