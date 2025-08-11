<%-- <%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    String emailOrPhone = request.getParameter("login-email/phone");
    String password = request.getParameter("login-password");

    String jdbcURL = "jdbc:mysql://localhost:3306/gym";
    String dbUser = "root";
    String dbPassword = "admin";

    boolean loginSuccessful = false;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

        // Assuming passwords are stored in plain text. For hashed passwords, use a different approach.
        String sql = "SELECT * FROM admins WHERE (email = ? OR phone = ?) AND password = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, emailOrPhone);
        statement.setString(2, emailOrPhone);
        statement.setString(3, password);
        ResultSet resultSet = statement.executeQuery();

        if (resultSet.next()) {
            loginSuccessful = true;
            session.setAttribute("adminName", resultSet.getString("name"));
            response.sendRedirect("adminDashboard.jsp");
        } else {
            response.sendRedirect("adminLoginPage.jsp?error=Invalid credentials");
        }

        resultSet.close();
        statement.close();
        connection.close();
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("adminLoginPage.jsp?error=Database error");
    }
%>

 --%>




<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    String emailOrPhone = request.getParameter("login-email/phone");
    String password = request.getParameter("login-password");

    // Hardcoded credentials
    String adminEmailOrPhone = "admin"; // Use email or phone for testing
    String adminPassword = "admin"; // Hardcoded password

    if (emailOrPhone.equals(adminEmailOrPhone) && password.equals(adminPassword)) {
        session.setAttribute("adminName", "Admin");
        response.sendRedirect("adminDashboard.jsp");
    } else {
        response.sendRedirect("adminLoginPage.jsp?error=Invalid credentials");
    }
%>





<!-- ctrl + shift+/ -->
