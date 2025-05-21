<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ include file="admin-header.jsp" %>
<%@ page import="DAO.StaffDAO" %>

<%
    int salaryBelow2k = StaffDAO.getStaffCountBySalaryRange(0, 1999.99);
    int salary2kTo4k = StaffDAO.getStaffCountBySalaryRange(2000, 3999.99);
    int salary4kTo6k = StaffDAO.getStaffCountBySalaryRange(4000, 5999.99);
    int salaryAbove6k = StaffDAO.getStaffCountBySalaryAbove(6000);

    int shiftMorning = StaffDAO.getStaffCountByShift("Morning");
    int shiftAfternoon = StaffDAO.getStaffCountByShift("Afternoon");
    int shiftNight = StaffDAO.getStaffCountByShift("Night");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Manage Staff</title>
    <link rel="stylesheet" type="text/css" href="css/manage-staffs.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.0/dist/chart.umd.min.js"></script>
</head>
<body>

<!-- CRUD Cards -->
<div class="crud-section">
    <a href="create-staff.jsp" class="crud-card">👤➕<h2>Create Staff</h2></a>
    <a href="viewStaff" class="crud-card">👁️‍🗨️<h2>View Staff</h2></a>
    <a href="updateStaff.jsp" class="crud-card">✏️<h2>Update Staff</h2></a>
    <a href="deleteStaff.jsp" class="crud-card">🗑️<h2>Delete Staff</h2></a>
</div>

<!-- Staff Insights -->
<div class="insight-wrapper">
    <h2>Staff Insights</h2>
    <div class="charts-container">

        <!-- Salary Chart -->
        <div class="chart-card">
            <h3>Staff Salary Distribution</h3>
            <canvas id="staffSalaryChart"></canvas>
            <table>
                <tr><th>Salary Range</th><th>Staff Count</th></tr>
                <tr><td>&lt; $2000</td><td><%= salaryBelow2k %></td></tr>
                <tr><td>$2k - $4k</td><td><%= salary2kTo4k %></td></tr>
                <tr><td>$4k - $6k</td><td><%= salary4kTo6k %></td></tr>
                <tr><td>&gt; $6k</td><td><%= salaryAbove6k %></td></tr>
            </table>
        </div>

        <!-- Shift Chart -->
        <div class="chart-card">
            <h3>Staff Shift Distribution</h3>
            <canvas id="staffShiftChart"></canvas>
            <table>
                <tr><th>Shift</th><th>Staff Count</th></tr>
                <tr><td>Morning</td><td><%= shiftMorning %></td></tr>
                <tr><td>Afternoon</td><td><%= shiftAfternoon %></td></tr>
                <tr><td>Night</td><td><%= shiftNight %></td></tr>
            </table>
        </div>

    </div>
</div>

<!-- Chart JS Logic -->
<script>
    new Chart(document.getElementById('staffSalaryChart'), {
        type: 'bar',
        data: {
            labels: ['< $2000', '$2k - $4k', '$4k - $6k', '> $6k'],
            datasets: [{
                label: 'Staff',
                data: [<%= salaryBelow2k %>, <%= salary2kTo4k %>, <%= salary4kTo6k %>, <%= salaryAbove6k %>],
                backgroundColor: 'rgba(153, 102, 255, 0.7)',
                borderColor: 'rgba(153, 102, 255, 1)',
                borderWidth: 1,
                borderRadius: 5
            }]
        },
        options: {
            scales: {
                y: { beginAtZero: true }
            },
            plugins: {
                legend: { display: false }
            }
        }
    });

    new Chart(document.getElementById('staffShiftChart'), {
        type: 'pie',
        data: {
            labels: ['Morning', 'Afternoon', 'Night'],
            datasets: [{
                data: [<%= shiftMorning %>, <%= shiftAfternoon %>, <%= shiftNight %>],
                backgroundColor: [
                    'rgba(255, 159, 64, 0.7)',
                    'rgba(54, 162, 235, 0.7)',
                    'rgba(255, 205, 86, 0.7)'
                ],
                borderColor: '#fff',
                borderWidth: 2
            }]
        },
        options: {
            plugins: {
                legend: { position: 'bottom' }
            }
        }
    });
</script>

</body>
</html>
