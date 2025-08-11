
<%@page import="com.gym_website.dao.LikeDao"%>
<%@page import="com.gym_website.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.gym_website.dao.UserDao"%>
<%@page import="com.gym_website.entities.Post"%>
<%@page import="com.gym_website.helper.ConnectionProvider"%>
<%@page import="com.gym_website.dao.PostDao"%>
<%@page import="com.gym_website.entities.User"%>
<%@page errorPage="error_page.jsp"%>
<%
User user = (User) session.getAttribute("currentUser");
if (user == null) {
	response.sendRedirect("login_page.jsp");
}
%>
<%
int postId = Integer.parseInt(request.getParameter("post_id"));
PostDao d = new PostDao(ConnectionProvider.getConnection());
Post p = d.getPostByPostId(postId);
%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><%=p.getGym_name()%> || TechBlog by Saksham</title>
<!--bootstrap CSS  -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/index.css" type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
    <style>
        /* Basic Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        

        /* Body Styling */
        body {
            font-family: 'Poppins', sans-serif;
            line-height: 1.6;
            background: linear-gradient(135deg, #f4f4f4, #e8e8e8);
            color: #333;
            overflow-x: hidden;
            scroll-behavior: smooth;
        }

        /* Header */
        header {
            background-image: url('<%= request.getContextPath() %>/post_pics/gymPhotos/<%= p.getGym_photo() %>');
            background-size: cover;
            background-position: center;
            color: white;
            text-align: center;
            padding: 5rem 2rem;
            position: relative;
            overflow: hidden;
        }

        header h1 {
            font-size: 3rem;
            animation: fadeInDown 1s ease-in-out;
        }

        header p {
            font-size: 1.5rem;
            margin-top: 1rem;
            animation: fadeInUp 1s ease-in-out;
        }

        @keyframes fadeInDown {
            from {
                transform: translateY(-50px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        @keyframes fadeInUp {
            from {
                transform: translateY(50px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        /* Main Content */
        .content {
            padding: 3rem 2rem;
            text-align: center;
        }

        .content section {
            margin-bottom: 3rem;
        }

        h2 {
            margin-bottom: 1rem;
            color: #333;
            font-size: 2.5rem;
            position: relative;
            display: inline-block;
        }

        p {
            margin-bottom: 1rem;
            color: #666;
            font-size: 1.1rem;
        }

        /* Centered Header */
        .centered-header {
            text-align: center;
            margin-bottom: 2rem;
        }

        /* Scrollable Cards */
        .scrollable-cards {
            display: flex;
            flex-wrap: nowrap;
            overflow-x: auto;
            padding: 1rem 0;
            gap: 1rem;
        }

        .scrollable-cards::-webkit-scrollbar {
            height: 8px;
        }

        .scrollable-cards::-webkit-scrollbar-thumb {
            background-color: #ff6b6b;
            border-radius: 10px;
        }

        .scrollable-cards::-webkit-scrollbar-track {
            background-color: #f4f4f4;
        }

        /* Styling for individual cards */
        .service-item, .trainer, .rewards-item {
            flex: 0 0 auto;
            width: calc(25% - 1rem); /* 4 items per row */
            box-sizing: border-box;
            background-color: white;
            border-radius: 10px;
            padding: 2rem;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease-in-out;
        }

        .service-item h3, .trainer h3, .rewards-item h4 {
            color: #ff6b6b;
        }

        .service-item:hover, .trainer:hover {
            transform: translateY(-10px);
            box-shadow: 0 0 25px rgba(0, 0, 0, 0.2);
        }

        /* Owner Section */
        .owner {
            display: flex;
            flex-direction: column;
            align-items: center;
            background-color: #fff;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            animation: fadeIn 1s ease-in-out;
            position: relative;
            overflow: hidden;
        }

        .owner img {
            border-radius: 50%;
            width: 150px;
            height: 150px;
            object-fit: cover;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
            margin-bottom: 1rem;
            animation: zoomIn 1s ease-in-out;
        }

        @keyframes zoomIn {
            from {
                transform: scale(0.8);
                opacity: 0;
            }
            to {
                transform: scale(1);
                opacity: 1;
            }
        }

        .owner-info {
            max-width: 500px;
            text-align: center;
            animation: fadeIn 1s ease-in-out;
        }

        .owner-info h3 {
            color: #ff6b6b;
            margin-bottom: 1rem;
            font-size: 1.8rem;
            opacity: 0;
            animation: fadeInUp 1s ease-in-out 0.5s forwards;
        }

        .owner-info p {
            font-size: 1.1rem;
            color: #666;
        }

        @keyframes fadeInUp {
            from {
                transform: translateY(30px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

       /* Register Form */
       .hidden {
            display: none;
        }
.register-form {
    max-width: 600px;
    margin: 2rem auto;
    padding: 3rem;
    background-color: white;
    border-radius: 10px;
    box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
    animation: popUp 0.5s ease-in-out;
}

@keyframes popUp {
    from {
        transform: scale(0.9);
        opacity: 0;
    }
    to {
        transform: scale(1);
        opacity: 1;
    }
}


/* Register Form */
/* General Styles */

.centered-header {
    text-align: center;
    margin-bottom: 2rem;
}

.hidden {
    display: none;
}

.payment-logo {
    width: 30px;
    height: auto;
    vertical-align: middle;
    margin-left: 5px;
}

/* Register Form */
.register-form {
    max-width: 600px;
    margin: 2rem auto;
    padding: 3rem;
    background-color: white;
    border-radius: 10px;
    box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
    animation: popUp 0.5s ease-in-out;
}

@keyframes popUp {
    from {
        transform: scale(0.9);
        opacity: 0;
    }
    to {
        transform: scale(1);
        opacity: 1;
    }
}

.register-form input, .register-form select, .register-form textarea, .register-form button {
    width: 100%;
    padding: 1rem;
    margin: 0.5rem 0;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 1rem;
}

.register-form textarea {
    resize: vertical;
    min-height: 80px;
}

.register-form button {
    background-color: #ff6b6b;
    color: white;
    border: none;
    cursor: pointer;
    transition: background-color 0.3s ease-in-out;
}

.register-form button:hover {
    background-color: #e05757;
}

.time-slot-section {
    margin: 1rem 0;
}

.additional-fields, .disability-section {
    margin-top: 1rem;
}

.additional-fields textarea, .disability-section textarea {
    margin-top: 0.5rem;
}

/* Payment Options */
/* Payment Options Section */
.payment {
    max-width: 600px;
    margin: 2rem auto;
    padding: 2rem;
    background-color: white;
    border-radius: 10px;
    box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
    animation: popUp 0.5s ease-in-out;
}

.payment-logo-container {
    display: flex;
    align-items: center;
    padding: 1rem;
    border: 1px solid #ddd;
    border-radius: 8px;
    margin: 0.5rem 0;
    transition: background-color 0.3s, transform 0.3s;
}

.payment-logo-container:hover {
    background-color: #f0f0f0;
    transform: scale(1.02);
}

.payment-logo {
    width: 40px;
    height: auto;
    margin-right: 10px;
}

.payment-form {
    display: flex;
    flex-direction: column;
}

.payment-form input[type="radio"] {
    display: none;
}

.payment-form label {
    cursor: pointer;
}

.payment-form button {
    background-color: #4caf50;
    color: white;
    border: none;
    cursor: pointer;
    padding: 1rem;
    border-radius: 5px;
    font-size: 1rem;
    transition: background-color 0.3s ease-in-out;
}

.payment-form button:hover {
    background-color: #45a049;
}

/* Animations */
@keyframes popUp {
    from {
        transform: scale(0.9);
        opacity: 0;
    }
    to {
        transform: scale(1);
        opacity: 1;
    }
}

       
        footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 2rem 2rem;
            margin-top: 2rem;
        }

        footer a {
            color: #ff6b6b;
            margin: 0 10px;
            transition: color 0.3s ease-in-out;
        }

        footer a:hover {
            color: #e05757;
        }

    </style>
</head>
<body>

    <!-- Header Section -->
    <header>
        <h1>Welcome to <%=p.getGym_name()%></h1>
        <p>Your Journey to Fitness Starts Here</p>
    </header>

    <!-- Main Content -->
    <div class="content">

        <!-- About Section -->
        <section class="about">
            <h2>About Us</h2>
            <p><%=p.getAbout_gym()%></p>
        </section>

        <!-- Services Section -->
        <section class="services">
            <div class="centered-header">
                <h2>Our Services</h2>
            </div>
            <div class="scrollable-cards">
                <div class="service-item">
                    <h3>Personal Training</h3>
                    <p>One-on-one training sessions with our certified trainers to help you achieve your specific fitness goals.</p>
                </div>
                <div class="service-item">
                    <h3>Group Classes</h3>
                    <p>Join our high-energy group classes, including yoga, HIIT, spinning, and more, designed to challenge and inspire.</p>
                </div>
                <div class="service-item">
                    <h3>Cardio & Strength Equipment</h3>
                    <p>Access a wide range of modern cardio and strength equipment to build endurance and muscle.</p>
                </div>
                <div class="service-item">
                    <h3>Nutrition Counseling</h3>
                    <p>Get expert advice on nutrition to complement your fitness routine and achieve optimal results.</p>
                </div>
                <!-- Add more service items as needed -->
            </div>
        </section>

        <!-- Trainers Section -->
        <section class="trainers">
            <div class="centered-header">
                              <h2>Meet Our Trainers</h2>
            </div>
            <div class="scrollable-cards">
                <div class="trainer">
                    <img src="https://via.placeholder.com/150" alt="Trainer 1"> <!-- Replace with actual trainer image -->
                    <h3>Trainer Name 1</h3>
                    <p>Specialty: Strength Training</p>
                </div>
                <div class="trainer">
                    <img src="https://via.placeholder.com/150" alt="Trainer 2"> <!-- Replace with actual trainer image -->
                    <h3>Trainer Name 2</h3>
                    <p>Specialty: Yoga & Flexibility</p>
                </div>
                <div class="trainer">
                    <img src="https://via.placeholder.com/150" alt="Trainer 3"> <!-- Replace with actual trainer image -->
                    <h3>Trainer Name 3</h3>
                    <p>Specialty: Cardio & Conditioning</p>
                </div>
                <div class="trainer">
                    <img src="https://via.placeholder.com/150" alt="Trainer 4"> <!-- Replace with actual trainer image -->
                    <h3>Trainer Name 4</h3>
                    <p>Specialty: Functional Training</p>
                </div>
                <!-- Add more trainer items as needed -->
            </div>
        </section>

        <!-- Owner Section -->
        <section class="owner">
			<img src="<%= request.getContextPath() + "/post_pics/ownerPhotos/" + p.getOwner_photo() %>" alt="Gym Owner">
            <div class="owner-info">
                <h3><%=p.getOwner_name()%></h3>
                <p>Welcome to <%=p.getGym_name()%>! I am dedicated to providing a top-notch fitness experience and helping you achieve your goals. Feel free to reach out to me if you have any questions or need assistance.</p>
            </div>
        </section>

        <!-- Rewards and Awards Section -->
        <section class="rewards">
            <div class="centered-header">
                <h2>Our Rewards and Awards</h2>
            </div>
            <div class="scrollable-cards">
                <div class="rewards-item">
                    <h4>Best Fitness Center 2023</h4>
                    <p>Awarded by [Fitness Association] for excellence in facilities and service.</p>
                </div>
                <div class="rewards-item">
                    <h4>Top Personal Trainer 2023</h4>
                    <p>Recognized by [Fitness Magazine] for outstanding personal training services.</p>
                </div>
                <div class="rewards-item">
                    <h4>Most Innovative Gym 2023</h4>
                    <p>Honored for our innovative fitness programs and cutting-edge equipment.</p>
                </div>
                <div class="rewards-item">
                    <h4>Best Community Engagement</h4>
                    <p>Awarded for our commitment to community fitness and health initiatives.</p>
                </div>
                <!-- Add more rewards items as needed -->
            </div>
        </section>

     <!-- Registration Form Section -->


<!-- Registration Form Section -->
<section class="registration">
    <div class="centered-header">
        <h2>Book Your Gym Time</h2>
    </div>
    <form class="register-form" id="registrationForm">
        <input type="text" id="fullName" placeholder="Full Name" required>
        <input type="email" id="emailAddress" placeholder="Email Address" required>
        <input type="tel" id="phoneNumber" placeholder="Phone Number" required>

        <!-- Time Slot Selection -->
        <div class="time-slot-section">
            <label for="timeSlot">Preferred Training Time:</label>
            <select id="timeSlot" required>
                <option value="">Select a time slot</option>
                <!-- Options to be populated dynamically -->
            </select>
        </div>

        <!-- Additional Fields -->
        <div class="additional-fields">
            <input type="checkbox" id="medicalConditionsCheckbox">
            <label for="medicalConditionsCheckbox">I have medical conditions</label>
            <div id="medicalConditionsDetails" class="hidden">
                <textarea id="medicalConditions" placeholder="Please describe your medical conditions"></textarea>
                <textarea id="medications" placeholder="What medicine are you taking?"></textarea>
                <textarea id="medicalSummary" placeholder="Summary of your health issue and what you want to do"></textarea>
                <textarea id="medicalDetails" placeholder="Detailed explanation of your health issue"></textarea>
            </div>
        </div>

        <div class="disability-section">
            <input type="checkbox" id="disabilityCheckbox">
            <label for="disabilityCheckbox">I have a disability</label>
            <div id="disabilityDetails" class="hidden">
                <textarea id="disabilitySummary" placeholder="Please describe your disability"></textarea>
                <textarea id="disabilityDetailsTextarea" placeholder="Detailed explanation of your disability"></textarea>
            </div>
        </div>

        <button type="button" onclick="handleRegistration()">Register</button>
    </form>
</section>

<!-- Payment Options Section -->
<section class="payment hidden" id="paymentSection">
    <div class="centered-header">
        <h2>Select Payment Method</h2>
    </div>
    <form class="payment-form" id="paymentForm">
        <label for="payOnline" class="payment-option">
            <input type="radio" id="payOnline" name="paymentMethod" value="online" checked>
            <div class="payment-logo-container">
                <img src="path/to/online-payment-logo.png" alt="Online Payment" class="payment-logo">
                <span>Online Payment</span>
            </div>
        </label>

        <label for="esewa" class="payment-option">
            <input type="radio" id="esewa" name="paymentMethod" value="esewa">
            <div class="payment-logo-container">
                <img src="path/to/esewa-logo.png" alt="eSewa" class="payment-logo">
                <span>eSewa</span>
            </div>
        </label>

        <label for="khalti" class="payment-option">
            <input type="radio" id="khalti" name="paymentMethod" value="khalti">
            <div class="payment-logo-container">
                <img src="path/to/khalti-logo.png" alt="Khalti" class="payment-logo">
                <span>Khalti</span>
            </div>
        </label>

        <label for="onlineBanking" class="payment-option">
            <input type="radio" id="onlineBanking" name="paymentMethod" value="onlineBanking">
            <div class="payment-logo-container">
                <img src="path/to/online-banking-logo.png" alt="Online Banking" class="payment-logo">
                <span>Online Banking</span>
            </div>
        </label>

        <label for="visa" class="payment-option">
            <input type="radio" id="visa" name="paymentMethod" value="visa">
            <div class="payment-logo-container">
                <img src="path/to/visa-logo.png" alt="Visa" class="payment-logo">
                <span>Visa</span>
            </div>
        </label>

        <label for="cashPay" class="payment-option">
            <input type="radio" id="cashPay" name="paymentMethod" value="cashPay">
            <div class="payment-logo-container">
                <img src="path/to/cash-pay-logo.png" alt="Cash Pay" class="payment-logo">
                <span>Cash Pay</span>
            </div>
        </label>

        <button type="submit">Proceed to Payment</button>
    </form>
</section>


    </div>

<!-- Footer -->
<footer>
    <p>&copy; 2024 <%=p.getGym_name()%>. All Rights Reserved.</p>
    <p>
        <a href="#">Privacy Policy</a> | 
        <a href="#">Terms of Service</a> | 
        <a href="#">Contact Us</a>
    </p>
</footer>
<script>
// Function to toggle visibility of sections
function toggleSection(sectionId) {
    const section = document.getElementById(sectionId);
    section.classList.toggle('hidden');
}

// Function to handle registration validation
function handleRegistration() {
    var fullName = document.getElementById('fullName').value.trim();
    var emailAddress = document.getElementById('emailAddress').value.trim();
    var phoneNumber = document.getElementById('phoneNumber').value.trim();
    var timeSlot = document.getElementById('timeSlot').value;
    var medicalConditionsCheckbox = document.getElementById('medicalConditionsCheckbox');
    var disabilityCheckbox = document.getElementById('disabilityCheckbox');
    var medicalConditionsTextarea = document.getElementById('medicalConditions');
    var disabilitySummaryTextarea = document.getElementById('disabilitySummary');

    // Basic required fields check
    if (!fullName || !emailAddress || !phoneNumber || !timeSlot) {
        alert("Please fill in all the required fields.");
        return;
    }

    // Check medical conditions field if the checkbox is checked
    if (medicalConditionsCheckbox.checked && !medicalConditionsTextarea.value.trim()) {
        alert("Please describe your medical conditions.");
        medicalConditionsTextarea.focus();
        return;
    }

    // Check disability field if the checkbox is checked
    if (disabilityCheckbox.checked && !disabilitySummaryTextarea.value.trim()) {
        alert("Please describe your disability.");
        disabilitySummaryTextarea.focus();
        return;
    }

    // If validation passes, proceed to show payment options
    alert("Registration completed successfully!");
    document.getElementById('paymentSection').classList.remove('hidden');
}

// Function to toggle visibility of additional sections based on checkbox
document.getElementById('medicalConditionsCheckbox').addEventListener('change', function() {
    var medicalConditionsDetails = document.getElementById('medicalConditionsDetails');
    if (this.checked) {
        medicalConditionsDetails.classList.remove('hidden');
    } else {
        medicalConditionsDetails.classList.add('hidden');
    }
});

document.getElementById('disabilityCheckbox').addEventListener('change', function() {
    var disabilityDetails = document.getElementById('disabilityDetails');
    if (this.checked) {
        disabilityDetails.classList.remove('hidden');
    } else {
        disabilityDetails.classList.add('hidden');
    }
});

// Function to populate time slots
function populateTimeSlots(timeSlots) {
    var timeSlotSelect = document.getElementById('timeSlot');
    timeSlots.forEach(function(slot) {
        var option = document.createElement('option');
        option.value = slot.value;
        option.textContent = slot.text;
        timeSlotSelect.appendChild(option);
    });
}

// Example time slots (replace with dynamic data if needed)
var timeSlots = [
    { value: '09:00-10:00', text: '09:00 AM - 10:00 AM' },
    { value: '10:00-11:00', text: '10:00 AM - 11:00 AM' },
    { value: '11:00-12:00', text: '11:00 AM - 12:00 PM' },
    { value: '12:00-01:00', text: '12:00 PM - 01:00 PM' }
];

// Populate time slots on page load
window.onload = function() {
    populateTimeSlots(timeSlots);
};
</script>
</body>
</html>