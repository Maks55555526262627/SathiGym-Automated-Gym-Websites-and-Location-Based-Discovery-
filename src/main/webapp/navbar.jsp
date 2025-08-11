<nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #3d5afe">
	<a class="navbar-brand"
		href="<%=application.getContextPath()%>/index.jsp"> <img
		src="assets/gym-logo-1.png" alt="SATHIGYM OFFICIAL" id="logo"
		style="width: 40px; height: auto;" />
	</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp"><samp
						class="fa fa-home"></samp> Home <span class="sr-only">(current)</span></a>
			</li>


			<li class="nav-item"><a class="nav-link" href="nearbygym/nearbygym.jsp"><span
					class="fa fa-map-marker"></span> Nearby Gyms</a></li>
			<li class="nav-item"><a class="nav-link" href="about-us.jsp"
				id="aboutUsLink"><span class="fa fa-info-circle"></span> About
					Us</a></li>

			<li class="nav-item"><a class="nav-link" href="contact-us.jsp"
				id="contactLink"><span class="fa fa-envelope"></span> Contact</a></li>

		</ul>
		<div class="ml-auto">
			<a  href="<%=application.getContextPath()%>/login.jsp" class="btn btn-outline-light my-2 my-sm-0">Login</a>
			<a href="<%=application.getContextPath()%>/signup.jsp" class="btn btn-outline-light my-2 my-sm-0">Sign
				Up</a>
		</div>
	</div>
</nav>