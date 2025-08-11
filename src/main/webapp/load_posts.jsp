



<%@page import="com.gym_website.dao.LikeDao"%>
<%@page import="com.gym_website.entities.User"%>
<%@page import="com.gym_website.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.gym_website.helper.ConnectionProvider"%>
<%@page import="com.gym_website.dao.PostDao"%>
<style>
.card img {
	width: 100%;
	height: 280px;
	object-fit: cover;
	border-bottom: 6px solid #007bff;
	transition: transform 0.4s ease;
}

.card:hover img {
	transform: scale(1.05);
}

.card {
	background-color: #fff;
	border-radius: 15px;
	box-shadow: 0 8px 30px rgba(0, 0, 0, 0.1);
	overflow: hidden;
	transition: transform 0.4s ease, box-shadow 0.4s ease;
}

.card:hover {
	transform: translateY(-15px);
	box-shadow: 0 12px 40px rgba(0, 0, 0, 0.2);
}
.social_icons { 
  display: flex;
  justify-content: center;
  gap: 20px;
  margin-top: 15px;
}

.social_icons span {
  font-size: 1.5rem;
  color: #777;
  transition: color 0.3s ease, transform 0.3s ease;
}

.social_icons span:hover {
  color: #007bff;
  transform: translateY(-5px);
}
</style>
<div class="row">
	<%
	/* User uuu=(User) session.getAttribute("currentUser"); */
	User uuu = (User) session.getAttribute("currentUser");
	if (uuu == null) {
		// Redirect to login if user is not logged in
		response.sendRedirect("login_page.jsp");
		return;
	}
	/* 	Thread.sleep(1000); //1 sec takes to load pages */

	PostDao d = new PostDao(ConnectionProvider.getConnection());
	int cid = Integer.parseInt(request.getParameter("cid"));
	List<Post> posts = null;
	if (cid == 0) {
		posts = d.getAllPosts();

	} else {
		posts = d.getPostByCatId(cid);
	}

	if (posts.size() == 0) {
		out.println("<h3 class='display-3 text-center'>No Posts in this category..</h3>");
		return;
	}

	for (Post p : posts) {
	%>


	<div class="col-md-6 mt-2">

		<div class="card">
			<img class="card-img-top"
				src="<%=application.getContextPath()%>/post_pics/gymPhotos/<%=p.getGym_photo()%>"
				alt="Card image cap">

			<div class="card-body">
				<h2 style="text-align: center;"><%=p.getGym_name()%></h2>
				<p><%=p.getAbout_gym()%></p>
				<div class="social_icons">
					<span><i class="fa fa-brands fa-twitter"></i></span> <span><i
						class="fa fa-brands fa-facebook"></i></span> <span><i
						class="fa fa-brands fa-instagram"></i></span>
				</div>
				<p style="text-align: right; font-size: small; color: gray;"><%=p.getpDate()%></p>
			</div>

			<div class="card-footer primary-background text-center">
				<%
				LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
				%>
				<a href="#!" onclick="doLike(<%=p.getPid()%>, <%=uuu.getId()%>)"
					class="btn btn-outline-light btn-sm"><i
					class="fa fa-thumbs-o-up"></i> <span class="like-counter"><%=ld.countLikeonPost(p.getPid())%></span></a>
				<a href="show_blog_page.jsp?post_id=<%=p.getPid()%>"
					class="btn btn-outline-light btn-sm">Read More...</a> <a href="#"
					class="btn btn-outline-light btn-sm"><i
					class="fa fa-commenting-o"></i> <span>20</span></a>
			</div>

		</div>

	</div>



	<%
	}
	%>
</div>