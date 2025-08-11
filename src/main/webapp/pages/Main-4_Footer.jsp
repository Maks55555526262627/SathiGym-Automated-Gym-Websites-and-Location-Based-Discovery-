<style>
@charset "ISO-8859-1";
@import url("https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css");
@import url("https://fonts.googleapis.com/css?family=Poppins:700,600,400|Blinker:700|Crimson+Text:700|Inter:700");




  

/* Footer */
.footer {
    display: grid;
    grid-template-columns: 1fr 1fr 1fr 1fr;
    padding: 10px 100px;
    background-color: #0a0401;
    color: #ffffff;
    overflow: hidden;
    height: 27vh;
    font-family: "Poppins", Helvetica;
}
.footer-item1 {
  display: flex;
  flex-direction: column;
  gap: 10px;
}
.footer-item-2,
.footer-item-3,
.footer-item-4 {
  display: flex;
  flex-direction: column;
  gap: 10px;
}
/* from GPT */
.footer-item-4 .icons {
    display: flex;
    align-items: center;
    margin-bottom: -3.7px;
}

.footer-item-4 .icons img {
    margin-right: 10px; /* Space between icon and text */
    width: 24px; /* Adjust size as needed */
    height: 24px; /* Adjust size as needed */
}

.footer-item-4 .icons p {
    margin: 0; /* Remove default margin */
    font-size: 14px; /* Adjust font size as needed */
}
.footer-item-4 .icons .message {
    width: 24px;
    height: 24px;
}
/* From GPT */


.footer-item-header {
    font-size: 1em;
    font-weight: bold;
    font-family: "Blinker", Helvetica;
    line-height: normal;
    letter-spacing: 2.4px;
}

.connecting-gym {
    font-size: 0.99rem;
    font-weight: 600;
    font-family: "Poppins", Helvetica;
    line-height: normal;
}

.img {
    width: 75px;
    height: 70px;
    object-fit: contain;
}
.imagess {
  display: flex;
  gap: 20px;
}
.insta , .facebook , .vector , .mdi-linkedin , .youtube  {
  width: 2rem;
  height: 1.9rem;
  cursor: pointer;
}

.flexcontainer-1,
.flexcontainer-2,
.flexcontainer-3 {
  display: flex;
  flex-direction: column;
  gap: 10px;
}
.text {
  font-size: 0.9em;
}
.span {
  font-weight: 500;
  letter-spacing: 1.43px;
  font-family: "Crimson Text", Helvetica;
  font-weight: 700;
  font-size: 15px;
  letter-spacing: 1.8px;
  cursor: pointer;
}
.mdi-location , .ant-design-phone , .message {
  width: 2rem;
  height: 1.9rem;
}
.icons {
  display: flex;
  flex-direction: row;
  flex-wrap: nowrap;
  align-items: center;
}

.copyright {
  font-family: "Inter", Helvetica;
  font-weight: 700;
  color: #ffffff;
  font-size: 15px;
  text-align: center;
  letter-spacing: 0;
  line-height: normal;
  margin-top: -1.2rem;
}
.element-sathigym-all {
  position: absolute;
  width: auto;
  left: 50%;
  transform: translate(-50%, -20%);
  object-fit: cover;
}





















/* 3. Footer
Make the footer responsive by adjusting its layout for smaller screens:
 */
/* Footer */
@media screen and (max-width: 768px) {
    .footer {
        grid-template-columns: 1fr 1fr; /* Adjust columns */
        padding: 10px;
        height: 45vh;
    }
    .footer-item1, .footer-item-2, .footer-item-3, .footer-item-4 {
        margin-bottom: 10px;
    }

    .footer-item-header {
        font-size: 0.9em; /* Adjust font size for smaller screens */
    }

    .img {
        width: 60px; /* Adjust image size for smaller screens */
    }

    .copyright {
        font-size: 0.8em; /* Adjust font size for smaller screens */
    }
}







}

</style>
    <!-- Footer -->
    <footer class="footer">
      <div class="footer-item1">
          <img class="img" src="assets/gym-logo-1.png" />
          <p class="connecting-gym">
              Connecting gym owners and fitness enthusiasts on a single
              platform for a streamlined gym experience.
          </p>
          <div class="imagess">
              <img class="insta" src="assets/insta.svg" />
              <img class="facebook" src="assets/facebook.svg" />
              <img class="vector" src="assets/vector.svg" />
              <img class="mdi-linkedin" src="assets/mdi-linkedin.svg" />
              <img class="youtube" src="assets/youtube.svg" />
          </div>
      </div>
    
      <div class="footer-item-2">
          <div class="footer-item-header">Quick links</div>
          <div class="flexcontainer-1">
              <p class="text"><span class="span">Home</span></p>
              <p class="text"><span class="span">Find a Gym</span></p>
              <p class="text"><span class="span">About us</span></p>
              <p class="text"><span class="span">Vlogs</span></p>
              <p class="text"><span class="span">Contact us</span></p>
          </div>
      </div>
    
      <div class="footer-item-3">
          <div class="footer-item-header">Explore more</div>
          <div class="flexcontainer-2">
              <p class="text"><span class="span">FAQs</span></p>
              <p class="text"><span class="span">Privacy policy</span></p>
              <p class="text"><span class="span">Success stories</span></p>
              <p class="text"><span class="span">Terms & Conditions</span></p>
              <p class="text"><span class="span">Disclaimer</span></p>
          </div>
      </div>
    
      <div class="footer-item-4">
          <div class="footer-item-header">Contacts</div>
          <div class="flexcontainer-3">
              <div class="icons">
                  <img class="mdi-location" src="assets/mdi-location.svg" />
                  <p class="text">
                      <span class="span">123 Fitness Road, Kathmandu, Nepal</span>
                  </p>
              </div>
    
              <div class="icons">
                  <img class="ant-design-phone" src="assets/ant-design-phone-outlined.svg" />
                  <p class="text"><span class="span">(+977) 123-456-7890</span></p>
              </div>
    
              <div class="icons">
                  <img class="message" src="assets/message.svg" />
                  <p class="text"><span class="span">info@sathigym.com | support@sathigym.com</span></p>
              </div>
    
              <div class="icons">
                  <img class="message" src="assets/admin.svg" />
                  <a href="AdminDashboardPage/adminLoginPage.jsp">
                   <p class="text"><span class="span">Owner Dashboard</span></p>
                  </a>
                 
              </div>
          </div>
      </div>
    
      <div class="footer-item-5">
          <div class="copyright">
              <p class="element-sathigym-all">
                  © 2024 SathiGym. All rights reserved.
                  <br />
                  SathiGym - Empowering fitness communities, connecting gym owners and customers.
              </p>
          </div>
      </div>
    </footer>
    