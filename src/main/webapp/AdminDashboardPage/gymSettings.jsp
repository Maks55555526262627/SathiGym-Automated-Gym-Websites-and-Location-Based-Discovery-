<%@page import="com.gym_website.admin.dao.SettingsBean"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet" %>
<%-- <%@ page import="DAO.SettingsBean" %> --%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gym Settings</title>
    <style>
        form {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
            background-color: #f9f9f9;
        }
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }
        input[type="text"], input[type="email"], input[type="tel"], textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        .field-group {
            margin-bottom: 20px;
        }
        .field-group label {
            margin-bottom: 5px;
        }
    </style>
</head>
<body>
    <h2>Gym Management Settings</h2>
    <%
        // Database connection parameters
        String jdbcURL = "jdbc:mysql://localhost:3306/your_database"; // Replace with your database URL
        String dbUser = "root"; // Replace with your database username
        String dbPassword = "password"; // Replace with your database password

        // Initialize SettingsBean
        SettingsBean settings = new SettingsBean();

        // Fetch settings from the database
        String sql = "SELECT gymName, contactEmail, contactPhone, address, socialMediaLinks, businessHours FROM settings WHERE id = 1"; // Adjust query as needed

        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Load MySQL JDBC driver
            try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gym", "root", "admin");
                 PreparedStatement stmt = conn.prepareStatement(sql);
                 ResultSet rs = stmt.executeQuery()) {

                if (rs.next()) {
                    settings.setGymName(rs.getString("gymName"));
                    settings.setContactEmail(rs.getString("contactEmail"));
                    settings.setContactPhone(rs.getString("contactPhone"));
                    settings.setAddress(rs.getString("address"));
                    settings.setSocialMediaLinks(rs.getString("socialMediaLinks"));
                    settings.setBusinessHours(rs.getString("businessHours"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
    <form action="updateSettings.jsp" method="post">
        <div class="field-group">
            <label for="gymName">Gym Name:</label>
            <input type="text" id="gymName" name="gymName" value="<%= settings.getGymName() %>">
        </div>
        <div class="field-group">
            <label for="contactEmail">Contact Email:</label>
            <input type="email" id="contactEmail" name="contactEmail" value="<%= settings.getContactEmail() %>">
        </div>
        <div class="field-group">
            <label for="contactPhone">Contact Phone:</label>
            <input type="tel" id="contactPhone" name="contactPhone" value="<%= settings.getContactPhone() %>">
        </div>
        <div class="field-group">
            <label for="address">Address:</label>
            <textarea id="address" name="address" rows="3"><%= settings.getAddress() %></textarea>
        </div>
        <div class="field-group">
            <label for="socialMediaLinks">Social Media Links:</label>
            <input type="text" id="socialMediaLinks" name="socialMediaLinks" value="<%= settings.getSocialMediaLinks() %>">
        </div>
        <div class="field-group">
            <label for="businessHours">Business Hours:</label>
            <textarea id="businessHours" name="businessHours" rows="3"><%= settings.getBusinessHours() %></textarea>
        </div>
        <input type="submit" value="Save Changes">
    </form>
</body>
</html>
