<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Page</title>
<script src="https://maps.googleapis.com/maps/api/js?key=${GOOGLE_API_KEY}&callback=initMap"></script>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="css/index.css" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>

    <%@include file="navbar.jsp"%>

<main class="primary-background banner-background" style="padding-bottom: 80px;">
    <div class="container">
        <div class="col-md-6 offset-md-3">
            <div class="card">
                <!-- Header -->
                <div class="card-header text-center primary-background text-white">
                    <span class="fa fa-user-circle fa-3x"></span><br> Create a New Account
                </div>
                <!-- Body -->
                <div class="card-body">
                    <form id="reg-form" action="<%=application.getContextPath()%>/registerservlet" method="post" onsubmit="return validateForm()">
                            <div class="form-group">
                                <label for="user_name">Full Name</label>
                                <input type="text" class="form-control" id="user_name" name="user_name" required>
                            </div>

                            <!-- Email Field with Validation -->
                            <div class="form-group">
                                <label for="user_email">Email</label>
                                <input type="email" class="form-control" id="user_email" name="user_email" required>
                                <div id="email-error" style="color: red; display: none;">Please use a valid email format (e.g., example@mailaddress.com).</div>
                            </div>

                            <!-- Mobile Number Field with Validation -->
                            <div class="form-group">
                                <label for="user_mobile">Mobile Number</label>
                                <input type="tel" class="form-control" id="user_mobile" name="user_mobile" required>
                                <div id="mobile-error" style="color: red; display: none;">Please enter a valid 10-digit mobile number.</div>
                            </div>

                            <!-- Address Field (Required) -->
                            <div class="form-group">
                                <label for="address">Address</label>
                                <input type="text" class="form-control" id="address" name="address" required placeholder="Enter address or use auto-detection">
                                <button type="button" id="detect-address" class="btn btn-secondary mt-2" onclick="detectLocation()">Detect Location</button>
                            </div><!-- Hidden inputs for location -->
                            <input type="hidden" id="latitude" name="latitude"> 
                            <input type="hidden" id="longitude" name="longitude">

                            <!-- Password and Confirm Password with Strength Validation -->
                            <div class="form-group">
                                <label for="new-password">New Password</label>
                                <div class="password-container input-group">
                                    <input type="password" class="form-control" id="new-password" name="new-password" required>
                                    <div class="input-group-append">
                                        <span class="input-group-text"><i class="fa fa-eye" id="toggle-password"></i></span>
                                    </div>
                                </div>
                                <div id="password-strength" class="small mt-2"></div>
                            </div>

                            <div class="form-group">
                                <label for="user_password">Confirm Password</label>
                                <div class="password-container input-group">
                                    <input type="password" class="form-control" id="user_password" name="user_password" required>
                                    <div class="input-group-append">
                                        <span class="input-group-text"><i class="fa fa-eye" id="toggle-confirm-password"></i></span>
                                    </div>
                                </div>
                                <div id="password-match" class="small mt-2"></div>
                            </div>

                            <div class="form-group">
                                <label for="dob">Date of Birth</label>
                                <input type="date" class="form-control" id="dob" name="dob" required max="<%=java.time.LocalDate.now().minusYears(19).toString()%>" title="You must be at least 19 years old to register">
                            </div>

                            <div class="form-group">
                                <label>Gender</label><br>
                                <input type="radio" name="gender" value="Male" required> Male
                                <input type="radio" name="gender" value="Female" required> Female
                            </div>

                            <div class="form-check mb-3">
                                <input type="checkbox" class="form-check-input" id="terms" name="check" required>
                                <label class="form-check-label" for="terms"> I agree to the <a href="#">Terms, Privacy Policy</a>, and <a href="#">Cookies Policy</a>.</label>
                            </div>

                            <br>
                            <div class="container text-center" id="loader" style="display: none;">
                                <span class="fa fa-refresh fa-spin fa-4x"></span>
                                <h4>Please wait...</h4>
                            </div>

                            <button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
                        </form>
                </div>
            </div>
        </div>
    </div>
</main>

<script>

