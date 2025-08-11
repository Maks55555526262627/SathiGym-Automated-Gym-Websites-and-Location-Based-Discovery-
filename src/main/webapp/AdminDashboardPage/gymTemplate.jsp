<%-- <%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet" %>
<%
    String gymId = request.getParameter("id");

    // Database connection parameters
    String jdbcURL = "jdbc:mysql://localhost:3306/your_database";
    String dbUser = "root";
    String dbPassword = "admin";

    // SQL select query
    String sql = "SELECT gymName, contactEmail, contactPhone, address, socialMediaLinks, businessHours FROM gyms WHERE id = ?";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        try (Connection conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, Integer.parseInt(gymId));
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    String gymName = rs.getString("gymName");
                    String contactEmail = rs.getString("contactEmail");
                    String contactPhone = rs.getString("contactPhone");
                    String address = rs.getString("address");
                    String socialMediaLinks = rs.getString("socialMediaLinks");
                    String businessHours = rs.getString("businessHours");
        %>
        <!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title><%= gymName %> - Details</title>
            <style>
                /* Your CSS for gym template page */
                /* Basic Reset */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

/* Body Styling */
body {
    font-family: 'Poppins', sans-serif;
    background-color: #f4f4f4;
    color: #333;
    line-height: 1.6;
    padding: 2rem;
}

/* Header Styling */
header {
    background-color: #ff6b6b;
    color: white;
    padding: 1.5rem 2rem;
    border-radius: 10px;
    text-align: center;
    margin-bottom: 2rem;
}

header h1 {
    font-size: 2.5rem;
    margin-bottom: 0.5rem;
}

header p {
    font-size: 1.2rem;
}

/* Main Content Styling */
.content {
    max-width: 800px;
    margin: 0 auto;
    padding: 1rem;
    background: white;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.content section {
    margin-bottom: 1.5rem;
}

.content h2 {
    font-size: 1.8rem;
    color: #ff6b6b;
    margin-bottom: 0.5rem;
}

.content p {
    font-size: 1rem;
    color: #666;
}

/* Footer Styling */
footer {
    text-align: center;
    padding: 1rem;
    background-color: #ff6b6b;
    color: white;
    border-radius: 10px;
    margin-top: 2rem;
}

/* Responsive Design */
@media (max-width: 768px) {
    .content {
        padding: 0.5rem;
    }

    header h1 {
        font-size: 2rem;
    }

    header p {
        font-size: 1rem;
    }

    .content h2 {
        font-size: 1.5rem;
    }

    .content p {
        font-size: 0.9rem;
    }
}
                
            </style>
        </head>
        <body>
            <header>
                <h1><%= gymName %></h1>
                <p>Your Fitness Destination</p>
            </header>
            <div class="content">
                <section>
                    <h2>Contact Information</h2>
                    <p>Email: <%= contactEmail %></p>
                    <p>Phone: <%= contactPhone %></p>
                </section>
                <section>
                    <h2>Address</h2>
                    <p><%= address %></p>
                </section>
                <section>
                    <h2>Social Media Links</h2>
                    <p><%= socialMediaLinks %></p>
                </section>
                <section>
                    <h2>Business Hours</h2>
                    <p><%= businessHours %></p>
                </section>
            </div>
            <footer>
                <p>&copy; 2024 <%= gymName %>. All Rights Reserved.</p>
            </footer>
        </body>
        </html>
        <%
                } else {
                    response.sendRedirect("error.jsp"); // Redirect to an error page if gym not found
                }
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("error.jsp"); // Redirect to an error page
    }
%>
 --%>