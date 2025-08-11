package com.gym_website.ForgotPassword.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class NewPassword
 */
@WebServlet("/newPassword")
public class NewPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		String newPassword = request.getParameter("password");
		String confPassword = request.getParameter("confPassword");
		RequestDispatcher dispatcher = null;
		if (newPassword != null && confPassword != null && newPassword.equals(confPassword)) {
		    if (newPassword.length() >= 5 && newPassword.matches(".*[A-Z].*") && newPassword.matches(".*[^a-zA-Z0-9].*")) {
		        try {
		            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/gym_website?useSSL=false&serverTimezone=UTC", "root", "admin");

		            PreparedStatement pst = connection.prepareStatement("UPDATE users SET password = ? WHERE email = ?");
		            pst.setString(1, newPassword);
		            pst.setString(2, (String) session.getAttribute("email"));

		            int rowCount = pst.executeUpdate();
		            if (rowCount > 0) {
		            	request.setAttribute("status", "resetSuccess");
		                dispatcher = request.getRequestDispatcher("login.jsp");
		            } else {
		                request.setAttribute("status", "resetFailed");
		                dispatcher = request.getRequestDispatcher("login.jsp");
		            }
		            dispatcher.forward(request, response);
		        } catch (Exception e) {
		            e.printStackTrace();
		        }
		    }
		}

	}

}
