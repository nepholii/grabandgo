<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="DAO.UserDAO" %>
<%@ page import="DAO.FoodDAO" %>
<%
    String loggedInAdmin = (String) session.getAttribute("username");

    int customerCount = UserDAO.getUserCountByRole("Customer"); 
    int staffCount = UserDAO.getUserCountByRole("Staff"); 
    int productCount = new FoodDAO().getFoodCount(); 

    int mainCourseCount = FoodDAO.getCountByCategory("Main Course");
    int dessertCount = FoodDAO.getCountByCategory("Dessert");
    int appetizerCount = FoodDAO.getCountByCategory("Appetizer");
    int beverageCount = FoodDAO.getCountByCategory("Beverage");
    int saladCount = FoodDAO.getCountByCategory("Salad");
    int soupCount = FoodDAO.getCountByCategory("Soup");
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

    <!-- Food Category Chart -->
    <div class="chart-section">
        <h2>Food Distribution By Category</h2>
        <canvas id="categoryChart" height="300"></canvas>
    </div>
</div>

<!-- Chart.js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
const ctx = document.getElementById('categoryChart').getContext('2d');
const categoryChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ['Main Course', 'Dessert', 'Appetizer', 'Beverage', 'Salad', 'Soup'],
        datasets: [{
            label: 'Number of Products',
            data: [<%= mainCourseCount %>, <%= dessertCount %>, <%= appetizerCount %>, <%= beverageCount %>, <%= saladCount %>, <%= soupCount %>],
            backgroundColor: [
                'rgba(255, 99, 132, 0.7)',
                'rgba(255, 159, 64, 0.7)',
                'rgba(255, 205, 86, 0.7)',
                'rgba(75, 192, 192, 0.7)',
                'rgba(54, 162, 235, 0.7)',
                'rgba(153, 102, 255, 0.7)'
            ],
            borderColor: '#fff',
            borderWidth: 2,
            borderRadius: 5
        }]
    },
    options: {
        responsive: true,
        scales: {
            y: {
                beginAtZero: true,
                ticks: { stepSize: 1 }
            }
        },
        plugins: {
            legend: { display: false }
        }
    }
});
</script>

</body>
</html>
