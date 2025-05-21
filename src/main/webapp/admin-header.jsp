<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    String loggedInAdmin = (String) session.getAttribute("username");
%>

<link rel="stylesheet" type="text/css" href="css/admin-header.css">


<header class="navbar">
    <a href="admin-dashboard.jsp" class="logo">Grab & Go</a>
    <nav>
        <ul class="nav-links">
            <li><a href="admin-dashboard.jsp">Dashboard</a></li>
            <li><a href="manage-users.jsp">Customers</a></li>
            <li><a href="manage-staffs.jsp">Staff</a></li>
            <li><a href="manage-products.jsp">Products</a></li>
        </ul>
    </nav>

    <div class="nav-right">
        <div id="profileContainer" class="profile-info">
            <img src="images/profile.png" alt="Admin" class="profile-img" id="profileImg">
            <% if (loggedInAdmin != null) { %>
                <span class="profile-name"><%= loggedInAdmin %></span>
            <% } %>
        </div>
        <a href="LogoutServlet" class="logout-button" title="Logout">Logout</a>
    </div>
</header>