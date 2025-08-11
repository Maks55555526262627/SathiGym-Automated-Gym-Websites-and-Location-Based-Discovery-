
<%@page import="com.gym_website.entities.Category"%>
<%@page import="com.gym_website.helper.ConnectionProvider"%>
<%@page import="com.gym_website.dao.PostDao"%>
<%@page import="com.gym_website.entities.Message"%>
<%@page import="com.gym_website.entities.User"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
User user = (User) session.getAttribute("currentUser");
if (user == null) {
	response.sendRedirect("login.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile Page</title>
<!--bootstrap CSS  -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/index.css" type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.banner-background {
	/*website:https://bennettfeely.com/clippy/  */
	clip-path: polygon(0 0, 100% 0, 100% 30%, 100% 91%, 70% 100%, 31% 92%, 0 100%, 0%
		30%);
}
body{
	background-image: url(img/bg-image.jpg);
	background-size: cover;
	background-attachment: fixed;
	background-repeat: no-repeat;
	}
</style>
</head>
<body>
	<!--Starting of NavBar  -->
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
			<li class="nav-item active"><a class="nav-link" href="index.jsp"><samp
						class="fa fa-home"></samp> Home <span class="sr-only">(current)</span></a>
			</li>


			<li class="nav-item"><a class="nav-link" href="#nearby-gyms"><span
					class="fa fa-map-marker"></span> Nearby Gyms</a></li>
			<li class="nav-item"><a class="nav-link" href="#about-us"
				id="aboutUsLink"><span class="fa fa-info-circle"></span> About
					Us</a></li>

			<li class="nav-item"><a class="nav-link" href="#contact"
				id="contactLink"><span class="fa fa-envelope"></span> Contact</a></li>

			<%--  <li class="nav-item"><a class="nav-link" href="<%=application.getContextPath()%>/upload_post/do_post.jsp"
					data-toggle="modal" data-target="#add-post-modal"><span
						class="fa fa-asterisk"></span> Do Post</a></li>  --%>

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

	<%
	Message m = (Message) session.getAttribute("msg");
	if (m != null) {
	%>
	<div class="alert <%=m.getCssClass()%>" role="alert">
		<%=m.getContent()%>
	</div>


	<%
	session.removeAttribute("msg");
	}
	%>




	<!--Main Body of the pages Start  -->
<%@include file="/Profile(Nav_Bar , Main_Page , Proile_Model , Post_Model)/Profile_Main_Body.jsp" %>
	<!--Main Body of the pages End   -->




	<!--Start Profile Model -->

	<!-- Modal -->
	<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header primary-background text-white text-center">
					<h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container text-center">
						<img src="pics/<%=user.getProfile()%>" class="img-fluid"
							style="border-radius: 50%; max-width: 150px"> <br> 
						<h5 class="modal-title mt-3" id="exampleModalLabel"><%=user.getName()%></h5>
						<!--Details  -->

						<div id="profile-details">

							<table class="table">

								<tbody>
									<tr>
										<th scope="row">ID:</th>
										<td><%=user.getId()%></td>

									</tr>
									<tr>
										<th scope="row">Email:</th>
										<td><%=user.getEmail()%></td>

									</tr>
									<tr>
										<th scope="row">Gender:</th>
										<td><%=user.getGender()%></td>

									</tr>
									<tr>
										<th scope="row">Registered on:</th>
										<td><%=user.getRegister_date().toString()%></td>

									</tr>
								</tbody>
							</table>
						</div>



						<!-- profile edit -->
						<div id="profile-edit" style="display: none;">
							<h3 class="mt-2">Please Edit Carefully</h3>
							<form action="<%=application.getContextPath()%>/editservlet"
								method="post" enctype="multipart/form-data">
								<table class="table">
									<tr>
										<td>ID:</td>
										<td><%=user.getId()%></td>
									</tr>
									<tr>
										<td>Name:</td>
										<td><input type="text" class="form-control"
											name="user_name" value="<%=user.getName()%>"></td>
									</tr>
									<tr>
										<td>Email:</td>
										<td><input type="email" class="form-control"
											name="user_email" value="<%=user.getEmail()%>"></td>
									</tr>
									<tr>
										<td>Password:</td>
										<td><input type="password" class="form-control"
											name="user_password" value="<%=user.getPassword()%>">
										</td>
									</tr>
									<tr>
										<td>Gender:</td>
										<td><%=user.getGender().toUpperCase()%></td>
									</tr>
									<tr>
										<td>Update Profile:</td>
										<td><input type="file" name="image" class="form-control">
										</td>
									</tr>

								</table>

								<div class="container">
									<button type="submit" class="btn btn-outline-primary">Save</button>
								</div>
							</form>

						</div>


					</div>


				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button id="edit-profile-button" type="button"
						class="btn btn-primary">EDIT</button>
				</div>
			</div>
		</div>
	</div>


	<!--ENd of Profile Model -->




	<!--Start Post Modal  -->

	<!-- Modal -->
	<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Provide the
						post details..</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<form id="add-post-form" action="addpostservlet" method="post" enctype="multipart/form-data">

						<div class="form-group">
						  <h1 style="text-align: center;">Fill in Your Gym Details</h1>
					 		<select class="form-control" name="cid">
								<option selected disabled>---Select Category---</option>

								<%
								PostDao postd = new PostDao(ConnectionProvider.getConnection());
								ArrayList<Category> list = postd.getAllCategories();
								for (Category c : list) {
								%>
								<option value="<%=c.getCid()%>"><%=c.getName()%></option>

								<%
								}
								%>
							</select> 
						</div>

						<%@include file="/upload_post/do_post.jsp" %>

					</form>


				</div>

			</div>
		</div>
	</div>


	<!--END add post modal-->





	<!--End Post Modal  -->








	<%@include file="script.jsp"%>
</body>
</html>