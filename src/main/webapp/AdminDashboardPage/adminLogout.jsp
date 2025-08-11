<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="true" %>
<%
    // Invalidate the session to log out the user
    session.invalidate();
    
    // Redirect to the admin login page
    response.sendRedirect("adminLoginPage.jsp");
%>
