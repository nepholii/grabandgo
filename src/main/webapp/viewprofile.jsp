<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Profile – Grab & Go</title>
    <link rel="stylesheet" type="text/css" href="css/viewprofile.css">
</head>
<body>
    <%@ include file="header.jsp" %>
    
    <c:if test="${empty user}">
        <script>window.location.href = 'ViewProfileServlet';</script>
    </c:if>

    <div class="profile-container">
        <h2>Your Profile</h2>
        
        <c:set var="imageFile" value="${sessionScope.image}"/>
        <c:set var="imagePath" value="${not empty imageFile ? 'images/' : 'images/'}${not empty imageFile ? imageFile : 'profile.png'}"/>
        <img src="${imagePath}" alt="Profile Picture" class="profile-pic">
        
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