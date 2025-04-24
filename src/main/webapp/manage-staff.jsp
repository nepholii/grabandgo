<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ include file="admin-header.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <title>Manage Staff</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        html, body {
            height: 100%;
            font-family: 'Segoe UI', sans-serif;
            background-color: #f4f7fa;
            overflow: hidden;
        }

        .navbar {
            height: 60px;
            background-color: #1e1e1e;
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
        }

        .nav-right {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .profile-img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            object-fit: cover;
        }

        .profile-name {
            color: #FFCC00;
            font-weight: 600;
            margin-left: 10px;
        }

        .grid-wrapper {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 90vh;
            padding-top: 20px;
        }

        .grid-row {
            display: flex;
            gap: 40px;
            margin-bottom: 40px;
        }

        .grid-card {
            width: 220px;
            height: 220px;
            background-color: white;
            border-radius: 20px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.08);
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-decoration: none;
            color: #333;
            transition: all 0.3s ease;
        }

        .grid-card:hover {
            transform: scale(1.05);
            box-shadow: 0 8px 20px rgba(0,0,0,0.12);
        }

        .grid-card i {
            font-size: 50px;
            margin-bottom: 15px;
            color: #3498db;
        }

        .grid-card h2 {
            font-size: 18px;
            font-weight: 600;
        }

        @media screen and (max-width: 768px) {
            .grid-row {
                flex-direction: column;
                align-items: center;
            }

            .grid-card {
                width: 180px;
                height: 180px;
            }

            .grid-card i {
                font-size: 40px;
            }

            .grid-card h2 {
                font-size: 16px;
            }
        }
    </style>
</head>
<body>

<div class="grid-wrapper">
    <div class="grid-row">
        <a href="add-staff.jsp" class="grid-card">
            <i class="fas fa-user-plus"></i>
            <h2>Create Staff</h2>
        </a>
        <a href="view-staff.jsp" class="grid-card">
            <i class="fas fa-users"></i>
            <h2>View Staff</h2>
        </a>
    </div>
    <div class="grid-row">
        <a href="update-staff.jsp" class="grid-card">
            <i class="fas fa-user-edit"></i>
            <h2>Update Staff</h2>
        </a>
        <a href="delete-staff.jsp" class="grid-card">
            <i class="fas fa-user-times"></i>
            <h2>Delete Staff</h2>
        </a>
    </div>
</div>

<!-- Font Awesome -->
<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

</body>
</html>
