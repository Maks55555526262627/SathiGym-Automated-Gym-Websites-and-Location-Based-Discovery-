package com.gym_website.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import com.gym_website.dao.UserDao;
import com.gym_website.entities.Message;
import com.gym_website.entities.User;
import com.gym_website.helper.ConnectionProvider;


@WebServlet("/loginservlet")
public class LoginSevlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public LoginSevlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Not needed for this servlet
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        String userIdentifier = request.getParameter("loginIdentifier"); // This should match the JSP form input
        String userPassword = request.getParameter("password");

        UserDao dao = new UserDao(ConnectionProvider.getConnection());
        User u = dao.getUserByEmailOrPhoneNumberAndPassword(userIdentifier, userPassword);

        if (u == null) {
            // Login failed
            Message msg = new Message("Invalid Details! Please try again.", "error", "alert alert-danger");
            HttpSession s = request.getSession();
            s.setAttribute("msg", msg);
            response.sendRedirect("login.jsp");
        } else {
            // Login successful
        	HttpSession s = request.getSession();
        	s.setAttribute("currentUser", u);
            response.sendRedirect("profile.jsp");
        }
    }
}
