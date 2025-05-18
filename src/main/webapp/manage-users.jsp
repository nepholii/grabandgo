<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="DAO.UserDAO" %>
<%@ include file="admin-header.jsp" %>

<%
    int kathmanduCount = UserDAO.getUserCountByLocation("Kathmandu");
    int lalitpurCount = UserDAO.getUserCountByLocation("Lalitpur");
    int bhaktapurCount = UserDAO.getUserCountByLocation("Bhaktapur");
    int pokharaCount = UserDAO.getUserCountByLocation("Pokhara");
    int biratnagarCount = UserDAO.getUserCountByLocation("Biratnagar");

    int maleCount = UserDAO.getUserCountByGender("Male");
    int femaleCount = UserDAO.getUserCountByGender("Female");
    int otherCount = UserDAO.getUserCountByGender("Other");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Manage User</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.0/dist/chart.umd.min.js"></script>
    <style>
        :root {
            --primary-color: #E2725B;
            --secondary-color: #F5F5DC;
            --accent1-color: #A0522D;
            --accent2-color: #FFDAB9;
            --header-height: 120px;
            --header-spacing: 20px;
        }

        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: var(--secondary-color);
            margin: 0;
            padding: 0;
        }

        /* CRUD Card Styles (match Manage Staff) */
        .crud-section {
            display: flex;
            justify-content: center;
            gap: 30px;
            padding-top: calc(var(--header-height) + var(--header-spacing));
            flex-wrap: wrap;
        }

        .crud-card {
            width: 220px;
            height: 220px;
            background-color: var(--accent2-color);
            border-radius: 20px;
            box-shadow: 0 4px 16px rgba(0,0,0,0.1);
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-decoration: none;
            color: var(--accent1-color);
            transition: all 0.3s ease;
            font-size: 40px;
        }

        .crud-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 24px rgba(0,0,0,0.15);
            background-color: var(--primary-color);
            color: var(--secondary-color);
        }

        .crud-card h2 {
            font-size: 18px;
            margin-top: 15px;
            text-align: center;
            color: inherit;
        }

        /* Insights Section */
        .insight-wrapper {
            max-width: 1100px;
            margin: 60px auto;
            padding: 20px;
        }

        .insight-wrapper h2 {
            text-align: center;
            color: var(--accent1-color);
            margin-bottom: 30px;
        }

        .charts-container {
            display: flex;
            flex-wrap: wrap;
            gap: 40px;
            justify-content: center;
        }

        .chart-card {
            flex: 1 1 480px;
            background: var(--accent2-color);
            border-radius: 20px;
            padding: 20px;
            box-shadow: 0 4px 16px rgba(0,0,0,0.1);
        }

        .chart-card h3 {
            text-align: center;
            color: var(--accent1-color);
            margin-bottom: 15px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        th, td {
            border: 1px solid var(--accent1-color);
            padding: 8px;
            text-align: center;
            color: var(--accent1-color);
        }

        th {
            background-color: var(--primary-color);
            color: var(--secondary-color);
        }

        @media (max-width: 768px) {
            .crud-card {
                width: 180px;
                height: 180px;
                font-size: 30px;
            }

            .crud-card h2 {
                font-size: 14px;
            }

            .chart-card {
                flex: 1 1 100%;
            }
        }
    </style>
</head>
<body>

<!-- CRUD Cards -->
<div class="crud-section">
    <a href="create-user.jsp" class="crud-card">👤➕<h2>Create User</h2></a>
    <a href="view-user.jsp" class="crud-card">👁️‍🗨️<h2>View User</h2></a>
    <a href="updateUser.jsp" class="crud-card">✏️<h2>Update User</h2></a>
    <a href="delete-user.jsp" class="crud-card">🗑️<h2>Delete User</h2></a>
</div>

<!-- User Insights -->
<div class="insight-wrapper">
    <h2>Customer Insights</h2>
    <div class="charts-container">

        <!-- Location Chart -->
        <div class="chart-card">
            <h3>Top 5 User Locations</h3>
            <canvas id="locationsChart"></canvas>
            <table>
                <tr><th>Location</th><th>Users</th></tr>
                <tr><td>Kathmandu</td><td><%= kathmanduCount %></td></tr>
                <tr><td>Lalitpur</td><td><%= lalitpurCount %></td></tr>
                <tr><td>Bhaktapur</td><td><%= bhaktapurCount %></td></tr>
                <tr><td>Pokhara</td><td><%= pokharaCount %></td></tr>
                <tr><td>Biratnagar</td><td><%= biratnagarCount %></td></tr>
            </table>
        </div>

        <!-- Gender Chart -->
        <div class="chart-card">
            <h3>Gender Ratio Status</h3>
            <canvas id="genderChart"></canvas>
            <table>
                <tr><th>Gender</th><th>Number of Users</th></tr>
                <tr><td>Male</td><td><%= maleCount %></td></tr>
                <tr><td>Female</td><td><%= femaleCount %></td></tr>
                <tr><td>Other</td><td><%= otherCount %></td></tr>
            </table>
        </div>

    </div>
</div>

<script>
    // Locations Bar Chart
    new Chart(document.getElementById('locationsChart'), {
        type: 'bar',
        data: {
            labels: ['Kathmandu', 'Lalitpur', 'Bhaktapur', 'Pokhara', 'Biratnagar'],
            datasets: [{
                label: 'Users',
                data: [<%= kathmanduCount %>, <%= lalitpurCount %>, <%= bhaktapurCount %>, <%= pokharaCount %>, <%= biratnagarCount %>],
                backgroundColor: [
                    'rgba(226, 114, 91, 0.7)',
                    'rgba(255, 218, 185, 0.7)',
                    'rgba(160, 82, 45, 0.7)',
                    'rgba(255, 165, 79, 0.7)',
                    'rgba(210, 180, 140, 0.7)'
                ],
                borderColor: '#fff',
                borderWidth: 2
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true,
                    ticks: { color: '#A0522D' },
                    grid: { color: 'rgba(160, 82, 45, 0.1)' }
                },
                x: {
                    ticks: { color: '#A0522D' },
                    grid: { display: false }
                }
            },
            plugins: {
                legend: { display: false }
            }
        }
    });

    // Gender Pie Chart
    new Chart(document.getElementById('genderChart'), {
        type: 'pie',
        data: {
            labels: ['Male', 'Female', 'Other'],
            datasets: [{
                data: [<%= maleCount %>, <%= femaleCount %>, <%= otherCount %>],
                backgroundColor: [
                    'rgba(226, 114, 91, 0.8)',
                    'rgba(255, 218, 185, 0.8)',
                    'rgba(160, 82, 45, 0.8)'
                ],
                borderColor: '#fff',
                borderWidth: 2
            }]
        },
        options: {
            plugins: {
                legend: { position: 'bottom', labels: { color: '#A0522D' } }
            }
        }
    });
</script>

</body>
</html>
