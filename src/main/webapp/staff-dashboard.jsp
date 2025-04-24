

<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    String loggedInStaff = (String) session.getAttribute("username");

    int placedOrders = 50;
    int preparingOrders = 25;
    int completedOrders = 75;
%>

<!DOCTYPE html>
<html>
<head>
    <title>Staff Dashboard</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            background: #f4f7fa;
        }

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

        a.logo {
            font-size: 28px;
            font-weight: bold;
            color: #FF9900;
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
            color: #FF9900;
        }

        .nav-right {
            display: flex;
            align-items: center;
            gap: 12px;
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
        }

        .profile-name {
            margin-left: 10px;
            color: #FF9900;
            font-weight: 600;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            display: inline-block;
            max-width: 180px;
        }

        .dashboard-container {
            padding: 100px 20px 20px 20px;
        }

        .card-row {
            display: flex;
            gap: 20px;
            margin-bottom: 30px;
            flex-wrap: wrap;
        }

        .card {
            flex: 1;
            min-width: 200px;
            background: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 3px 8px rgba(0,0,0,0.1);
            text-align: center;
        }

        .card i {
            font-size: 24px;
            margin-bottom: 10px;
            display: block;
        }

        .chart-section {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 3px 8px rgba(0,0,0,0.1);
            margin-top: 20px;
            width: 100%;
        }

        h2 {
            margin-bottom: 20px;
            color: #333;
        }
    </style>
</head>
<body>

<header class="navbar">
    <a href="staff-dashboard.jsp" class="logo">Grab & Go</a>
    <nav>
        <ul class="nav-links">
            <li><a href="staff-dashboard.jsp">Dashboard</a></li>
            <li><a href="manage-orders.jsp">Orders</a></li>
            <li><a href="menu.jsp">Menu</a></li>
        </ul>
    </nav>

    <div class="nav-right">
        <div id="profileContainer" class="profile-info">
            <img src="images/profile.png" alt="Staff" class="profile-img" id="profileImg">
            <% if (loggedInStaff != null) { %>
                <span class="profile-name"><%= loggedInStaff %></span>
            <% } %>
        </div>
    </div>
</header>

<div class="dashboard-container">
    <h2>Staff Dashboard</h2>

    <!-- Stat Cards -->
    <div class="card-row">
        <div class="card">
            <i class="fas fa-clipboard-list"></i>
            <h3><%= placedOrders %></h3>
            <p>Placed Orders</p>
        </div>
        <div class="card">
            <i class="fas fa-hourglass-half"></i>
            <h3><%= preparingOrders %></h3>
            <p>Preparing Orders</p>
        </div>
        <div class="card">
            <i class="fas fa-check-circle"></i>
            <h3><%= completedOrders %></h3>
            <p>Completed Orders</p>
        </div>
    </div>

    <!-- Order Status Chart -->
    <div class="chart-section">
        <h2>Order Status Over Time</h2>
        <canvas id="orderStatusChart" height="300"></canvas>
    </div>
</div>

<!-- Chart.js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    const ctx = document.getElementById('orderStatusChart').getContext('2d');
    const orderStatusChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
            datasets: [
                {
                    label: 'Placed Orders',
                    data: [10, 15, 12, 18, 14, 20, 25],
                    borderColor: '#e67e22',
                    backgroundColor: 'rgba(230, 126, 34, 0.1)',
                    fill: true,
                    tension: 0.4
                },
                {
                    label: 'Preparing Orders',
                    data: [5, 8, 7, 6, 10, 12, 9],
                    borderColor: '#f1c40f',
                    backgroundColor: 'rgba(241, 196, 15, 0.1)',
                    fill: true,
                    tension: 0.4
                },
                {
                    label: 'Completed Orders',
                    data: [8, 10, 15, 12, 18, 22, 30],
                    borderColor: '#2ecc71',
                    backgroundColor: 'rgba(46, 204, 113, 0.1)',
                    fill: true,
                    tension: 0.4
                }
            ]
        },
        options: {
            responsive: true,
            maintainAspectRatio: true,
            aspectRatio: 3,
            scales: {
                y: {
                    beginAtZero: true,
                    ticks: {
                        stepSize: 5
                    }
                }
            }
        }
    });
</script>

</body>
</html>
