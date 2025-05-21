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
    <link rel="stylesheet" type="text/css" href="css/manage-users.css">
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
