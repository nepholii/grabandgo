<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <link rel="stylesheet" type="text/css" href="css/header.css">
</head>

<%
    String loggedInUser = (String) session.getAttribute("username");
%>

<%
    String uri = request.getRequestURI();
%>

<header class="navbar">
    <a href="customer-dashboard.jsp" class="logo">Grab & Go</a>
  
<nav>
    <ul class="nav-links">
    <li>
       <a href="${pageContext.request.contextPath}/CustomerDashboardServlet"
          class="<%= uri.contains("CustomerDashboardServlet") || uri.contains("customer-dashboard") ? "active" : "" %>">Home</a>
    </li>
    <li>
        <a href="MenuServlet"
           class="<%= uri.contains("MenuServlet") || uri.contains("menu") ? "active" : "" %>">Menu</a>
    </li>
    <li>
        <a href="orderhistory.jsp"
           class="<%= uri.contains("orderhistory") ? "active" : "" %>">Order History</a>
    </li>
    <li>
        <a href="aboutus.jsp"
           class="<%= uri.contains("aboutus") ? "active" : "" %>">About us</a>
    </li>
</ul>

</nav>


<div class="nav-right">
  <a href="cart.jsp" title="Cart" style="color: white; font-size: 20px;">
            <i class="fas fa-shopping-cart"></i>
        </a>
   
    <form action="SearchFoodServelet" method="post" style="display: flex; align-items: center; gap: 15px;">
        <input type="text" name="search" class="search-bar" placeholder="Search food..." required />

        
      
    </form>

   
    <div id="profileContainer" class="profile-info">
        <%
            String imageFile = (String) session.getAttribute("image");
            String imagePath = (imageFile != null) ? "uploaded_images/" + imageFile : "images/profile.png";
        %>
        <img src="<%= imagePath %>" alt="User" class="profile-img" id="profileImg">
        <% if (loggedInUser != null) { %>
            <span class="profile-name"><%= loggedInUser %></span>
        <% } %>
    </div>

    
    <div class="dropdown-menu" id="dropdownMenu">
    <a href="viewprofile.jsp"><i class="fas fa-user"></i> View Profile</a>
    <a href="edit-profile.jsp"><i class="fas fa-edit"></i> Edit Profile</a> 
    <a href="LogoutServlet"><i class="fas fa-sign-out-alt"></i> Logout</a>
</div>
    </div>


</header>

<script>
    const profileImg = document.getElementById("profileImg");
    const dropdownMenu = document.getElementById("dropdownMenu");

    profileImg.addEventListener("click", (e) => {
        e.stopPropagation();
        dropdownMenu.style.display = dropdownMenu.style.display === "block" ? "none" : "block";
    });

    document.addEventListener("click", (e) => {
        if (!document.getElementById("profileContainer").contains(e.target)) {
            dropdownMenu.style.display = "none";
        }
    });
</script>