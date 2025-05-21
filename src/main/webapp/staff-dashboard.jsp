

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
    <link rel="stylesheet" type="text/css" href="css/staff-dashboard.css">
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
