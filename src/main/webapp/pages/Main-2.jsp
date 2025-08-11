<style>
 
/* MAIN 2 */
 
.main-2 {
    overflow: hidden;
    height: 85vh;
    position: relative;
}
.main-2 .picture-1 {
    position: absolute;
    width: 25rem;
    top: 8%;
    left: 50%;
    transform: translate(-50%, -50%);
    object-fit: cover;
}

.main-2 .picture-2 {
    position: absolute;
    width: 35rem;
    top: 50%;
    left: 75%;
    transform: translate(-50%, -50%);
    object-fit: cover;
}

.main-2 .content {
    position: absolute;
    width: 62rem;
    top: 17rem;
    left: 4rem;
}

.main-2 .contentParagraph {
    position: absolute;
    font-family: "Poppins", Helvetica;
    font-weight: 400;
    color: #161c25;
    font-size: 19px;
    letter-spacing: 0.92px;
    line-height: 28px;
    top: -5rem;
    height: auto;
    width: 40rem;
    left: 2.6rem;
    text-align: justify;
}

.main-2 .contentheader {
    position: absolute;
    width: 32rem;
    top: -7rem;
    left: 30%;
    text-align: left;
    font-family: "Poppins", Helvetica;
    font-weight: 700;
    font-size: 2.2rem;
    letter-spacing: 0;
    transform: translate(-50%, -50%);
    white-space: nowrap;
    color: #333840;
}


/* MAIN 2 */
@media screen and (max-width: 768px) {
    .main-2 {
        height: 100vh; /* Adjust height for smaller screens */
        padding: 1rem; /* Add padding for better spacing */
        display: flex;
        flex-direction: column;
        align-items: center; /* Center all child elements horizontally */
        justify-content: center; /* Center all child elements vertically */
        text-align: center; /* Center text */
    }
    .main-2 .content {
        width: 90%;
        margin: 1rem 0; /* Center content horizontally with margin for spacing */
    }

    .main-2 .contentParagraph {
        font-size: 1.2rem;
        left: 0;
    }

    .main-2 .contentheader {
        font-size: 2.2rem;
        left: 18rem;
        text-align: center;
        width: auto;
    }
    .main-2 .picture-1 {
        width: 40rem;
    }
    .main-2 .picture-2 {
        width: 40rem;
        top: 70%;
        left: 50%;
    }
}


</style> 
 
    <!-- Main-2 -->
    <div class="main-2">
        <img class="picture-1" src="assets/sathigym.png" alt="SathiGym Logo" />
        <img class="picture-2" src="assets/r-1-1.png" alt="Fitness Image" />
        <div class="content">
            <div class="contentheader">FITNESS TRAINING SATHIGYM</div>  
            <p class="contentParagraph">
                Welcome to SathiGym, the premier platform that connects you with top-rated gyms in your area. Whether you're a seasoned fitness enthusiast or just beginning your journey, SathiGym offers personalized recommendations to help you find the perfect gym tailored to your unique goals and preferences. Explore detailed gym profiles, complete with real customer reviews, state-of-the-art facilities, and expert trainers. With SathiGym, finding the right fitness solution has never been easier. Empower your fitness journey, achieve your health goals, and experience the best gyms near you. Start your path to a healthier, stronger you with SathiGym today!
            </p>
        </div>   
    </div>