//Email Validation
document.getElementById('user_email').addEventListener('input', function() {
    const emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
    const email = this.value;
    document.getElementById('email-error').style.display = emailPattern.test(email) ? 'none' : 'block';
});

// Mobile Number Validation
document.getElementById('user_mobile').addEventListener('input', function() {
    const mobilePattern = /^[0-9]{10}$/;
    const mobile = this.value;
    document.getElementById('mobile-error').style.display = mobilePattern.test(mobile) ? 'none' : 'block';
});

// Password Strength Validation
document.getElementById('new-password').addEventListener('input', function() {
    const password = this.value;
    const strengthMessage = document.getElementById('password-strength');
    const strongPasswordPattern = /^(?=.*[A-Z])(?=.*\W).{5,}$/;

    if (!strongPasswordPattern.test(password)) {
        strengthMessage.innerText = 'Password must be at least 5 characters long, with one uppercase letter and one special character.';
        strengthMessage.style.color = 'red';
    } else {
        strengthMessage.innerText = '';
    }
});

// Confirm Password Match Validation
document.getElementById('user_password').addEventListener('input', function() {
    const password = document.getElementById('new-password').value;
    const confirmPassword = this.value;
    const matchMessage = document.getElementById('password-match');

    matchMessage.innerText = password === confirmPassword ? '' : 'Passwords do not match';
});



// Function to detect location
function detectLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(
            function(position) {
                const latitude = position.coords.latitude;
                const longitude = position.coords.longitude;

                // Set hidden fields with latitude and longitude
                document.getElementById('latitude').value = latitude;
                document.getElementById('longitude').value = longitude;

                // Display location in the address field
                document.getElementById('address').value = `Lat: ${latitude}, Long: ${longitude}`;

                // Make the address field non-editable after detecting the location
                document.getElementById('address').readOnly = true;

                // Optionally, disable the "Detect Location" button to prevent multiple clicks
                document.getElementById('detect-address').disabled = true;
            },
            function() {
                alert('Geolocation failed. Please allow location access.');
            }
        );
    } else {
        alert('Geolocation is not supported by this browser.');
    }
}


					
					
	
	
					
					
					
					
					
					
					
					
					
					
					// Toggle password visibility
					document.getElementById('toggle-password').addEventListener('click', function() {
					    const passwordField = document.getElementById('new-password');
					    passwordField.type = passwordField.type === 'password' ? 'text' : 'password';
					});

					document.getElementById('toggle-confirm-password').addEventListener('click', function() {
					    const confirmPasswordField = document.getElementById('user_password');
					    confirmPasswordField.type = confirmPasswordField.type === 'password' ? 'text' : 'password';
					});

					// Password match validation
					document.getElementById('user_password').addEventListener('input', function() {
					    const confirmPassword = this.value;
					    const password = document.getElementById('new-password').value;
					    const matchMessage = document.getElementById('password-match');
					    
					    if (password !== confirmPassword) {
					        matchMessage.innerText = 'Passwords do not match';
					        matchMessage.style.color = 'red';
					    } else {
					        matchMessage.innerText = 'Passwords match';
					        matchMessage.style.color = 'green';
					    }
					});

					// Validate the entire form before submission
			        function validateForm() {
			            const form = document.getElementById('reg-form');
			            const password = document.getElementById('new-password').value;
			            const confirmPassword = document.getElementById('user_password').value;
			            const email = document.getElementById('user_email').value;
			            const mobile = document.getElementById('user_mobile').value;

			            // Check if terms and conditions are checked
			            const termsChecked = document.getElementById('terms').checked;
			            if (!termsChecked) {
			                alert('You must agree to the terms and conditions.');
			                return false;
			            }

			            // Check for password match
			            if (password !== confirmPassword) {
			                alert('Passwords do not match.');
			                return false;
			            }

			            // Validate email and mobile again
			            if (!email || !mobile) {
			                alert('Please provide a valid email and mobile number.');
			                return false;
			            }

			            return true;  // Allow the form to submit
			        }

	
	
	
</script>
<%@include file="script.jsp"%>

</body>
</html>
