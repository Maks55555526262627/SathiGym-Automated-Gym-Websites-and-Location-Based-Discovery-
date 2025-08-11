package com.gym_website.dao;

import com.gym_website.entities.User;
import com.gym_website.helper.ConnectionProvider;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Logger;
import java.util.logging.Level;

public class UserDao {

    private static final Logger logger = Logger.getLogger(UserDao.class.getName());
    private Connection connection;

    public UserDao(Connection connection) {
        this.connection = connection;
    }

    public boolean saveUser(User user) {
        String query = "INSERT INTO users(name, email, mobile, password, address, dob, gender) VALUES(?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement pstmt = this.connection.prepareStatement(query)) {
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getMobile());
            pstmt.setString(4, user.getPassword());
            pstmt.setString(5, user.getAddress());
            pstmt.setString(6, user.getDob());
            pstmt.setString(7, user.getGender());

            pstmt.executeUpdate();
            
            // Use String.format() to create the log message
            logger.info(String.format("User with email %s saved successfully.", user.getEmail()));
            return true;
        } catch (SQLException e) {
            // Using logger.log() for logging errors
            logger.log(Level.SEVERE, "Error saving user with email {0}: {1}", new Object[]{user.getEmail(), e.getMessage()});
            return false;
        }
    }

    public User getUserByEmailOrPhoneNumberAndPassword(String emailOrPhone, String password) { 
        User user = null;

        try {
            String query = "SELECT * FROM users WHERE (email = ? OR mobile = ?) AND password = ?";
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setString(1, emailOrPhone);
            pstmt.setString(2, emailOrPhone);
            pstmt.setString(3, password);

            ResultSet set = pstmt.executeQuery();
            if (set.next()) {
                user = new User();
                user.setId(set.getInt("id"));
                user.setName(set.getString("name"));
                user.setEmail(set.getString("email"));
                user.setMobile(set.getString("mobile"));
                user.setPassword(set.getString("password"));
                user.setAddress(set.getString("address"));
                user.setDob(set.getString("dob"));
                user.setGender(set.getString("gender"));
                user.setRegister_date(set.getTimestamp("created_at"));
                user.setProfile(set.getString("profile"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    public boolean updateUser(User user) {
        String query = "UPDATE users SET name = ?, email = ?, mobile = ?, password = ?, address = ?, dob = ?, gender = ?, profile = ? WHERE id = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getMobile());
            pstmt.setString(4, user.getPassword());
            pstmt.setString(5, user.getAddress());
            pstmt.setString(6, user.getDob());
            pstmt.setString(7, user.getGender());
            pstmt.setString(8, user.getProfile());
            pstmt.setInt(9, user.getId());

            int rowsUpdated = pstmt.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public User getUserByUserId(int userId) {
        User user = null;
        String query = "SELECT * FROM users WHERE id = ?";
        
        try (PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setInt(1, userId);
            ResultSet set = pstmt.executeQuery();

            if (set.next()) {
                user = new User();
                user.setId(set.getInt("id"));
                user.setName(set.getString("name"));
                user.setEmail(set.getString("email"));
                user.setMobile(set.getString("mobile"));
                user.setPassword(set.getString("password"));
                user.setAddress(set.getString("address"));
                user.setDob(set.getString("dob"));
                user.setGender(set.getString("gender"));
                user.setRegister_date(set.getTimestamp("created_at"));
                user.setProfile(set.getString("profile"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }

    // Check if email exists in the database
    public boolean emailExists(String email) {
        String query = "SELECT COUNT(*) FROM users WHERE email = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setString(1, email);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                int count = rs.getInt(1); // Get the count of records matching the email
                return count > 0; // If count > 0, email exists
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false; // Email does not exist
    }
    
    public boolean checkUserByEmail(String email) {
        boolean emailExists = false;
        try (Connection connection = ConnectionProvider.getConnection()) {
            String query = "SELECT COUNT(*) FROM users WHERE email = ?";
            PreparedStatement pst = connection.prepareStatement(query);
            pst.setString(1, email);
            ResultSet rs = pst.executeQuery();
            if (rs.next() && rs.getInt(1) > 0) {
                emailExists = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return emailExists;
    }

}
