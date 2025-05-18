<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    String loggedInAdmin = (String) session.getAttribute("username");
%>

<style>
.navbar {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 60px;
    background-color: #F5F5DC; /* Creamy Beige */
    z-index: 999;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 0 20px;
    border-bottom: 2px solid #FFDAB9; /* Soft Peach */
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

a.logo {
    font-size: 28px;
    font-weight: bold;
    color: #E2725B; /* Warm Terracotta */
    text-decoration: none;
}

.nav-links {
    list-style: none;
    display: flex;
    gap: 25px;
    margin: 0;
    padding: 0;
}

.nav-links li a {
    color: #333;
    text-decoration: none;
    font-weight: 500;
    transition: color 0.3s ease;
}

.nav-links li a:hover {
    color: #A0522D; /* Toasted Brown */
}

.nav-right {
    display: flex;
    align-items: center;
    gap: 12px;
    position: relative;
}

.profile-info {
    display: flex;
    align-items: center;
    cursor: pointer;
    width: 250px;
    white-space: nowrap;
    overflow: hidden;
}

.profile-img {
    width: 40px;
    height: 40px;
    border-radius: 50%;
    object-fit: cover;
    flex-shrink: 0;
    border: 2px solid #FFDAB9; /* Soft Peach border */
}

.profile-name {
    margin-left: 10px;
    color: #A0522D; /* Toasted Brown */
    font-weight: 600;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    display: inline-block;
    max-width: 180px;
}

@media screen and (min-width: 1280px) and (max-width: 1920px) {
    .navbar {
        padding: 12px 40px;
    }

    .logo {
        font-size: 30px;
    }

    .nav-links {
        gap: 30px;
    }

    .nav-links li a {
        font-size: 16px;
    }

    .profile-name {
        font-size: 16px;
    }
}
</style>

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
    </div>
</header>
