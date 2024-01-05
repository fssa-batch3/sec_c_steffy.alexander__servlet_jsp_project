package com.fssa.veeblooms;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
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
 * 
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		String password = request.getParameter("password");
		UserService userservice = new UserService(); 

		if ("steffy12@veeblooms.com".equals(email) && "Steffy@123".equals(password)) {
			try {
				User user = userservice.login(email, password);
				HttpSession session = request.getSession();
				session.setAttribute("LoggedUser", user);
				System.out.println("admin :"+user); 
				session.setAttribute("isLogged", "true");
				session.setAttribute("isAdmin", "true");
				response.sendRedirect("./admin.jsp");
			} catch (DAOException | SQLException e) {

				e.printStackTrace();
				System.out.println("No user Records found");
				request.setAttribute("errorMsg", "No user Records found");
				request.setAttribute("path", "./login.jsp");
				RequestDispatcher rd = request.getRequestDispatcher("./login.jsp");
				rd.forward(request, response);
			}

		}else {

			try {
				User user = userservice.login(email, password);
				System.out.println(user);
				if (user != null) {
					HttpSession session = request.getSession();
					session.setAttribute("LoggedUser", user);
					session.setAttribute("isLogged", "true");
					System.out.println("Logged in successful");
					request.setAttribute("successMsg", "Logged in successful");
					request.setAttribute("path", "./profile.jsp");
					RequestDispatcher rd = request.getRequestDispatcher("./profile.jsp");
					rd.forward(request, response);
					System.out.println(user);

				} else {

					System.out.println("No user Records found");
					request.setAttribute("errorMsg", "Incorrect email or password");
					request.setAttribute("path", "./login.jsp");
					RequestDispatcher rd = request.getRequestDispatcher("./login.jsp");
					rd.forward(request, response);
				} 
			} catch (DAOException | SQLException e) {

				System.out.println(e.getMessage());
				request.setAttribute("errorMsg", e.getMessage());
				request.setAttribute("path", "./login.jsp");
				RequestDispatcher rd = request.getRequestDispatcher("./login.jsp");
				rd.forward(request, response);
				e.printStackTrace();
			}

		}
	}
}
