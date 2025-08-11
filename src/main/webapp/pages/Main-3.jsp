<style>


/* MAIN 3 */
.main-3 {
    display: flex;
    flex-direction: column;
    align-items: center;
    background: linear-gradient(to bottom, #f0f2f5, #ffffff); /* Add background gradient */
    padding: 3rem 0;
    width: 100%;
    overflow-x: hidden; /* Ensure no unwanted horizontal scroll */
}

.SERVICES-AND {
    width: 45rem;
    margin-bottom: 2rem;
    object-fit: cover;
}

.CARD-CONTAINER {
    display: flex;
    flex-wrap: wrap; /* Allow cards to wrap to the next line */
    gap: 20px;
    justify-content: center; /* Center cards horizontally */
    width: 100%;
    padding: 0 1rem;
    box-sizing: border-box; /* Ensure padding doesn't affect width */
}

.CARD-1 {
    width: 18rem;
    height: 30rem;
    background-color: #ffffff;
    position: relative;
    overflow: hidden;
    border-radius: 15px;
    box-shadow: 0px 10px 30px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease, box-shadow 0.3s ease, background-color 0.3s ease;
}



.CARD-1:hover {
    transform: translateY(-10px);
    box-shadow: 0px 20px 40px rgba(0, 0, 0, 0.2);
    background-color: #fafafa; /* Subtle background change on hover */
}

.PERSONAL-TRAINERS {
    position: absolute;
    width: 17.99rem;
    height: auto;
    top: 223px;
    left: 0;
    font-family: "Poppins", Helvetica;
    font-weight: 700;
    color: #333840;
    font-size: 18px;
    text-align: center;
    line-height: 23px;
    transition: color 0.3s ease;
}

.CARD-1:hover .PERSONAL-TRAINERS {
    color: #ff6347; /* Change text color on hover */
}

.r {
    position: absolute;
    width: 290px;
    height: 220px;
    top: 0;
    left: 0;
    object-fit: cover;
    overflow: hidden;
    transition: transform 0.3s ease, opacity 0.3s ease;
}

.CARD-1:hover .r {
    transform: scale(1.05);
}



.p {
    position: absolute;
    width: 302px;
    height: 225px;
    top: 270px;
    left: 3px;
    right: 2px;
    font-family: "Poppins", Helvetica;
    font-weight: 400;
    color: #161c25;
    font-size: 20px;
    letter-spacing: 0.92px;
    line-height: 30px;
    transition: color 0.3s ease;
    overflow: scroll;
}

.CARD-1:hover .p {
    color: #555;
}

</style> 
 
    <!-- Main-3 -->
    <div class="main-3">
        <img class="SERVICES-AND" src="assets/services-and-facilities.png" />

        <div class="CARD-CONTAINER">
            <div class="CARD-1">
                <p class="PERSONAL-TRAINERS">PERSONAL TRAINERS & FLOOR TRAINERS</p>
                <img class="r" src="assets/r-2-1-2.png" />
                <p class="p">
                    SATHIGYM connects you with top-rated gyms nearby. Explore personalized recommendations and reviews to find the perfect fitness solution tailored to your needs.
                </p>
            </div>
            <div class="CARD-1">
                <p class="PERSONAL-TRAINERS">YOGA INSTRUCTORS</p>
                <img class="r" src="assets/r-2-1-2.png" />
                <p class="p">
                    Find expert yoga instructors for your needs, whether you're a beginner or an advanced practitioner.
                </p>
            </div>
            <div class="CARD-1">
                <p class="PERSONAL-TRAINERS">NUTRITIONISTS</p>
                <img class="r" src="assets/r-2-1-2.png" />
                <p class="p">
                    Connect with top nutritionists to help you achieve your fitness goals with a tailored diet plan.
                </p>
            </div>
            <div class="CARD-1">
                <p class="PERSONAL-TRAINERS">GROUP FITNESS CLASSES</p>
                <img class="r" src="assets/r-2-1-2.png" />
                <p class="p">
                    Join group classes led by experienced trainers, perfect for staying motivated and having fun.
                </p>
            </div>
        </div>
    </div>

