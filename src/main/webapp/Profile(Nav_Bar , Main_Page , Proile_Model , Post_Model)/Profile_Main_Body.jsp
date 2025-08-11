	
	<!--Main Body of the pages Start  -->
	<%@page import="com.gym_website.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.gym_website.helper.ConnectionProvider"%>
<%@page import="com.gym_website.dao.PostDao"%>
<main>
		<div class="container">
			<div class="row">
				<!--first col  -->
				<div class="col-md-4 mt-4">
					<!--Categories  -->
					<div class="list-group">
					<!--All Post  -->
						<a href="#" onclick="getPosts(0 , this)" class=" c-link list-group-item list-group-item-action active">
							All Posts </a>
						<!--Fetch from db  -->
						<%
							PostDao d= new PostDao(ConnectionProvider.getConnection());
							ArrayList<Category> list1 =d.getAllCategories();
							for(Category cc:list1){
								%>
								<a href="#" onclick="getPosts(<%= cc.getCid() %> , this)" class=" c-link list-group-item list-group-item-action"><%= cc.getName() %></a>
								<% 
							}
						%>
						
					</div>
				</div>
				<!--Second col  -->

				<div class="col-md-8 mt-4">
					<!--Posts  -->
					<div class="container text-center" id="loader">
					<i class="fa fa-refresh fa-4x fa-spin"></i>
					<h3 class="mt-2">Loading...</h3>
					</div>
					
						<div class="container-fluid"  id="post-container">
						
						</div>
					
				</div>

			</div>

		</div>

	</main>

	<!--Main Body of the pages End   -->