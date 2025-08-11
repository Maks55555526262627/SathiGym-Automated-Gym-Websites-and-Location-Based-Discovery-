<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard Statistics</title>
    <link rel="stylesheet" href="style.css">
    <style>
        .card {
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin: 10px;
        }
    </style>
</head>
<body>

<%
    // Simulated data for demonstration
    double totalEarnings = 215000;
    int monthlyBookings = 120;
    int pendingPayments = 18;
    int customersEngaged = 250;
%>

<div class="card">
    <h4>Total Earnings</h4>
    <p>$<%= totalEarnings %></p>
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

</body>
</html>
