<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet, java.util.ArrayList, java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Earnings Overview</title>
    <link rel="stylesheet" href="style.css">
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
        }
        th {
            background-color: #f4f4f4;
        }
        .container {
            padding: 20px;
        }
        #earningsChart {
            width: 100%;
            height: 400px;
        }
    </style>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script> <!-- Include Chart.js -->
</head>
<body>

<div class="container">
    <h2>Earnings Overview</h2>

    <%
        // Database connection parameters
        String jdbcURL = "jdbc:mysql://localhost:3306/your_database"; // Replace with your database URL
        String dbUser = "root"; // Replace with your database username
        String dbPassword = "password"; // Replace with your database password

        // Database connection and SQL query
        List<String[]> earnings = new ArrayList<>();
        String sql = "SELECT date, amount, description FROM payments"; // Replace with your actual table and column names

        List<String> labels = new ArrayList<>();
        List<Double> data = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Load MySQL JDBC driver
            try (Connection conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
                 PreparedStatement stmt = conn.prepareStatement(sql);
                 ResultSet rs = stmt.executeQuery()) {

                while (rs.next()) {
                    String date = rs.getString("date");
                    String amount = rs.getString("amount");
                    String description = rs.getString("description");
                    earnings.add(new String[]{date, amount, description});
                    labels.add(date);
                    data.add(Double.parseDouble(amount));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>

    <table>
        <thead>
            <tr>
                <th>Date</th>
                <th>Amount</th>
                <th>Description</th>
            </tr>
        </thead>
        <tbody>
            <% for (String[] earning : earnings) { %>
                <tr>
                    <td><%= earning[0] %></td>
                    <td>$<%= earning[1] %></td>
                    <td><%= earning[2] %></td>
                </tr>
            <% } %>
        </tbody>
    </table>

    <canvas id="earningsChart"></canvas>
    <script>
        const ctx = document.getElementById('earningsChart').getContext('2d');
        const earningsChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: <%= labels.toString().replaceAll("\"", "'") %>, // Convert Java List to JS Array
                datasets: [{
                    label: 'Earnings Overview',
                    data: <%= data.toString() %>, // Convert Java List to JS Array
                    borderColor: '#3498db',
                    tension: 0.4,
                }]
            },
            options: {
                animations: {
                    tension: {
                        duration: 1000,
                        easing: 'easeInOutBounce',
                        from: 1,
                        to: 0,
                        loop: true
                    }
                }
            }
        });
    </script>
</div>

</body>
</html>
