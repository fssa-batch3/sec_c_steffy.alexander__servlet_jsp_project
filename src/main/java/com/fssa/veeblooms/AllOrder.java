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

import com.fssa.veeblooms.exception.CustomException;
import com.fssa.veeblooms.exception.DAOException;

import com.fssa.veeblooms.service.OrderService;

/**
 * Servlet implementation class AllOrder
 */
@WebServlet("/AllOrder")
public class AllOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

String orderIdStr = request.getParameter("orderId");

if (orderIdStr != null && !orderIdStr.isEmpty()) {
	
    try {
    	
        int orderId = Integer.parseInt(orderIdStr);
        OrderService orderService = new OrderService();
        orderService.itemShipped(orderId);
        System.out.println("item Shipped Successfully");
      
        response.sendRedirect("./ShowAllPlant"); 
    } catch ( DAOException | SQLException | CustomException e) {
        System.out.println("updating shipped failed");
        response.sendRedirect("./orderhistory.jsp"); 
        e.printStackTrace();
    }
} else {
    System.out.println("Invalid order ID");
    response.sendRedirect("./orderhistory.jsp"); 
}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

