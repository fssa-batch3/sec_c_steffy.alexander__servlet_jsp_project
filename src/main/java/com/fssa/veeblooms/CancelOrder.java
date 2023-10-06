package com.fssa.veeblooms;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.veeblooms.exception.CustomException;
import com.fssa.veeblooms.exception.DAOException;
import com.fssa.veeblooms.model.User;
import com.fssa.veeblooms.service.OrderService;

/**
 * Servlet implementation class CancelOrder
 */
@WebServlet("/CancelOrder")
public class CancelOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;


	
	 @Override
	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

	        String orderIdStr = request.getParameter("orderId");

	        if (orderIdStr != null && !orderIdStr.isEmpty()) {
	        	
	            try {
	            	
	                int orderId = Integer.parseInt(orderIdStr);
	                OrderService orderService = new OrderService();
	                orderService.cancelOrder(orderId);
	                System.out.println("Deleted order Successfully");
	              
	                response.sendRedirect("./ShowAllPlant"); 
	            } catch ( DAOException | SQLException | CustomException e) {
	                System.out.println("Delete order failed");
	                response.sendRedirect("./orderhistory.jsp"); 
	                e.printStackTrace();
	            }
	        } else {
	            System.out.println("Invalid order ID");
	            response.sendRedirect("./orderhistory.jsp"); 
	        }
	    }
}
