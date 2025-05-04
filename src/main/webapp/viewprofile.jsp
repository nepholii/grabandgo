<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            padding-top: 60px;
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
            box-shadow: 0 0 20px rgba(255, 204, 0, 0.4);
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
            flex-basis: 100%;
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
            padding-bottom: 10px;
            border-bottom: 1px solid #333;
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

        .status-Active {
            color: #4CAF50 !important;
        }

        .status-Inactive {
            color: #F44336 !important;
        }

        .btn-container {
            margin-top: 40px;
            display: flex;
            justify-content: flex-end;
            gap: 15px;
        }

        .btn {
            padding: 12px 28px;
            border: none;
            border-radius: 8px;
            font-weight: bold;
            cursor: pointer;
            font-size: 16px;
            transition: 0.3s ease;
            text-decoration: none;
        }

        .edit-btn {
            background-color: #FF3C00;
            color: white;
        }

        .edit-btn:hover {
            background-color: #FFCC00;
            color: black;
        }
        
        .footer {
            background-color: #1e1e1e;
            text-align: center;
            padding: 20px 0;
            font-size: 14px;
            color: #ccc;
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

        @media screen and (max-width: 600px) {
            .profile-info > div {
                flex-direction: column;
                gap: 5px;
            }
            
            .profile-info label {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <%@ include file="header.jsp" %>
    
    <c:if test="${empty user}">
        <script>window.location.href = 'ViewProfileServlet';</script>
    </c:if>

    <div class="profile-container">
        <h2>Your Profile</h2>
        <img src="images/profile.png" alt="Profile Picture" class="profile-pic">
        
        <div class="profile-info">
            <div>
                <label>First Name:</label> 
                <span><c:out value="${not empty user.firstName ? user.firstName : 'N/A'}"/></span>
            </div>
            <div>
                <label>Last Name:</label> 
                <span><c:out value="${not empty user.lastName ? user.lastName : 'N/A'}"/></span>
            </div>
            <div>
                <label>Username:</label> 
                <span><c:out value="${not empty user.username ? user.username : 'N/A'}"/></span>
            </div>
            <div>
                <label>Email:</label> 
                <span><c:out value="${not empty user.email ? user.email : 'N/A'}"/></span>
            </div>
            <div>
                <label>Phone:</label> 
                <span><c:out value="${not empty user.phone ? user.phone : 'N/A'}"/></span>
            </div>
            <div>
                <label>Address:</label> 
                <span><c:out value="${not empty user.address ? user.address : 'N/A'}"/></span>
            </div>
            <div>
                <label>Gender:</label> 
                <span><c:out value="${not empty user.gender ? user.gender : 'N/A'}"/></span>
            </div>
            <div>
                <label>Account Status:</label> 
                <span class="status-${user.status}">
                    <c:out value="${not empty user.status ? user.status : 'N/A'}"/>
                </span>
            </div>
        </div>

        <div class="btn-container">
            <a href="edit-profile.jsp" class="btn edit-btn">Edit Profile</a>
        </div>
    </div>

    <footer class="footer">
	    <p>&copy; 2025 Grab & Go. All rights reserved.</p>
	</footer>
</body>
</html>