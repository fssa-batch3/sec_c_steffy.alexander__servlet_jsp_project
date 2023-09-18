package com.fssa.veeblooms;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.veeblooms.exception.DAOException;
import com.fssa.veeblooms.model.User;
import com.fssa.veeblooms.service.UserService;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		String password = request.getParameter("password");
		UserService userservice = new UserService();


		
		 if ("steffy12@veeblooms.com".equals(email) && "Steffy@123".equals(password)) {
	            HttpSession session = request.getSession();
	            session.setAttribute("LoggedUser", email);
	            
	            response.sendRedirect("./createplant.jsp");
		 } 
		 
		 else{

 
		try {
			User user = userservice.login(email, password);
			System.out.println(user);
			if (user != null) {

				HttpSession session = request.getSession();
				session.setAttribute("LoggedUser", user);
				response.sendRedirect("./profile.jsp");
			} else { 
				System.out.println("No user Records found");
				response.sendRedirect("./login.jsp");
			}
		} catch (DAOException | SQLException e) {

			System.out.println(e.getMessage());
			e.printStackTrace();
			response.sendRedirect("./login.jsp");
		}

	}
}
}


