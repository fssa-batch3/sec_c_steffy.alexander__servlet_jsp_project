package com.fssa.veeblooms;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.veeblooms.enumclass.GenderEnum;
import com.fssa.veeblooms.exception.CustomException;
import com.fssa.veeblooms.exception.DAOException;
import com.fssa.veeblooms.model.User;
import com.fssa.veeblooms.service.UserService;

/**
 * Servlet implementation class ProfileUpdate
 */
@WebServlet("/ProfileUpdate")
public class ProfileUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	UserService userService = new UserService();

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		User user = new User();
		
		System.out.println(request.getParameter("email"));
		user.setFirstName(request.getParameter("fname"));
		user.setLastName(request.getParameter("lname"));
		user.setEmail(request.getParameter("email"));
		user.setMobileNumber(request.getParameter("number"));
		user.setAddress(request.getParameter("address"));
		user.setGender(GenderEnum.fromValue(request.getParameter("gender")));

		System.out.println(user);
		try {
			userService.updateUser(user);
			HttpSession session = request.getSession();

			request.setAttribute("successMsg", "Profile updated sucessfully");

			session.setAttribute("LoggedUser", user);
			System.out.println("Updated successfully!");

		} catch (DAOException | CustomException e) {

			request.setAttribute("errorMsg", e.getMessage());

			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		request.setAttribute("path", "./profile.jsp");
		RequestDispatcher rd = request.getRequestDispatcher("./profile.jsp");
		rd.forward(request, response);
	}

}
