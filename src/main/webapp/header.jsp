<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <style>
        .navbar {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 60px;
            background-color: #1e1e1e;
            z-index: 999;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 20px;
        }

        .logo {
            font-size: 28px;
            font-weight: bold;
            color: #FFCC00;
            text-decoration: none;
        }

        .nav-links {
            list-style: none;
            display: flex;
            gap: 25px;
        }

        .nav-links li a {
            color: white;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s ease;
        }

        .nav-links li a:hover {
            color: #FFCC00;
        }

        .nav-right {
            display: flex;
            align-items: center;
            gap: 20px;
            position: relative;
        }

        .search-bar {
            padding: 8px 12px;
            border-radius: 12px;
            border: none;
            outline: none;
            font-size: 14px;
        }

        .profile-info {
            display: flex;
            align-items: center;
            cursor: pointer;
        }

        .profile-img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            object-fit: cover;
        }

        .profile-name {
            margin-left: 10px;
            color: #FFCC00;
            font-weight: 600;
        }

        .dropdown-menu {
            display: none;
            position: absolute;
            top: 60px;
            right: 0;
            background-color: #2a2a2a;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
            z-index: 20;
            min-width: 160px;
        }

        .dropdown-menu a {
            display: block;
            padding: 12px 16px;
            color: #fff;
            text-decoration: none;
            transition: background 0.2s ease;
        }

        .dropdown-menu a:hover {
            background-color: #444;
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

            .search-bar {
                width: 220px;
                font-size: 15px;
            }

            .profile-name {
                font-size: 16px;
            }

            .dropdown-menu a {
                font-size: 14px;
            }
        }
    </style>
</head>

<%
    String loggedInUser = (String) session.getAttribute("username");
%>

<header class="navbar">
    <a href="customer-dashboard.jsp" class="logo">Grab & Go</a>
  
<nav>
    <ul class="nav-links">
        <li><a href="customer-dashboard.jsp">Home</a></li>
        <li><a href="MenuServlet">Menu</a></li>
        <li><a href="orderhistory.jsp">Order History</a></li> <!-- ✅ Replaced Cart with Order History -->
        <li><a href="aboutus.jsp">About us</a></li>
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
