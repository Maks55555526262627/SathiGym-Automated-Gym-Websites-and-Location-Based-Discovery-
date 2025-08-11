<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>About Us - SathiGym</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <style>
        /* Background with subtle gradient */
        body {
            background: linear-gradient(135deg, #f0f4f8, #d9e2ec);
            font-family: Arial, sans-serif;
            color: #333;
        }
        
        .about-container {
            margin-top: 50px;
            text-align: center;
            background-color: #ffffff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h1 {
            color: #2b5876;
        }

        .about-description {
            font-size: 1.1em;
            color: #666;
            margin-top: 20px;
            line-height: 1.6;
        }

        .carousel-inner img {
            border-radius: 8px;
            height: 350px;
            object-fit: cover;
        }

        .back-button {
            margin-top: 30px;
        }

        /* Button styling */
        .btn-secondary {
            background-color: #4b6584;
            border-color: #4b6584;
            color: #fff;
        }

        .btn-secondary:hover {
            background-color: #3b4d63;
            border-color: #3b4d63;
        }
    </style>
</head>
<body>
    <div class="container about-container animate__animated animate__fadeIn">
        <h1 class="display-4 text-primary mb-4">About Us</h1>
        <div class="row">
            <div class="col-md-6 mb-4">
                <!-- Slideshow / Carousel -->
                <div id="aboutCarousel" class="carousel slide animate__animated animate__zoomIn" data-ride="carousel" data-interval="2500">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="nearbygym/img/Active.jpg" class="d-block w-100" alt="Community Engagement">
                        </div>
                        <div class="carousel-item">
                            <img src="nearbygym/img/BUTWAL.jpg" class="d-block w-100" alt="Advanced Fitness Tracking">
                        </div>
                        <div class="carousel-item">
                            <img src="nearbygym/img/KTM.jpg" class="d-block w-100" alt="Professional Trainers">
                        </div>
                        <div class="carousel-item">
                            <img src="nearbygym/img/ROYAL.jpg" class="d-block w-100" alt="State-of-the-Art Facilities">
                        </div>
                        <div class="carousel-item">
                            <img src="nearbygym/img/MOSAKA FITNESS.jpg" class="d-block w-100" alt="Fitness for Everyone">
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#aboutCarousel" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#aboutCarousel" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
            <div class="col-md-6 d-flex align-items-center">
                <div>
                    <p class="about-description">
                        <strong>SathiGym</strong> is designed to bring people closer to fitness opportunities in their local area. 
                        We provide a seamless way for users to find nearby gyms, compare facilities, and connect with the best fitness centers around them. 
                        With SathiGym, gym owners can easily set up their profiles, manage memberships, and attract fitness enthusiasts.
                    </p>
                    <p class="about-description">
                        Our platform also helps gym-goers book sessions, track fitness progress, and engage with trainers. 
                        At SathiGym, we believe in fostering a healthy community by making fitness accessible, convenient, 
                        and enjoyable for everyone.
                    </p>
                    <p class="about-description">
                        Join us and be part of a community dedicated to promoting health, fitness, and wellness. Whether you’re a gym owner or a fitness enthusiast, 
                        SathiGym is here to support your journey and connect you to resources that make fitness a lifestyle.
                    </p>
                </div>
            </div>
        </div>
        
        <!-- Back Button -->
        <div class="back-button">
            <a href="index.jsp" class="btn btn-secondary btn-lg">Back to Home</a>
        </div>
    </div>
    
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>
