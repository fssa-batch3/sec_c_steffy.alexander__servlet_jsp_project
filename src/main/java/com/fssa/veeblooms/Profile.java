package com.fssa.veeblooms;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.veeblooms.model.User;


@WebServlet("/Profile")
public class Profile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		User user =(User) session.getAttribute("LoggedUser");
		if (user==null) { 
			request.setAttribute("errorMsg", "Login / Session Expired");
			request.setAttribute("path", "./login.jsp");
			RequestDispatcher rd = request.getRequestDispatcher("./login.jsp");
			rd.forward(request, response); 
		} else {
			response.sendRedirect("./profile.jsp");
		}
	}

}
