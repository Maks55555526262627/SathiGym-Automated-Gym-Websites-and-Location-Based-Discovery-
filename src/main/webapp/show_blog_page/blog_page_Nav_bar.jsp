
<%-- 
	<!--Starting of NavBar  -->
	<%@page import="com.gym_website.entities.User"%>
<nav class="navbar navbar-expand-lg navbar-dark primary-background">
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
			<li class="nav-item active"><a class="nav-link" href="#"><samp
						class="fa fa-home"></samp> Home <span class="sr-only">(current)</span></a>
			</li>


			<li class="nav-item"><a class="nav-link" href="#nearby-gyms"><span
					class="fa fa-map-marker"></span> Nearby Gyms</a></li>
			<li class="nav-item"><a class="nav-link" href="#about-us"
				id="aboutUsLink"><span class="fa fa-info-circle"></span> About
					Us</a></li>

			<li class="nav-item"><a class="nav-link" href="#contact"
				id="contactLink"><span class="fa fa-envelope"></span> Contact</a></li>

			<li class="nav-item"><a class="nav-link" href="<%=application.getContextPath()%>/upload_post/do_post.jsp"
					data-toggle="modal" data-target="#add-post-modal"><span
						class="fa fa-asterisk"></span> Do Post</a></li>

		</ul>

			<ul class="navbar-nav mr-right">
			<li class="nav-item"><a class="nav-link" href="#!"
				data-toggle="modal" data-target="#profile-modal"> <span
					class="fa fa-user-circle "></span> <%=user.getName()%>
			</a></li>

			<li class="nav-item"><a class="nav-link"
				href="<%=application.getContextPath()%>/logoutservlet"><span
					class="fa fa-user-plus"></span> Logout</a></li>
		</ul>

		</div>
	</nav>

	<!--End of NavBar  -->
 --%>