<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Members List</title>
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
    </style>
</head>
<body>

<%
    // Simulated data for demonstration
    String[][] members = {
        {"1", "John Doe", "john@example.com", "123-456-7890"},
        {"2", "Jane Smith", "jane@example.com", "234-567-8901"},
        {"3", "Emily Johnson", "emily@example.com", "345-678-9012"}
    };
%>

<h2>Members List</h2>

<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Phone</th>
        </tr>
    </thead>
    <tbody>
        <% for (String[] member : members) { %>
            <tr>
                <td><%= member[0] %></td>
                <td><%= member[1] %></td>
                <td><%= member[2] %></td>
                <td><%= member[3] %></td>
            </tr>
        <% } %>
    </tbody>
</table>

</body>
</html>
