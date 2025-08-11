package com.gym_website.ForgotPassword.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;
import java.util.Random;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.gym_website.helper.ConnectionProvider;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/forgotPassword")
public class ForgotPassword extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String email = request.getParameter("email");
        RequestDispatcher dispatcher = null;
        HttpSession mySession = request.getSession();
        
        // Database check for email existence
        boolean emailExists = checkEmailExists(email);

        if (emailExists) {
            int otpvalue = 0;
            // Generate OTP
            Random rand = new Random();
            otpvalue = rand.nextInt(1255650);

            // Sending OTP via email
            String to = email;
            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.socketFactory.port", "465");
            props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.port", "465");
            Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("saksham.pokhrel.9821.myself@gmail.com", "bmrx xkei wtxi ruwr");
                }
            });
            try {
                MimeMessage message = new MimeMessage(session);
                message.setFrom(new InternetAddress("your-email@gmail.com"));
                message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
                message.setSubject("Your OTP for Password Reset");
                message.setText("Your OTP is: " + otpvalue);
                Transport.send(message);
                System.out.println("OTP sent successfully to " + email);
            } catch (MessagingException e) {
                throw new RuntimeException(e);
            }
            // Forward to OTP entry page with success message
            dispatcher = request.getRequestDispatcher("ForgotPassword_JSP/EnterOtp.jsp");
            request.setAttribute("message", "OTP has been sent to your email.");
            mySession.setAttribute("otp", otpvalue);
            mySession.setAttribute("email", email);
        } else {
            // Email not found, show error message
            dispatcher = request.getRequestDispatcher("forgotPassword.jsp");
            request.setAttribute("error", "This email is not registered. Please sign up.");
        }
        dispatcher.forward(request, response);
    }

    // Method to check if email exists in database
    private boolean checkEmailExists(String email) {
        boolean exists = false;
        try (Connection connection=ConnectionProvider.getConnection();
             PreparedStatement ps = connection.prepareStatement("SELECT * FROM users WHERE email = ?")) {
            ps.setString(1, email);
            try (ResultSet rs = ps.executeQuery()) {
                exists = rs.next();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return exists;
    }
}






/**
by email or phone
@WebServlet("/forgotPassword")
public class ForgotPassword extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String emailOrPhone = request.getParameter("emailOrPhone");
        RequestDispatcher dispatcher = null;
        HttpSession mySession = request.getSession();

        // Check if input is email or phone number
        boolean isEmail = emailOrPhone.contains("@");  // Simple check for email
        boolean emailOrPhoneExists = checkEmailOrPhoneExists(emailOrPhone, isEmail);

        if (emailOrPhoneExists) {
            int otpValue = new Random().nextInt(1255650);  // Generate OTP

            // Sending OTP via email or phone based on the input
            if (isEmail) {
                // Sending OTP to email
                String to = emailOrPhone;
                sendOtpEmail(to, otpValue);
            } else {
                // Sending OTP via SMS (assuming phone number)
                sendOtpSMS(emailOrPhone, otpValue);
            }

            // Forward to OTP entry page
            dispatcher = request.getRequestDispatcher("ForgotPassword_JSP/EnterOtp.jsp");
            request.setAttribute("message", "OTP has been sent to your " + (isEmail ? "email" : "mobile") + ".");
            mySession.setAttribute("otp", otpValue);
            mySession.setAttribute("emailOrPhone", emailOrPhone);
        } else {
            // Email or phone not found in the database
            dispatcher = request.getRequestDispatcher("ForgotPassword_JSP/forgotPassword.jsp");
            request.setAttribute("error", "This email or phone number is not registered. Please sign up.");
        }
        dispatcher.forward(request, response);
    }

    // Method to check if email or phone exists in the database
    private boolean checkEmailOrPhoneExists(String emailOrPhone, boolean isEmail) {
        boolean exists = false;
        try (Connection connection = ConnectionProvider.getConnection()) {
            String query = isEmail ? "SELECT * FROM users WHERE email = ?" : "SELECT * FROM users WHERE mobile = ?";
            try (PreparedStatement ps = connection.prepareStatement(query)) {
                ps.setString(1, emailOrPhone);
                try (ResultSet rs = ps.executeQuery()) {
                    exists = rs.next();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return exists;
    }

    // Method to send OTP email
    private void sendOtpEmail(String to, int otpValue) {
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");

        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("saksham.pokhrel.9821.myself@gmail.com", "bmrx xkei wtxi ruwr");
            }
        });

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress("your-email@gmail.com"));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject("Your OTP for Password Reset");
            message.setText("Your OTP is: " + otpValue);
            Transport.send(message);
            System.out.println("OTP sent successfully to " + to);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    // Method to send OTP via SMS (using an SMS API like Twilio)
    private void sendOtpSMS(String phoneNumber, int otpValue) {
        // Implement your SMS sending logic here using an API like Twilio
        // Example: Twilio API code to send OTP via SMS
        System.out.println("Sending OTP to phone number: " + phoneNumber);
    }
}






 * /
 */