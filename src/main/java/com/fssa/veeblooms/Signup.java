package com.fssa.veeblooms;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.veeblooms.exception.CustomException;
import com.fssa.veeblooms.exception.DAOException;
import com.fssa.veeblooms.model.User;
import com.fssa.veeblooms.service.UserService;
import com.fssa.veeblooms.util.Logger;

/**
 * Servlet implementation class Signup
 */
@WebServlet("/Signup")
public class Signup extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		UserService userService = new UserService();

		String firstName = request.getParameter("fname");
		String lastName = request.getParameter("lname");
		String email = request.getParameter("email");
		String password = request.getParameter("password").trim();
		String confirmPassword = request.getParameter("confirmpass").trim();
		if (!password.equals(confirmPassword)) {
			Logger.info("Password and confirm password doesn't match");
			request.setAttribute("errorMsg", "Password and confirm password doesn't match");
			RequestDispatcher rd = request.getRequestDispatcher("./signup.jsp");
			rd.forward(request, response);

		} else {
			User user = new User();
			user.setFirstName(firstName);
			user.setLastName(lastName);
			user.setEmail(email);
			user.setPassword(password);

			try {
				userService.addUser(user);
				Logger.info("success");
				request.setAttribute("successMsg", "Account created succcessfully");
				request.setAttribute("path", "./login.jsp");
				RequestDispatcher rd = request.getRequestDispatcher("./login.jsp");
				rd.forward(request, response);

			} catch (CustomException | DAOException e) {
				request.setAttribute("errorMsg", e.getMessage());
				Logger.info(e.getMessage()); 
				e.printStackTrace();
				request.setAttribute("path", "./signup.jsp");
				RequestDispatcher rd = request.getRequestDispatcher("./signup.jsp");
				rd.forward(request, response);

			}
		}

	}

}
