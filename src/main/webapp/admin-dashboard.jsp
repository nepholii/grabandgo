<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="DAO.UserDAO" %>
<%
    String loggedInAdmin = (String) session.getAttribute("username");

    int customerCount = UserDAO.getUserCountByRole("Customer"); 
    int staffCount = UserDAO.getUserCountByRole("Staff"); 
    int productCount = 320;
%>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" type="text/css" href="css/admin-dashboard.css">
</head>
<body>

<jsp:include page="admin-header.jsp" />

<div class="dashboard-container">
    <h2>Dashboard</h2>

    <!-- Stat Cards -->
    <div class="card-row">
        <div class="card">
            <div>👥</div>
            <h3><%= customerCount %></h3>
            <p>Customers</p>
        </div>

        <div class="card">
            <div>🧑‍💼</div>
            <h3><%= staffCount %></h3>
            <p>Staff</p>
        </div>

        <div class="card">
            <div>🍔</div>
            <h3><%= productCount %></h3>
            <p>Products</p>
        </div>
    </div>

    <!-- Orders Chart -->
    <div class="chart-section">
        <h2>Orders Placed</h2>
        <canvas id="orderChart" height="300"></canvas>
    </div>
</div>

<!-- Chart.js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    const ctx = document.getElementById('orderChart').getContext('2d');
    const orderChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
            datasets: [{
                label: 'Orders Placed',
                data: [30, 45, 28, 50, 40, 60, 75],
                borderColor: '#E2725B', // Warm Terracotta
                backgroundColor: 'rgba(226, 114, 91, 0.2)', // transparent fill
                fill: true,
                tension: 0.4
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: true,
            aspectRatio: 3,
            scales: {
                y: {
                    beginAtZero: true,
                    ticks: {
                        stepSize: 10
                    }
                }
            }
        }
    });
</script>

</body>
</html>
