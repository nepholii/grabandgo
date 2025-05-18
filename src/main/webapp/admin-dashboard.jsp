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
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            background: #F5F5DC; /* Creamy Beige */
        }

        .dashboard-container {
            padding: 100px 20px 20px 20px;
        }

        h2 {
            margin-bottom: 20px;
            color: #A0522D; /* Toasted Brown */
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
            background: #FFDAB9; /* Soft Peach */
            border-radius: 12px;
            padding: 20px;
            box-shadow: 0 3px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            transition: transform 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .card div {
            font-size: 40px;
            margin-bottom: 10px;
        }

        .card h3 {
            color: #E2725B; /* Warm Terracotta */
            font-size: 28px;
            margin: 0;
        }

        .card p {
            color: #333;
            font-weight: 500;
        }

        .chart-section {
        background: #FFF8E7; /* Lightened cream for contrast */
        padding: 20px;
        border-radius: 12px;
        box-shadow: 0 3px 8px rgba(0, 0, 0, 0.1);
        margin-top: 20px;
        width: 100%;
        max-width: 900px;      /* fix overflow */
        margin-left: auto;
        margin-right: auto;
    }

    .chart-section canvas {
        width: 100% !important;
        height: 300px !important;
        display: block;
    }
        

        @media screen and (min-width: 1280px) and (max-width: 1920px) {
            .dashboard-container {
                padding-top: 120px;
            }
        }
    </style>
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
