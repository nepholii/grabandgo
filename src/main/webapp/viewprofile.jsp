<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String username = (String) session.getAttribute("username");
    String firstName = (String) session.getAttribute("first_name");
    String lastName = (String) session.getAttribute("last_name");
    String email = (String) session.getAttribute("email");
    String phone = (String) session.getAttribute("phone");
    String address = (String) session.getAttribute("address");
    String gender = (String) session.getAttribute("gender");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Profile – Grab & Go</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            background-color: #121212;
            color: white;
            font-family: 'Segoe UI', sans-serif;
            padding-top: 60px; /* Space for fixed navbar */
        }

        .profile-container {
            width: 90%;
            max-width: 800px;
            margin: 60px auto;
            background-color: #1e1e1e;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(255, 204, 0, 0.2);
            overflow: hidden;
            transition: all 0.3s ease;
        }

        .profile-container:hover {
            box-shadow: 0 0 20px rgba(255, 204, 0, 0.4); /* Enhanced shadow on hover */
        }

        h2 {
            text-align: center;
            color: #FFCC00;
            margin-bottom: 20px;
            font-size: 32px;
        }

        .profile-pic {
            display: block;
            margin: 0 auto 30px;
            width: 120px;
            height: 120px;
            border-radius: 50%;
            object-fit: cover;
            border: 4px solid #FFCC00;
        }

        .profile-info {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            font-size: 18px;
        }

        .profile-info > div {
            flex-basis: 100%; /* Ensures each section takes full width */
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
        }

        .profile-info label {
            color: #FFCC00;
            font-weight: bold;
            text-align: left;
            width: 150px;
        }

        .profile-info span {
            color: #ffffff;
            word-break: break-word;
            flex: 1;
        }

        .btn-container {
            margin-top: 40px;
            display: flex;
            justify-content: flex-end;
        }

        .btn {
            padding: 12px 28px;
            border: none;
            border-radius: 8px;
            font-weight: bold;
            cursor: pointer;
            font-size: 16px;
            transition: 0.3s ease;
        }

        .edit-btn {
            background-color: #FF3C00;
            color: white;
        }

        .edit-btn:hover {
            background-color: #FFCC00;
            color: black;
        }

        @media screen and (min-width: 1280px) and (max-width: 1920px) {
            .profile-container {
                max-width: 650px;
                padding: 40px;
            }

            .profile-container h2 {
                font-size: 34px;
                margin-bottom: 30px;
            }
        }
    </style>
</head>

<body>

    <%@ include file="header.jsp" %> 
    <div class="profile-container">
        <h2>Your Profile</h2>
        <img src="images/profile.png" alt="Profile Picture" class="profile-pic">
        
        <div class="profile-info">
            <div>
                <label>First Name:</label> 
                <span><%= firstName != null ? firstName : "N/A" %></span>
            </div>
            <div>
                <label>Last Name:</label> 
                <span><%= lastName != null ? lastName : "N/A" %></span>
            </div>
            <div>
                <label>Username:</label> 
                <span><%= username != null ? username : "N/A" %></span>
            </div>
            <div>
                <label>Email:</label> 
                <span><%= email != null ? email : "N/A" %></span>
            </div>
            <div>
                <label>Phone:</label> 
                <span><%= phone != null ? phone : "N/A" %></span>
            </div>
            <div>
                <label>Address:</label> 
                <span><%= address != null ? address : "N/A" %></span>
            </div>
            <div>
                <label>Gender:</label> 
                <span><%= gender != null ? gender : "N/A" %></span>
            </div>
        </div>

        <div class="btn-container">
            <a href="edit-profile.jsp">
                <button class="btn edit-btn">Edit Profile</button>
            </a>
        </div>
    </div>

</body>
</html>
