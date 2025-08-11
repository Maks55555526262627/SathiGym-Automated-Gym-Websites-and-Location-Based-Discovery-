package com.gym_website.helper;

import java.sql.*;

public class ConnectionProvider {

	private static Connection connection;

	public static Connection getConnection() {

		try {
			// Check if the connection is null or closed
			if (connection == null || connection.isClosed()) {
				// Load the JDBC driver
				Class.forName("com.mysql.cj.jdbc.Driver");

				// Establish the connection
				connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/gym_website", "root", "admin");
			}
		} catch (Exception e) {
			e.printStackTrace(); // Handle the exception for driver not found
		}

		return connection;
	}

}
