<%@ page import="com.gym_website.entities.Message" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="css/index.css" type="text/css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        .banner-background {
            clip-path: polygon(0 0, 100% 0, 100% 30%, 100% 91%, 70% 100%, 31% 92%, 0 100%, 0% 30%);
        }
    </style>
</head>
<body>
    <!-- NavBar -->
    <%@ include file="navbar.jsp" %>

    <main class="d-flex align-items-center primary-background banner-background" style="height: 70vh">
        <div class="container">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <!-- Header -->
                        <div class="card-header primary-background text-white text-center">
                            <span class="fa fa-user-plus fa-3x"></span>
                            <p>Login here</p>
                        </div>

                        <%
                        Message m = (Message) session.getAttribute("msg");
                        if (m != null) {
                        %>
                        <div class="alert <%= m.getCssClass() %>" role="alert">
                            <%= m.getContent() %>
                        </div>
                        <%
                        session.removeAttribute("msg");
                        }
                        %>

                        <!-- Body -->
                        <div class="card-body">
                            <form action="<%= request.getContextPath() %>/loginservlet" method="post">
                                <div class="form-group">
                                    <label for="loginIdentifier">Email or Phone Number</label>
                                    <input type="text" name="loginIdentifier" required class="form-control" id="loginIdentifier" placeholder="Enter email or phone">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input type="password" name="password" required class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>
                                <div class="container text-center">
                                    <button type="submit" class="btn btn-primary">Submit</button>
                                </div>
                                <div class="text-center mt-3">
                                    <a href="<%= request.getContextPath() %>/ForgotPassword_JSP/forgotPassword.jsp">Forgot Password?</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <%@ include file="script.jsp" %>
    <script type="text/javascript">
        var status = '<%= request.getAttribute("status") %>';
        if (status == "failed") {
            swal("Sorry", "Wrong Username or Password", "error");
        } else if (status == "invalidEmail") {
            swal("Sorry", "Please Enter Username", "error");
        } else if (status == "invalidUpwd") {
            swal("Sorry", "Please Enter Password", "error");
        } else if (status == "resetSuccess") {
            swal("Congrats", "Password Reset Successful", "success");
        } else if (status == "resetFailed") {
            swal("Sorry", "Password Reset Failed", "error");
        }
    </script>
</body>
</html>
