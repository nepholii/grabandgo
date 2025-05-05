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
        }

        .grid-wrapper {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding-top: 60px;
        }

        .grid-row {
            display: flex;
            gap: 40px;
            margin-bottom: 40px;
            flex-wrap: wrap;
            justify-content: center;
        }

        .grid-card {
            width: 220px;
            height: 220px;
            background-color: white;
            border-radius: 20px;
            box-shadow: 0 4px 16px rgba(0,0,0,0.1);
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-decoration: none;
            color: #333;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .grid-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 24px rgba(0,0,0,0.15);
        }

        .icon {
            width: 50px;
            height: 50px;
            margin-bottom: 15px;
        }

        .grid-card h2 {
            font-size: 18px;
            font-weight: 600;
        }

        @media screen and (max-width: 768px) {
            .grid-card {
                width: 180px;
                height: 180px;
            }

            .icon {
                width: 40px;
                height: 40px;
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
        <!-- Create Staff -->
        <a href="create-staff.jsp" class="grid-card">
            <svg class="icon" fill="#3498db" viewBox="0 0 24 24">
                <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 
                         10-4.48 10-10S17.52 2 12 2zm1 11h3v2h-3v3h-2v-3H8v-2h3V10h2v3z"/>
            </svg>
            <h2>Create Staff</h2>
        </a>

        <!-- View Staff -->
        <a href="view-staff.jsp" class="grid-card">
            <svg class="icon" fill="#27ae60" viewBox="0 0 24 24">
                <path d="M12 6c-5 0-9 4.5-9 6s4 6 9 6 9-4.5 9-6-4-6-9-6zm0 10a4 4 0 1 1 
                         0-8 4 4 0 0 1 0 8z"/>
            </svg>
            <h2>View Staff</h2>
        </a>
    </div>

    <div class="grid-row">
        <!-- Update Staff -->
        <a href="update-staff.jsp" class="grid-card">
            <svg class="icon" fill="#f39c12" viewBox="0 0 24 24">
                <path d="M3 17.25V21h3.75l11-11.04-3.75-3.75L3 17.25zM20.71 
                         7.04a1.003 1.003 0 0 0 0-1.42l-2.34-2.34a1.003 
                         1.003 0 0 0-1.42 0l-1.83 1.83 3.75 3.75 1.84-1.82z"/>
            </svg>
            <h2>Update Staff</h2>
        </a>

        <!-- Delete Staff -->
        <a href="delete-staff.jsp" class="grid-card">
            <svg class="icon" fill="#e74c3c" viewBox="0 0 24 24">
                <path d="M6 19c0 1.1.9 2 2 2h8c1.1 0 
                         2-.9 2-2V7H6v12zm3.46-7.12L12 13.59l2.54-2.71 
                         1.42 1.42L13.41 15l2.55 2.55-1.42 1.41L12 
                         16.41l-2.55 2.55-1.41-1.41L10.59 15l-2.55-2.55 
                         1.42-1.42zM15.5 4l-1-1h-5l-1 1H5v2h14V4z"/>
            </svg>
            <h2>Delete Staff</h2>
        </a>
    </div>
</div>

</body>
</html>
