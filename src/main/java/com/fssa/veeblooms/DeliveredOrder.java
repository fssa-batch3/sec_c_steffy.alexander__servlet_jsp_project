package com.fssa.veeblooms;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.veeblooms.exception.CustomException;
import com.fssa.veeblooms.exception.DAOException;
import com.fssa.veeblooms.service.OrderService;

@WebServlet("/DeliveredOrder")
public class DeliveredOrder extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderIdStr = request.getParameter("orderId");

        if (orderIdStr != null && !orderIdStr.isEmpty()) {
            try {
                int orderId = Integer.parseInt(orderIdStr);
                OrderService orderService = new OrderService();

              
                orderService.DeliveredOrder(orderId);
//                boolean deliverySuccess = orderService.DeliveredOrder(orderId);

                // Create or get the HttpSession
              

                response.sendRedirect("./GetAllOrders");
            } catch (DAOException | SQLException | CustomException e) {
                System.out.println("Delivering order failed");
                response.sendRedirect("./GetAllOrders");
                e.printStackTrace();
            }
        } else {
            System.out.println("Invalid order ID");
            response.sendRedirect("./GetAllOrders");
        }
    }
}
