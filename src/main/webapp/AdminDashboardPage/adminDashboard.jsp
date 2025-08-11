<%@page import="com.gym_website.admin.dao.DashboardDAOImpl"%>
<%@page import="com.gym_website.admin.dao.DashboardDAO"%>
<%@ page import="java.util.List" %>

<%@ page import="java.util.stream.Collectors" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page session="true" %>
<%
    String adminName = (String) session.getAttribute("adminName");
    if (adminName == null) {
        response.sendRedirect("AdminDashboardPage/adminLoginPage.jsp");
        return;
    }

    // Initialize DAO objects
    DashboardDAO dao = new DashboardDAOImpl();

    // Fetch data from DAO
    List<Double> earnings = dao.getEarnings();
    int monthlyBookings = dao.getMonthlyBookings();
    int pendingPayments = dao.getPendingPayments();
    int customersEngaged = dao.getCustomersEngaged();

    // Convert earnings list to a comma-separated string
    String earningsData = earnings.stream()
        .map(e -> String.format("%.2f", e))
        .collect(Collectors.joining(", "));
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.0/chart.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 90%;
            margin: auto;
            overflow: hidden;
        }
        .sidebar {
            width: 250px;
            background: #2c3e50;
            color: #fff;
            height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
            padding: 20px;
        }
        .sidebar a {
            color: #fff;
            text-decoration: none;
            display: block;
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 5px;
        }
        .sidebar a:hover {
            background: #1abc9c;
        }
        .main-content {
            margin-left: 250px;
            padding: 20px;
        }
        .stats {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }
        .card {
            background: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            text-align: center;
            flex: 1;
            margin: 0 10px;
        }
        .card h4 {
            margin: 0 0 10px;
        }
        .card p {
            font-size: 24px;
            margin: 0;
        }
        .chart-container {
            margin-top: 20px;
            position: relative;
            height: 400px;
        }
        canvas {
            width: 100% !important;
            height: auto !important;
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <h2>Admin Dashboard</h2>
        <a href="adminDashboard.jsp">Dashboard</a>
        <a href="membersList.jsp">Members</a>
        <a href="earningsOverview.jsp">Earnings</a>
         <a href="settingsPage.jsp">Settings</a>
			<a href="adminLogout.jsp">Logout</a>
			<a href="<%= request.getContextPath() %>/index.jsp">Home</a>
    </div>

    <div class="main-content">
        <h3>Welcome, <%= adminName %>!</h3>
        <div class="stats">
            <div class="card">
                <h4>Total Earnings</h4>
                <p>$<%= earnings.stream().mapToDouble(Double::doubleValue).sum() %></p>
            </div>
            <div class="card">
                <h4>Monthly Bookings</h4>
                <p><%= monthlyBookings %></p>
            </div>
            <div class="card">
                <h4>Pending Payments</h4>
                <p><%= pendingPayments %></p>
            </div>
            <div class="card">
                <h4>Customers Engaged</h4>
                <p><%= customersEngaged %></p>
            </div>
        </div>

        <!-- Earnings Chart -->
        <div class="chart-container">
            <canvas id="earningsChart"></canvas>
        </div>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.0/chart.min.js"></script>
        <script>
            // Earnings Chart
            const ctx = document.getElementById('earningsChart').getContext('2d');
            const earningsChart = new Chart(ctx, {
                type: 'line',
                data: {
                    labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
                    datasets: [{
                        label: 'Earnings Overview',
                        data: [<%= earningsData %>],
                        borderColor: '#3498db',
                        backgroundColor: 'rgba(52, 152, 219, 0.2)',
                        tension: 0.4,
                    }]
                },
                options: {
                    responsive: true,
                    plugins: {
                        legend: {
                            position: 'top',
                        },
                        tooltip: {
                            callbacks: {
                                label: function(tooltipItem) {
                                    return `$${tooltipItem.raw}`;
                                }
                            }
                        }
                    }
                }
            });
        </script>
    </div>
</body>
</html>
