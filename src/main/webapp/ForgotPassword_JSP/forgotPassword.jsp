<!doctype html>
<html>
<head>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>Forgot Password | SathiGym</title>
    <link href='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css' rel='stylesheet'>
    <link href='https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css' rel='stylesheet'>
    <style>
        /* Global styles */
        body {
            background-color: #f4f6f9;
            font-family: "Roboto", sans-serif;
            font-size: 14px;
            color: #333;
        }

        .forgot-container {
            margin-top: 50px;
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            animation: fadeIn 1s ease-in-out;
        }

        .forgot h2 {
            font-size: 28px;
            color: #2b5876;
            margin-bottom: 20px;
            text-align: center;
            font-weight: 600;
        }

        .forgot p {
            text-align: center;
            color: #666;
            font-size: 16px;
        }

        .forgot ol {
            padding-left: 20px;
        }

        .forgot ol li {
            font-size: 14px;
            color: #505050;
        }

        .forgot-form .form-group label {
            font-weight: 500;
            color: #333;
        }

        .forgot-form .form-control {
            border-radius: 8px;
            border: 1px solid #ddd;
            box-shadow: none;
            font-size: 14px;
            padding: 12px;
        }

        .forgot-form .form-control:focus {
            border-color: #76b7e9;
            box-shadow: 0 0 5px rgba(118, 183, 233, 0.5);
        }

        .forgot-form .btn {
            width: 100%;
            font-size: 16px;
            padding: 12px;
            border-radius: 8px;
            border: none;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .forgot-form .btn-success {
            background-color: #28a745;
            color: #fff;
        }

        .forgot-form .btn-danger {
            background-color: #dc3545;
            color: #fff;
            margin-top: 10px;
        }

        .forgot-form .btn:hover {
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
        }

        /* Animation */
        @keyframes fadeIn {
            0% {
                opacity: 0;
                transform: translateY(-50px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body oncontextmenu='return false' class='snippet-body'>
    <div class="container padding-bottom-3x mb-2 mt-5">
        <div class="row justify-content-center">
            <div class="col-lg-8 col-md-10">
                <div class="forgot-container animate__animated animate__fadeIn">
                    <h2>Forgot Your Password?</h2>
                    <p>Change your password in three simple steps to secure your account:</p>
                    <ol class="list-unstyled">
                        <li><span class="text-primary">1.</span> Enter your email address below.</li>
                        <li><span class="text-primary">2.</span> We'll send an OTP to your email.</li>
                        <li><span class="text-primary">3.</span> Enter the OTP on the next page to reset your password.</li>
                    </ol>
                </div>
                <form class="card mt-4 forgot-form" action="<%=application.getContextPath()%>/forgotPassword" method="POST">
                    <div class="card-body">
                        <div class="form-group">
                            <label for="email-for-pass">Enter Your Email Address</label>
                            <input class="form-control" type="text" name="email" id="email-for-pass" required="">
                            <small class="form-text text-muted">Enter the registered email address. We'll email a one-time password (OTP) to this address.</small>
                        </div>
                    </div>
                    <div class="card-footer">
                        <button class="btn btn-success" type="submit">Get New Password</button>
             <a class="btn btn-danger" href="<%= request.getContextPath() %>/login.jsp">Back to Login</a>

                    </div>
                </form>
            </div>
        </div>
    </div>
    <script type='text/javascript' src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js'></script>
</body>
</html>
